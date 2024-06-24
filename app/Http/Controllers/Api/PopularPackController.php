<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Price;
use App\Services\Api\ChallengeService;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class PopularPackController extends Controller
{
    public $service;
    public function __construct(ChallengeService $service)
    {
        $this->service = $service;

        $this->middleware(function ($request, $next) {
            LaravelLocalization::setLocale(Auth::user()->default_language);

            return $next($request);
        });
    }

    public function index()
    {
        $getPacks = Price::all();

        $data = $this->service->getPopularPacksResponse($getPacks);

        if(sizeof($data) > 0)
        {
            return makeResponse('success',__('response_message.record_fetch'),Response::HTTP_OK,$data);
        }
        return makeResponse('success', __('response_message.record_not_found'), Response::HTTP_NO_CONTENT, $data);


    }
}
