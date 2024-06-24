<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\CancelChallengeRequest;
use App\Http\Requests\Api\ExecuteChallengeRequest;
use App\Http\Requests\Api\ForfeitChallengeReadyStateRequest;
use App\Http\Requests\Api\ReadyChallengeRequest;
use App\Http\Requests\Api\SubmitRatingRequest;
use App\Http\Requests\Api\SubmitRecordRequest;
use App\Models\Challenge;
use App\Models\ChallengeAttempt;
use App\Models\ChallengeRating;
use App\Models\ChallengeRecordSubmission;
use App\Models\Price;
use App\Models\ReadyLounge;
use App\Models\Setting;
use App\Models\User;
use App\Models\UserPayment;
use App\Models\WaitingLounge;
use App\Services\Api\ChallengeService;
use App\Traits\SendFirebaseNotificationTrait;
use App\Traits\UserTrait;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class ChallengeController extends Controller
{
    use SendFirebaseNotificationTrait, UserTrait;

    public $challengeService;

    public function __construct(ChallengeService $service)
    {
        $this->middleware(function ($request, $next) {
            LaravelLocalization::setLocale(Auth::user()->default_language);

            return $next($request);
        });

        $this->challengeService = $service;
    }

    public function execute(ExecuteChallengeRequest $request)
    {
        DB::beginTransaction();
        $getPayment = UserPayment::where('user_id', Auth::user()->id)
            ->where('id', $request->payment_id)
            ->first();
//
        if (!$getPayment) {
            return makeResponse('error', __('response_message.invalid_record'), Response::HTTP_FORBIDDEN);
        }

        //match according to city
        $findInLounge = WaitingLounge::where('user_id', '!=', Auth::user()->id)
//            ->where('longitude',$request->lng)
//            ->where('latitude',$request->lat)
            ->where('city', $request->city)
            ->where('price_id', $getPayment->price_id)
            ->where('status', 0)
            ->first();

        if (!$findInLounge) {
            //match according to price
            $findInLounge = WaitingLounge::where('price_id', $getPayment->price_id)
                ->where('status', 0)
                ->where('user_id', '!=', Auth::user()->id)
                ->first();

            if (!$findInLounge) {
                $wait = WaitingLounge::create([
                    'latitude' => $request->lat,
                    'longitude' => $request->lng,
                    'user_id' => Auth::user()->id,
                    'city' => $request->city,
                    'price_id' => $getPayment->price_id
                ]);

                $title = __('challenge_response.wait');
                $message = __('challenge_response.wait_body');
                $notificationType = 0;

                if (Auth::user()->fcm_token) {
                    $this->waitNotification(Auth::user()->fcm_token, $title, $message, $notificationType);
                }

                DB::commit();
                return makeResponse('success', __('challenge_response.wait_body'), Response::HTTP_OK, ['waiting_lounge_id' => $wait->id]);
            }
        }

        $findInLounge->status = 1;
        $findInLounge->save();

        $getWaitingTime = Setting::first();

        $waitingTime = 0;
        if($getWaitingTime)
        {
            $waitingTime = $getWaitingTime->waiting_time;
        }

        $readyLounge = ReadyLounge::create([
            'user_1' => $findInLounge->user_id,
            'user_2' => Auth::user()->id,
            'waiting_lounge_id' => $findInLounge->id,
            'waiting_time' => $waitingTime
        ]);


        $title = __('challenge_response.matched');
        $message = __('challenge_response.matched_body');
        $notificationType = 1;

        $createdAt = Carbon::parse($readyLounge->created_at);
        $waitingTime = $readyLounge->waiting_time; // in seconds

        // Calculate the expiration time
        $expirationTime = $createdAt->copy()->addSeconds($waitingTime);

        // Get the current time
        $currentTime = Carbon::now();


        // Calculate the remaining time in seconds
        if ($currentTime->greaterThanOrEqualTo($expirationTime)) {
            // If the current time is past the expiration time, set timeLeft to 0
            $timeLeft = 0;
        } else {
            // Otherwise, calculate the remaining time
            $timeLeft = $currentTime->diffInSeconds($expirationTime, false);
        }


        if ($readyLounge->user1->fcm_token) {
            $userData = $this->fetchUserRecordForChallengeFromRelation($readyLounge->user2);

            $data = [
                'ready_lounge_id' => $readyLounge->id,
                'otherUserData' => $userData,
                'waiting_time' => $readyLounge->waiting_time,
                'created_at' => $createdAt->format('Y-m-d H:i:s'),
                'time_left' => $timeLeft < 0 ? 0:$timeLeft
            ];

            $this->getReady($readyLounge->user1->fcm_token, $title, $message, $notificationType, $data);
        }

        if (Auth::user()->fcm_token) {
            $userData = $this->fetchUserRecordForChallengeFromRelation($readyLounge->user1);

            $data = [
                'ready_lounge_id' => $readyLounge->id,
                'otherUserData' => $userData,
                'waiting_time' => $readyLounge->waiting_time,
                'created_at' => $createdAt->format('Y-m-d H:i:s'),
                'time_left' => $timeLeft < 0 ? 0:$timeLeft
            ];
            $this->getReady(Auth::user()->fcm_token, $title, $message, $notificationType, $data);
        }

        $otherUser = User::find($findInLounge->user_id);

        $otherUserData = [
            'id' => $otherUser->id,
            'image' => $otherUser->image,
            'full_name' => $otherUser->full_name,
            'nick_name' => $otherUser->nick_name,
            'phone_number' => $otherUser->phone_number,
            'email' => $otherUser->email
        ];



        $data = [
            'ready_lounge_id' => $readyLounge->id,
            'otherUserData' => $otherUserData,
            'waiting_time' => $readyLounge->waiting_time,
            'created_at' => $createdAt->format('Y-m-d H:i:s'),
            'time_left' => $timeLeft < 0 ? 0:$timeLeft
        ];


        DB::commit();
        return makeResponse('success', __('challenge_response.matched_body'), Response::HTTP_OK, $data);
    }

    public function readyForChallenge(ReadyChallengeRequest $request)
    {
        try {
            $readyLoungeID = ReadyLounge::find($request->ready_lounge_id);

            if (!$readyLoungeID) {
                return makeResponse('error', __('response_message.invalid_record'), Response::HTTP_FORBIDDEN);
            }


            $notificationStatus = 1;
            if ($readyLoungeID->user_1 == Auth::user()->id) {
                $readyLoungeID->user1_status = 1;

                if ($readyLoungeID->user2_status == 2) {
                    $notificationStatus = 0;
                }
                $findUser = User::find($readyLoungeID->user_2);

            } elseif ($readyLoungeID->user_2 == Auth::user()->id) {
                $readyLoungeID->user2_status = 1;

                if ($readyLoungeID->user1_status == 2) {
                    $notificationStatus = 0;
                }

                $findUser = User::find($readyLoungeID->user_1);

            }


            $readyLoungeID->save();


            if ($notificationStatus == 1) {
                $title = Auth::user()->full_name . ' ' . __('challenge_response.is_ready');
                $message = Auth::user()->full_name . ' ' . __('challenge_response.is_ready_body');
                $notificationType = 2;
                if ($findUser->fcm_token) {
                    $this->waitNotification($findUser->fcm_token, $title, $message, $notificationType, $readyLoungeID);
                }
            }


            $responseMessage = __('challenge_response.ready_wait_body');
            if (($readyLoungeID->user1_status == 1 && $readyLoungeID->user2_status == 1)
                || ($readyLoungeID->user1_status == 2 && $readyLoungeID->user2_status == 2)) {
                $responseMessage = __('challenge_response.proceed_further');
            }

//            if (Auth::user()->fcm_token) {
//                $title = __('challenge_response.wait');
//                $message = __('challenge_response.ready_wait_body');
//                $notificationType = 3;
//
//                $this->waitNotification(Auth::user()->fcm_token, $title, $message, $notificationType, $readyLoungeID);
//            }


            return makeResponse('success', $responseMessage, Response::HTTP_OK, $readyLoungeID);

        } catch (\Exception $e) {
            return makeResponse('success', __('response_message.error_message_line') . $e, Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function fetchChallenge(ReadyChallengeRequest $request)
    {
        try {
            $readyLoungeId = ReadyLounge::find($request->ready_lounge_id);

            if (!$readyLoungeId) {
                return makeResponse('error', __('response_message.invalid_record'), Response::HTTP_INTERNAL_SERVER_ERROR);
            }

            $challengeAttempt = ChallengeAttempt::where('ready_lounge_id', $readyLoungeId->id)->first();

            if (!$challengeAttempt) {
                $challenge = Challenge::where('price_id', $readyLoungeId->waitingLounge->price_id)
                    ->where('status', 1)
//                    ->where('created_by', '!=', Auth::user()->id)
                    ->inRandomOrder()->first();


                if (!$challenge) {
                    return makeResponse('error', __('response_message.invalid_record'), Response::HTTP_INTERNAL_SERVER_ERROR);
                }

                $challengeAttempt = $this->challengeService->saveRecordInChallengeAttempt($challenge, $readyLoungeId);
            }

        } catch (\Exception $e) {
            return makeResponse('error', __('response_message.error_in_finding_challenge') . ': ' . $e, Response::HTTP_INTERNAL_SERVER_ERROR);
        }


        $challengeAttempt->load('challenge');
        $challengeAttempt->winning_amount = number_format($challengeAttempt->winning_amount, 2);

        return makeResponse('success', __('challenge_response.challenge_started'), Response::HTTP_OK, $challengeAttempt);
    }

    public function submitRecord(SubmitRecordRequest $request)
    {
        $findChallengeAttempt = ChallengeAttempt::find($request->challenge_attempt_id);

        if (!$findChallengeAttempt) {
            return makeResponse('error', __('response_message.invalid_record'), Response::HTTP_UNPROCESSABLE_ENTITY);
        }

//        print_r(Auth::user()->id);
//        return makeResponse('success',Auth::user()->id);
        if ($findChallengeAttempt->challenger_1 == Auth::user()->id || $findChallengeAttempt->challenger_2 == Auth::user()->id) {
            // Logged-in user ID is present in either challenger_1 or challenger_2

            $checkInRecord = ChallengeRecordSubmission::where('challenge_attempt_id', $findChallengeAttempt->id)
                ->where('challenger_id', Auth::user()->id)->first();

            if ($checkInRecord) {
                return makeResponse('error', __('response_message.user_already_submit_response'), Response::HTTP_INTERNAL_SERVER_ERROR);
            }

            $challengeRecordSubmission = new ChallengeRecordSubmission();
            $challengeRecordSubmission->challenger_id = Auth::user()->id;
            $challengeRecordSubmission->submit_record_time = Carbon::now()->format('Y-m-d H:i:s.u');


            $saveRecord = $challengeRecordSubmission->fill(collect($request->validated())->all());
            $saveRecord->save();

            $status = 'in_challenge';

            if ($findChallengeAttempt->readyLounge->user_1 == Auth::user()->id) {
                if ($findChallengeAttempt->readyLounge->user1_status == 2) {
                    $status = 'forfeit';
                }
            } elseif ($findChallengeAttempt->readyLounge->user_2 == Auth::user()->id) {
                if ($findChallengeAttempt->readyLounge->user1_status == 2) {
                    $status = 'forfeit';
                }
            }


            if (Auth::user()->id == $findChallengeAttempt->challenger_1) {
                $user = User::find($findChallengeAttempt->challenger_2);
            } else {
                $user = User::find($findChallengeAttempt->challenger_1);
            }

            if ($status == 'in_challenge') {
                if ($user->fcm_token) {
                    $title = __('challenge_response.record_submit_title');
                    $message = Auth::user()->full_name . ' ' . __('challenge_response.record_submit_body');
                    $notificationType = 4;

                    $this->recordSubmitNotification($user->fcm_token, $title, $message, $notificationType);
                }
                if (sizeof($findChallengeAttempt->challengeRecords) >= 2) {
                    $findChallengeAttempt->is_completed = 1;
                    $findChallengeAttempt->save();
                }

            }


            if (sizeof($findChallengeAttempt->challengeRecords) == 1 && $status == 'forfeit') {
                $findChallengeAttempt->is_completed = 1;
                $findChallengeAttempt->save();
            }


            return makeResponse('success', __('response_message.record_save'), Response::HTTP_OK, $saveRecord);


        } else {
            // Logged-in user ID is not present in either challenger_1 or challenger_2
            return makeResponse('error', __('response_message.user_not_find'), Response::HTTP_UNPROCESSABLE_ENTITY);
        }


    }

    public function rating(SubmitRatingRequest $request)
    {
        try {

            $rating = new ChallengeRating();

            $rating->user_id = Auth::user()->id;
            $saveRecord = $rating->fill(collect($request->validated())->all());
            $saveRecord->save();

            return makeResponse('success', __('title.rating') . ' ' . __('response_message.record_save'), Response::HTTP_CREATED, $saveRecord);


        } catch (\Exception $e) {
            return makeResponse('error',
                __('response_message.error_message_line') . ' ' . __('title.rating') . ': ' . $e,
                Response::HTTP_INTERNAL_SERVER_ERROR);
        }

    }

    public function cancelChallenge(CancelChallengeRequest $request)
    {
        try {
            $waitingLoungeID = WaitingLounge::where('id', $request->waiting_lounge_id)
                ->where('user_id', Auth::user()->id)->first();

            if (!$waitingLoungeID) {
                return makeResponse('error', __('response_message.invalid_waiting_lounge_id'), Response::HTTP_FORBIDDEN);
            }


            if ($waitingLoungeID->status == 1) {
                $userData = $this->fetchUserRecordForChallengeFromRelation($waitingLoungeID->readyLounge->user2);
                $data = [
                    'ready_lounge_id' => $waitingLoungeID->readyLounge->id,
                    'otherUserData' => $userData
                ];

                return makeResponse('error', __('response_message.cancel_already_matched'), Response::HTTP_ALREADY_REPORTED, $data);
            }

            $price = Price::find($waitingLoungeID->price_id);

            $waitingLoungeID->delete();

            Auth::user()->deposit('wallet_1', $price->price);

            return makeResponse('success', __('response_message.challenge_cancel_success'), Response::HTTP_OK);
        } catch (\Exception $e) {
            return makeResponse('error', __('challenge.cancel_error') . ' : ' . $e, Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    public function forfeitChallengeReadyState(ForfeitChallengeReadyStateRequest $request)
    {
        DB::beginTransaction();
        try {
            $readyLounge = ReadyLounge::where('id', $request->ready_lounge_id)->first();

            if (!$readyLounge) {
                return makeResponse('error', __('response_message.invalid_record'), Response::HTTP_FORBIDDEN);
            }

            if ($readyLounge->user_1 == Auth::user()->id) {
                $readyLounge->user1_status = 2;

            } elseif ($readyLounge->user_2 == Auth::user()->id) {
                $readyLounge->user2_status = 2;
            } else {
                return makeResponse('error', __('response_message.invalid_record'), Response::HTTP_FORBIDDEN);
            }

            $readyLounge->save();

        } catch (\Exception $e) {
            DB::rollBack();
            return makeResponse('error', __('challenge.cancel_error') . ' : ' . $e, Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        try {
            $challengeAttempt = ChallengeAttempt::where('ready_lounge_id', $readyLounge->id)->first();

            if (!$challengeAttempt) {
                $challenge = Challenge::where('price_id', $readyLounge->waitingLounge->price_id)
                    ->where('status', 1)
                    ->where('created_by', '!=', Auth::user()->id)
                    ->inRandomOrder()->first();

                if (!$challenge) {
                    return makeResponse('error', __('response_message.invalid_record'), Response::HTTP_INTERNAL_SERVER_ERROR);
                }

                $challengeAttempt = $this->challengeService->saveRecordInChallengeAttempt($challenge, $readyLounge, 'forfeit');
            }

        } catch (\Exception $e) {
            DB::rollBack();
            return makeResponse('error', __('response_message.error_in_finding_challenge') . ': ' . $e, Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        DB::commit();
        return makeResponse('success', __('response_message.challenge_cancel_success'), Response::HTTP_OK);

    }

}
