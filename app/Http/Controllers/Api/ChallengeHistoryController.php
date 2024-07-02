<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\ChallengeAttempt;
use App\Models\ChallengeRating;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class ChallengeHistoryController extends Controller
{
    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            LaravelLocalization::setLocale(Auth::user()->default_language);

            return $next($request);
        });
    }

    public function history()
    {
        $allChallenges = ChallengeAttempt::where('challenger_1',Auth::user()->id)
            ->orWhere('challenger_2',Auth::user()->id)->orderBy('id','desc')->get();

        $challengeArray = array();
        foreach($allChallenges as $challenge)
        {
            $challengeArray[] = [
                'id' => $challenge->id,
                'challenge_title' => isset($challenge->challenge) ? $challenge->challenge->title:'',
                'challenge_image' => isset($challenge->challenge) ? $challenge->challenge->image:'',
                'price_id' =>isset($challenge->challenge->priceRecord) ? $challenge->challenge->priceRecord->id:'',
                'price' =>isset($challenge->challenge->priceRecord) ? $challenge->challenge->priceRecord->price:'',
                'price_title' =>isset($challenge->challenge->priceRecord) ? $challenge->challenge->priceRecord->title:'',
                'challenger_1' => $challenge->challenger_1,
                'challenger_2' => $challenge->challenger_2,
                'winning_amount' => number_format($challenge->winning_amount,2),
                'winner_id' => $challenge->winner_id,
                'is_completed' => $challenge->is_completed,
                'created_at' => Carbon::parse($challenge->created_at)->format('Y-m-d')
            ];
        }

        if(sizeof($challengeArray) > 0)
        {
            return makeResponse('success',__('response_message.record_found'),Response::HTTP_OK,$challengeArray);
        }

        return makeResponse('error',__('response_message.record_not_found'),Response::HTTP_NOT_FOUND);

    }

    public function historyDetail(ChallengeAttempt $challengeAttempt)
    {
        if ($challengeAttempt->challenger_1 == Auth::user()->id || $challengeAttempt->challenger_2 == Auth::user()->id) {

            $records = $challengeAttempt->load("challengeRecords","challengeRecords.challenger",'challenge','ratings');


            return makeResponse('success',__('response_message.record_found'),Response::HTTP_OK,$records);
        }
        else{
            return makeResponse('error', __('response_message.invalid_record'), Response::HTTP_UNPROCESSABLE_ENTITY);
        }
    }



}
