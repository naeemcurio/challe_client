<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\SearchHistory;
use App\Services\Api\ChallengeService;
use App\Services\Api\HomeService;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class HomeController extends Controller
{
    public $homeService;
    public $challengeService;

    public function __construct(HomeService $service,ChallengeService $challengeService)
    {
        $this->homeService = $service;

        $this->middleware(function ($request, $next) {
            LaravelLocalization::setLocale(Auth::user()->default_language);

            return $next($request);
        });

        $this->challengeService = $challengeService;
    }

    public function home()
    {
        $getPopularPacks = $this->homeService->getPopularPacks();

        $topRankers = $this->homeService->topRankers();

        $checkForChallenge = $this->challengeService->checkForChallenge();

        $data = [
            'get_popular_packs' => $getPopularPacks,
            'top_rankers' => $topRankers,
            'checkForChallenge' => $checkForChallenge
        ];

        return makeResponse('success', __('response_message.record_fetch'), Response::HTTP_OK, $data);

    }

    public function search(Request $request)
    {
        DB::beginTransaction();
        try{
            $saveSearch = SearchHistory::create(['user_id'=>Auth::user()->id,
                'search_term'=>$request->search]);
        }
        catch (\Exception $e)
        {
            DB::rollBack();
           return makeResponse('error',__('response_message.error_message_line').' '.__('single.sSearch').': '.$e,Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        $fetchSearchRecord = $this->homeService->searchResult($request);

        DB::commit();

        if(sizeof($fetchSearchRecord) > 0)
        {
            return makeResponse('success',__('response_message.record_fetch'),Response::HTTP_OK,$fetchSearchRecord);
        }
        return makeResponse('success', __('response_message.record_not_found'), Response::HTTP_NOT_FOUND);

    }

    public function recentSearch(Request $request)
    {
        $getRecentSearch = $this->homeService->searchHistory();

        if(sizeof($getRecentSearch) > 0)
        {
            return makeResponse('success', __('response_message.record_fetch'), Response::HTTP_OK, $getRecentSearch);

        }

        return makeResponse('success', __('response_message.record_not_found'), Response::HTTP_NOT_FOUND);


    }

}
