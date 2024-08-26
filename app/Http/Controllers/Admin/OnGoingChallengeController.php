<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\StoreResultRequest;
use App\Models\Challenge;
use App\Models\ChallengeAttempt;
use App\Models\ChallengeRecordSubmission;
use App\Models\ChallengeResult;
use App\Models\Leaderboard;
use App\Models\User;
use App\Notifications\ChallengeResultNotification;
use App\Notifications\PopularPackCreateNotification;
use App\Traits\SendFirebaseNotificationTrait;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Notification;

class OnGoingChallengeController extends Controller
{

    use SendFirebaseNotificationTrait;

    public function index()
    {
        $allChallenges = ChallengeAttempt::all();
        return view('admin.on_going_challenge.listing', compact('allChallenges'));
    }


    public function show(ChallengeAttempt $on_going_challenge)
    {
        $on_going_challenge->load('challenge', 'challenger1', 'challenger2', 'challengeRecords', 'challengeRecords.challenger', 'challengeRecords.challengeResult');
        return view('admin.on_going_challenge.show', with(['challengeAttempt' => $on_going_challenge]));
    }

    public function saveResult($challengeAttemptId, $challengeRecordId, $challengeId, $challengerId, StoreResultRequest $request)
    {
        $findChallengeAttempt = ChallengeAttempt::find($challengeAttemptId);
        if (!$findChallengeAttempt) {
            return makeResponse('error', __('response.message.invalid_challenge_attempt_id'), Response::HTTP_FORBIDDEN);
        }

        $findChallengeRecord = ChallengeRecordSubmission::find($challengeRecordId);
        if (!$findChallengeRecord) {
            return makeResponse('error', __('response.message.invalid_challenge_record_id'), Response::HTTP_FORBIDDEN);
        }

        $findChallenge = Challenge::find($challengeId);
        if (!$findChallenge) {
            return makeResponse('error', __('response.message.invalid_challenge_id'), Response::HTTP_FORBIDDEN);
        }

        $findChallenger = User::find($challengerId);
        if (!$findChallenger) {
            return makeResponse('error', __('response.message.invalid_challenger_id'), Response::HTTP_FORBIDDEN);
        }

        DB::beginTransaction();
        try {
            $challenge = new ChallengeResult();

            $challenge->challenge_attempt_id = $challengeAttemptId;
            $challenge->challenger_record_submission_id = $challengeRecordId;
            $challenge->challenger_id = $challengerId;

            $saveRecord = $challenge->fill(collect($request->validated())->all());

            $saveRecord->save();


        } catch (\Exception $e) {
            return makeResponse('error', __('response_message.error_message_line') . ' ' . __('response_message.record') . ': ' . $e, Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        try {
            $leaderBoard = Leaderboard::where('user_id', $saveRecord->challenger_id)->first();

            if (!$leaderBoard) {
                $leaderBoard = new Leaderboard();
                $leaderBoard->user_id = $saveRecord->challenger_id;
            }

            $leaderBoard->total_likes = $leaderBoard->total_likes + $saveRecord->likes;
            $leaderBoard->total_views = $leaderBoard->total_views + $saveRecord->views;
            $leaderBoard->total_challenge_participation = $leaderBoard->total_challenge_participation + 1;

            $leaderBoard->save();

        } catch (\Exception $e) {
            DB::rollBack();
            return makeResponse('error', __('response_message.error_message_line') . ' ' . __('response_message.record') . ': ' . $e, Response::HTTP_INTERNAL_SERVER_ERROR);

        }


        DB::commit();
        return makeResponse('success', __('response_message.record_save'), Response::HTTP_CREATED);


    }

    public function saveWinner($challengeAttemptId, $challengerId)
    {
        $findChallengeAttempt = ChallengeAttempt::find($challengeAttemptId);
        if (!$findChallengeAttempt) {
            return redirect()->back()->with('error', __('response.message.invalid_challenge_attempt_id'));
        }

        $findChallenger = User::find($challengerId);
        if (!$findChallenger) {
            return redirect()->back()->with('error', __('response.message.invalid_challenger_id'));
        }

        DB::beginTransaction();
        try {
            $findChallengeAttempt->winner_id = $findChallenger->id;

            $findChallengeAttempt->save();


        } catch (\Exception $e) {
            return redirect()->back()->with('error', __('response_message.error_message_line') . ' ' . __('on_going_challenge.winner') . ': ' . $e);
        }

        try {
            $leaderboard = Leaderboard::where('user_id', $findChallengeAttempt->winner_id)->first();

            if (!$leaderboard) {
                $leaderboard = new Leaderboard();
                $leaderboard->user_id = $findChallengeAttempt->winner_id;
            }

            $leaderboard->points = $leaderboard->points + 1;


            $leaderboard->save();

        } catch (\Exception $e) {
            DB::rollBack();
            return redirect()->back()->with('error', __('response_message.error_message_line') . ' ' . __('on_going_challenge.winner') . ': ' . $e);

        }

        $loser = null;
        $forfeit = 0;
        if ($findChallengeAttempt->winner_id == $findChallengeAttempt->challenger_1) {

            if ($findChallengeAttempt->readyLounge->user1_status != 2) {
                $forfeit = 1;
            }

            $loser = User::find($findChallengeAttempt->challenger_2);


        } else {

            if ($findChallengeAttempt->readyLounge->user1_status != 2) {
                $forfeit = 1;
            }
            $loser = User::find($findChallengeAttempt->challenger_1);


        }

        if ($findChallengeAttempt->challenge) {
            $challengeCreator = User::find($findChallengeAttempt->challenge->created_by);
            $challengeCreator->deposit('wallet_2', $findChallengeAttempt->challenge_creator_commission, 'Challenge: ' . $findChallengeAttempt->challenge->title . 'Attempt By: ' . $loser->full_name . ', ' . $findChallengeAttempt->winner->full_name);
        }

        $findChallenger->deposit('wallet_1', $findChallengeAttempt->winning_amount, 'Winning Challenge: ' . $findChallengeAttempt->challenge->title . ' from ' . $loser->full_name);
        Auth::user()->deposit('wallet_3', $findChallengeAttempt->company_commission, 'Challenge: ' . $findChallengeAttempt->challenge->title . 'Attempt By: ' . $loser->full_name . ', ' . $findChallengeAttempt->winner->full_name);

        if ($loser && $loser->fcm_token) {
            if($forfeit == 1)
            {
                $notificationType = 5;
                $title = __('challenge_response.sorry_title');
                $message = __('challenge_response.sorry_body');

                $findChallengeAttempt->makeHidden('winner','readyLounge','challenge');

                $data = [
                    'challenge_attempt_id' => $findChallengeAttempt->id,
                    'challenge_id' => $findChallengeAttempt->challenge_id,
                    'challenge_attempt_record' => $findChallengeAttempt
                ];



//                Log::info('loser');
//                Log::info($loser->fcm_token);

                $this->announcement($loser->fcm_token, $title, $message, $notificationType, $data);

                $type = 'challenge_loser';
                Notification::send($loser,new ChallengeResultNotification($findChallengeAttempt->id,$title,$message,$type));


            }

        }

        if (isset($findChallengeAttempt->winner) && $findChallengeAttempt->winner->fcm_token) {
            $notificationType = 6;
            $title = __('challenge_response.congratulation_title');
            $message = __('challenge_response.congratulation_body') . ' ' . $findChallengeAttempt->winning_amount;

            $findChallengeAttempt->makeHidden('winner','readyLounge','challenge');

            $data = [
                'challenge_attempt_id' => $findChallengeAttempt->id,
                'challenge_id' => $findChallengeAttempt->challenge_id,
                'challenge_attempt_record' => $findChallengeAttempt
            ];

//            Log::info('winner');
//            Log::info($findChallengeAttempt->winner->fcm_token);

            $findWinner = User::find($findChallengeAttempt->winner);
            $this->announcement($findChallengeAttempt->winner->fcm_token, $title, $message, $notificationType, $data);

            $type = "challenge_winner";
            Notification::send($findWinner,new ChallengeResultNotification($findChallengeAttempt->id,$title,$message,$type));

        }


        DB::commit();
        return redirect()->back()->with('success', __('response_message.record_save'));


    }
}
