<?php

namespace App\Http\Controllers\Admin;

use App\DataTables\ChallengeListing;
use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\ChallengeStoreRequest;
use App\Http\Requests\Admin\ChallengeUpdateRequest;
use App\Models\Challenge;
use App\Models\ChallengeAttempt;
use App\Models\ChallengeRating;
use App\Models\Price;
use App\Models\User;
use App\Services\Admin\ChallengeService;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\View\View;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class ChallengeController extends Controller
{
    public $challengeService;

    public function __construct(ChallengeService $challengeService)
    {
        $this->challengeService = $challengeService;

        if (Request()->route()->getName() == 'saveChallenge' ||
            Request()->route()->getName() == 'myChallenge') {
            $this->middleware(function ($request, $next) {
                LaravelLocalization::setLocale(Auth::user()->default_language);
                return $next($request);
            });
        }

    }

//    public function index(Request $request)
//    {
//        $challenges = Challenge::all();
//
//        return view('admin.challenge.listing', compact('challenges'));
//    }


    public function index(ChallengeListing $dataTable)
    {

        return $dataTable->render('admin.challenge.listing');

    }

    public function create(Request $request)
    {
        $users = User::where('is_profile_complete',1)->get();
        $prices = Price::all();

        return view('admin.challenge.create', compact('users', 'prices'));
    }

    public function store(ChallengeStoreRequest $request)
    {
        $challenge = new Challenge();
        try {
            $saveChallenge = $this->challengeService->saveRecordInDB($request, $challenge);
        } catch (\Exception $e) {
            return makeResponse('error', __('response_message.error_message_line') . ' ' . __('title.challenge') . ' ' . ('response_message.record') . ': ' . $e, Response::HTTP_INTERNAL_SERVER_ERROR);
        }


        return makeResponse('success', __('response_message.record_save'), Response::HTTP_CREATED, $saveChallenge);
    }

    public function show(Request $request, Challenge $challenge)
    {
        return view('challenge.show', compact('challenge'));
    }

    public function edit(Request $request, Challenge $challenge)
    {
        $users = User::where('is_profile_complete',1)->get();
        $prices = Price::all();

        return view('admin.challenge.edit', compact('challenge', 'users', 'prices'));
    }

    public function update(ChallengeUpdateRequest $request, Challenge $challenge)
    {
        if (Request()->route()->getName() == 'updateChallenge') {
            if ($challenge->created_by != Auth::user()->id) {
                return makeResponse('error', __('response_message.invalid_record'), Response::HTTP_FORBIDDEN);
            }
        }

        try {
            $saveChallenge = $this->challengeService->saveRecordInDB($request, $challenge);
        } catch (\Exception $e) {
            return makeResponse('error', __('response_message.error_message_line') . ' ' . __('title.challenge') . ' ' . ('response_message.record') . ': ' . $e, Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        if (Request()->route()->getName() == 'updateChallenge') {
            return makeResponse('success', __('response_message.record_update'), Response::HTTP_OK, $saveChallenge);
        } else {
            return makeResponse('success', __('response_message.record_updated'), Response::HTTP_NO_CONTENT, $saveChallenge);
        }
    }

    public function destroy(Challenge $challenge)
    {
        try {
            $challenge->delete();

            return makeResponse('success', __('response_message.record_delete_success'), Response::HTTP_NO_CONTENT);
        } catch (\Exception $e) {
            return makeResponse('error', __('response_message.delete_record_error') . ': ' . $e, Response::HTTP_INTERNAL_SERVER_ERROR);

        }

    }

    public function myChallenge()
    {
        $challenges = Challenge::where('created_by', Auth::user()->id)->get();

        $challengeArray = array();

        foreach ($challenges as $challenge) {
            $totalAttempts = $challenge->challengeAttempt->count();
            $totalRating = 0;
            $averageRating = 0;
            foreach ($challenge->challengeAttempt as $attempt) {
                $rating = ChallengeRating::where('challenge_attempt_id', $attempt->id)
                    ->avg('rating');


                $totalRating += $rating;
            }

            $averageRating += $totalAttempts > 0 ? $totalRating / $totalAttempts : 0;


            $winningAmount = Challenge::calculateWinningAmount($challenge);
            $challengeArray[] = [
                'id' => $challenge->id,
//                'title' => $challenge->title,
                'description' => $challenge->description,
                'price_id' => $challenge->price_id,
                'price' => $challenge->price,
                'image' => $challenge->image,
                'video' => $challenge->video,
                'created_by' => $challenge->created_by,
                'status' => $challenge->status == 1 ? __('options.approved'):__('options.disapproved'),
                'winning_amount' => $winningAmount['winning_price'],
                'avg_rating' => number_format($averageRating, 1)
            ];
        }

        if (sizeof($challengeArray)) {
            return makeResponse('success', __('response_message.record_fetch'), Response::HTTP_OK, $challengeArray);
        }
        return makeResponse('success', __('response_message.record_not_found'), Response::HTTP_NOT_FOUND, $challenges);


    }

    public function removeImage(Request $request, $id)
    {
        $challenge = Challenge::findOrFail($id);

        if ($challenge->image) {
            try {
                // Delete the image from storage
                Storage::delete($challenge->image);
                $challenge->image = null;
                $challenge->save();

                return makeResponse('success', __('challenge.image').' '.__('actions.delete').' '.__('actions.successfully'), Response::HTTP_OK);

            } catch (\Exception $e) {
                return makeResponse('error', __('response_message.delete_record_error').': '.$e, Response::HTTP_INTERNAL_SERVER_ERROR);

            }
        }
        return makeResponse('error', __('response_message.record_not_found'), Response::HTTP_BAD_REQUEST);

    }

    public function removeVideo(Request $request, $id)
    {
        $challenge = Challenge::findOrFail($id);

        if ($challenge->video) {
            try {
                // Delete the video from storage
                Storage::delete($challenge->video);
                $challenge->video = null;
                $challenge->save();

                return makeResponse('success', __('challenge.video').' '.__('actions.delete').' '.__('actions.successfully'), Response::HTTP_OK);

            } catch (\Exception $e) {
                return makeResponse('error', __('response_message.delete_record_error').': '.$e, Response::HTTP_INTERNAL_SERVER_ERROR);
            }
        }

        return makeResponse('error', __('response_message.record_not_found'), Response::HTTP_BAD_REQUEST);
    }




}
