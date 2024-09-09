<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Leaderboard;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class LeaderBoardController extends Controller
{
    public function __construct()
    {
        if (Request()->route()->getName() == 'mobileIndex')
        {
            $this->middleware(function ($request, $next) {
                if(Auth::check())
                {
                    LaravelLocalization::setLocale(Auth::user()->default_language);

                }
                return $next($request);

            });
        }
    }

    public function index()
    {
        $leaderBoards = Leaderboard::orderBy('points', 'desc')->get();

        return view('admin.leaderboard.listing', compact('leaderBoards'));
    }

    public function mobileIndex()
    {
        $leaderBoards = Leaderboard::orderBy('points', 'desc')->get();

        $leaderboardArray = array();
        foreach ($leaderBoards as $key => $leaderBoard) {
            $leaderboardArray[] = [
                'id' => $leaderBoard->id,
                'rank' => $key + 1,
                'views' => Leaderboard::abbreviateNumber($leaderBoard->total_views),
                'likes' => Leaderboard::abbreviateNumber($leaderBoard->total_likes),
                'total_challenge_participation' => $leaderBoard->total_challenge_participation,
                'points' => $leaderBoard->points,
//                'avg_challenge_views' => Leaderboard::abbreviateNumber($leaderBoard->total_views / $leaderBoard->total_challenge_participation),
                'avg_challenge_views' => 0,
                'user_id' => $leaderBoard->user_id,
                'image' => $leaderBoard->user->image,
                'full_name' => $leaderBoard->user->full_name,
                'nick_name' => $leaderBoard->user->nick_name,
            ];
        }

        if (sizeof($leaderboardArray) > 0) {
            return makeResponse('success', __('response_message.record_fetch'), Response::HTTP_OK, $leaderboardArray);
        }
        return makeResponse('error', __('response_message.record_not_found'), Response::HTTP_NOT_FOUND, $leaderboardArray);


    }


}
