<?php

namespace App\Services\Api;


use App\Models\Challenge;
use App\Models\ChallengeAttempt;
use App\Models\ChallengeRating;
use App\Models\Price;
use App\Models\ReadyLounge;
use App\Models\User;
use App\Models\WaitingLounge;
use App\Traits\SendFirebaseNotificationTrait;
use App\Traits\SocketEventTrigger;
use App\Traits\UserTrait;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class ChallengeService
{
    use SendFirebaseNotificationTrait, UserTrait,SocketEventTrigger;

    public function getPopularPacksResponse($data)
    {
        $packArray = array();
        foreach ($data as $key => $price) {

            $getTotalPlayerInSearch = WaitingLounge::where('price_id',$price->id)
                ->where('status',0)->count();

            $averageRating = 0;
            $totalChallengesOfPrice = Challenge::where('price_id', $price->id)
                ->where('status', 1)
                ->get();

            $totalAttempts = 0;
            $totalAverage = 0;

            if (sizeof($totalChallengesOfPrice) > 0) {

                foreach ($totalChallengesOfPrice as $totalChallenge) {
                    $totalAttempts += $totalChallenge->challengeAttempt->count();

                    $totalRating = 0;

                    foreach ($totalChallenge->challengeAttempt as $key => $attempt) {

                        $rating = ChallengeRating::where('challenge_attempt_id', $attempt->id)
                            ->sum('rating');


                        $totalRating += $rating;
                    }


                    $averageRating += $totalRating;
                    // Now you can use $averageRating as the average rating for the current challenge

                }


                $totalAverage = $totalAttempts > 0 ? $averageRating / $totalAttempts : 0;

            }
            $winningAmount = Price::calculateWinningAmount($price);


            $packArray[] = [
                'price' => $price->price,
                'title' => $price->title,
                'id' => $price->id,
                'played_by' => $totalAttempts,
                'avg_rating' => number_format($totalAverage, 1),
                'win_amount' => isset($winningAmount) ? $winningAmount['winning_price'] : 0,
                'challenge_count' => count($totalChallengesOfPrice),
                'total_player_in_search'  => $getTotalPlayerInSearch
            ];
        }
        return $packArray;
    }

    public function saveRecordInChallengeAttempt($challenge, $readyLoungeId)
    {
        $prices = Challenge::calculateWinningAmount($challenge);

        $challengeAttempt = ChallengeAttempt::create([
            'ready_lounge_id' => $readyLoungeId->id,
            'challenge_id' => $challenge->id,
            'challenger_1' => $readyLoungeId->user_1,
            'challenger_2' => $readyLoungeId->user_2,
            'winning_amount' => isset($prices['winning_price']) ? $prices['winning_price'] : 0,
            'company_commission' => isset($prices['company_commission']) ? $prices['company_commission'] : 0,
            'challenge_creator_commission' => isset($prices['challenge_creator_Commission']) ? $prices['challenge_creator_Commission'] : 0,
        ]);

        return $challengeAttempt;
    }

    public function checkForChallenge()
    {
        $response = null;
        $searchPhase = $this->searchLounge();

        if ($searchPhase) {
            $response =
                [
                    'status' => 0,
                    'waiting_lounge_id' => $searchPhase->id,
                    'price' => $searchPhase->price
                ];

            return $response;

        }

        $readyLounge = $this->readyLounge();

        if ($readyLounge) {

            if ($readyLounge->user_1 == Auth::user()->id) {
                $otherUser = User::find($readyLounge->user_2);
            } elseif ($readyLounge->user_2 == Auth::user()->id) {
                $otherUser = User::find($readyLounge->user_1);
            }

            $otherUserData = [
                'id' => $otherUser->id,
                'image' => $otherUser->image,
                'full_name' => $otherUser->full_name,
                'nick_name' => $otherUser->nick_name,
                'phone_number' => $otherUser->phone_number,
                'email' => $otherUser->email
            ];

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

            $response =
                [
                    'status' => 1,
                    'ready_lounge_id' => $readyLounge->id,
                    'otherUserData' => $otherUserData,
                    'price' => $readyLounge->waitingLounge->price,
                    'waiting_time' => $readyLounge->waiting_time,
                    'created_at' => $createdAt->format('Y-m-d H:i:s'),
                    'time_left' => $timeLeft < 0 ? 0:$timeLeft
                ];

            return $response;

        }


        $attempt = $this->attempt();


        if ($attempt) {
            if (!isset($attempt['challenge_status'])) {

                $attempt->load('challenge','readyLounge');

                $timeLeft = 0;
                $otherUserData = array();
                if(isset($attempt->readyLounge))
                {

                    if ($attempt->readyLounge->user_1 == Auth::user()->id) {
                        $otherUser = User::find($attempt->readyLounge->user_2);
                    } elseif ($attempt->readyLounge->user_2 == Auth::user()->id) {
                        $otherUser = User::find($attempt->readyLounge->user_1);
                    }

                    $otherUserData = [
                        'id' => $otherUser->id,
                        'image' => $otherUser->image,
                        'full_name' => $otherUser->full_name,
                        'nick_name' => $otherUser->nick_name,
                        'phone_number' => $otherUser->phone_number,
                        'email' => $otherUser->email
                    ];


                    $createdAt = Carbon::parse($attempt->readyLounge->created_at);
                    $waitingTime = $attempt->readyLounge->waiting_time; // in seconds

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

                }

                // Rename the loaded relationships
//                $attempt->challenge->setRelation('price', $attempt->challenge->getRelation('priceRecord'));

                // Optionally, hide the original relationships if you don't want them in the output
                $attempt->makeHidden('challengeRecords');
                $attempt->challenge->makeHidden('priceRecord');

                $response = [
                    'status' => 2,
                    'attempt' => $attempt,
//                    'challenge' => $attempt->challenge,
                    'price' => $attempt->challenge->priceRecord,
                    'time_left' => $timeLeft,
                    'otherUserData' => $otherUserData
                ];

            }
            return $response;


        }


    }

    public function searchLounge()
    {
        $data = WaitingLounge::where('status', 0)->where('user_id', Auth::user()->id)
            ->orderBy('id','desc')
            ->first();

        return $data;

    }

    public function readyLounge()
    {
        $data = ReadyLounge::where(function (Builder $query) {
            $query->where('user_1', Auth::user()->id)
                ->where('user1_status', 0);
        })
            ->orWhere(function (Builder $query) {
                $query->where('user_2', Auth::user()->id)
                    ->where('user2_status', 0);
            })
            ->orderBy('id','desc')
            ->first();


        return $data;
    }

    public function attempt()
    {
        $data = ChallengeAttempt::where(function (Builder $query) {
            $query->where('challenger_1', Auth::user()->id)
                ->orwhere('challenger_2', Auth::user()->id);
        })
            ->where('is_completed', 0)
            ->orderBy('id','desc')
            ->first();



        if ($data) {

            if($data->readyLounge->user_1 == Auth::user()->id)
            {
                if($data->readyLounge->user1_status == 2)
                {
                    $data['challenge_status'] = 'completed';
                }

                foreach ($data->challengeRecords as $record) {
                    if ($record->challenger_id == Auth::user()->id) {
                        $data['challenge_status'] = 'completed';
                    }
                }

            }

            if($data->readyLounge->user_2 == Auth::user()->id)
            {

                if($data->readyLounge->user2_status == 2)
                {
                    $data['challenge_status'] = 'completed';
                }

                foreach ($data->challengeRecords as $key => $record) {
                    if ($record->challenger_id == Auth::user()->id) {
                        $data['challenge_status'] = 'completed';
                    }
                }



            }



        }

        return $data;

    }

    public function saveRecordInWaitingLounge($getPayment,$request)
    {
        DB::beginTransaction();
        try{
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

            $sendEvent = $this->eventEmit($title, $message, Auth::user()->id, $notificationType);

            if(isset($sendEvent['result']) && $sendEvent['result'] == 'error')
            {
                Log::info($sendEvent['message']);
            }
            DB::commit();
            return makeResponse('success', __('challenge_response.wait_body'), Response::HTTP_OK, ['waiting_lounge_id' => $wait->id]);
        }
        catch (\Exception $e)
        {
            DB::rollBack();
            return makeResponse('error', __('response_message.error_message_line').' '.('response_message.record'),
                Response::HTTP_INTERNAL_SERVER_ERROR);

        }

    }


}
