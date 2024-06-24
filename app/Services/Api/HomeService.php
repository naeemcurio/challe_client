<?php

namespace App\Services\Api;


use App\Models\Challenge;
use App\Models\ChallengeRating;
use App\Models\Leaderboard;
use App\Models\Price;
use App\Models\SearchHistory;
use App\Models\User;
use Illuminate\Support\Facades\Auth;

class HomeService
{
    public function getPopularPacks()
    {
        $getChallengePrice = Price::limit('6')->get();

        $challengeClass = ChallengeService::class;
        $challengeServiceObject = new $challengeClass();
        $getPacks = $challengeServiceObject->getPopularPacksResponse($getChallengePrice);

        return $getPacks;

    }

    public function topRankers()
    {
        $leaderBoards  = Leaderboard::orderBy('points','desc')->take('6')->get();


        $leaderBoardArray = array();
        foreach($leaderBoards as $leaderBoard)
        {
            $leaderBoardArray[] = [
                'user_id' => $leaderBoard->user->id,
                'image' => $leaderBoard->user->image,
                'full_name' => $leaderBoard->user->full_name,
                'nick_name' => $leaderBoard->user->nick_name,
                'total_views' =>  Leaderboard::abbreviateNumber($leaderBoard->total_views)
            ];
        }

        return $leaderBoardArray;

    }

    public function searchResult($request)
    {

        $users = User::where('full_name','like','%'.$request->search.'%')
            ->where('is_profile_complete',1)
            ->get();

        // Initialize an empty array to store search results
        $searchResults = [];

        // Fetch user numbers from the Leaderboard table
        $leaderboard = Leaderboard::orderBy('points', 'desc')->get();

        // Iterate through the leaderboard records to find the numbers of matched users
        foreach ($users as $user) {

            $userNumber = $this->getUserNumber($user, $leaderboard);



            $searchResults[] = [
                'user_id' => $user->id,
                'full_name' => $user->full_name,
                'nick_name' => $user->nick_name,
                'views' =>$user->leaderBoard ?  Leaderboard::abbreviateNumber($user->leaderBoard->total_views):0,
                'likes' =>$user->leaderBoard ? Leaderboard::abbreviateNumber($user->leaderBoard->total_likes):0,
                'total_challenge_participation' =>$user->leaderBoard ? $user->leaderBoard->total_challenge_participation:0,
                'avg_challenge_views' =>$user->leaderBoard ? Leaderboard::abbreviateNumber($user->leaderBoard->total_views / $user->leaderBoard->total_challenge_participation):0,
                'rank' => $userNumber ?? 0,
                'points' =>isset($user->leaderBoard) ?  $user->leaderBoard->points:0,
                'image' => $user->image,

            ];
        }

        return $searchResults;

    }

    public function searchHistory()
    {
        $recentSearches =  SearchHistory::where('user_id',Auth::user()->id)
            ->select('search_term')
            ->orderBy('created_at', 'desc')
            ->take(4)
            ->get();

        if ($recentSearches->count() > 4) {
            $oldestSearch = $recentSearches->last();
            $oldestSearch->delete();
        }

        return $recentSearches;
    }

    private function getUserNumber($user, $leaderboard)
    {
        foreach ($leaderboard as $index => $record) {
            if ($record->user_id == $user->id) {
                return $index + 1; // Add 1 to convert zero-based index to 1-based number
            }
        }

        return null; // Return null if the user is not found in the leaderboard
    }

}
