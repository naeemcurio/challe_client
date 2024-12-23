<?php

use App\Http\Controllers\Admin\ChatController;
use App\Http\Controllers\Api\CityPayController;
use App\Http\Controllers\Api\NotificationController;
use App\Http\Controllers\Api\UserController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthenticationController;
use App\Http\Controllers\Api\HomeController;
use App\Http\Controllers\Api\PopularPackController;
use App\Http\Controllers\Admin\ChallengeController;
use App\Http\Controllers\Admin\LeaderBoardController;
use App\Http\Controllers\Api\CardController;
use App\Http\Controllers\Api\PaymentController;
use App\Http\Controllers\Api\ChallengeController as Challenge;
use App\Http\Controllers\Api\ChallengeHistoryController;
use App\Http\Controllers\Api\WalletController;
use Illuminate\Support\Facades\Http;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/


Route::group(['prefix' => LaravelLocalization::setLocale(),
    'middleware' => ['localeSessionRedirect', 'localizationRedirect', 'localeViewPath']
], function () {

    Route::post('login', [AuthenticationController::class, 'login'])->name('mobileLogin');
    Route::post('register', [AuthenticationController::class, 'register'])->name('mobileRegister');
    Route::post('social-auth', [AuthenticationController::class, 'socialRegister'])->name('mobileSocialRegister');
    Route::post('change-password',[AuthenticationController::class, 'changePassword'])->name('mobileUpdatePassword');
    Route::get('check-user',[AuthenticationController::class, 'checkUser'])->name('mobileCheckUser');

    Route::middleware('auth:sanctum')->group(function () {
        Route::put('complete-profile', [UserController::class, 'completeProfile'])
            ->name('completeProfile');
        Route::put('update-profile', [UserController::class, 'updateProfile'])
            ->name('updateProfile');
        Route::post('update-notification', [UserController::class, 'updateNotification'])
            ->name('updateNotification');
        Route::post('update-language', [UserController::class, 'updateLanguage'])
            ->name('updateLanguage');

        Route::get('home',[HomeController::class,'home'])->name('home');
        Route::get('search',[HomeController::class,'search'])->name('search');
        Route::get('recent-search',[HomeController::class,'recentSearch'])->name('search');

        Route::get('popular-packs',[PopularPackController::class,'index'])->name('popularPacks');

        Route::post('challenge',[ChallengeController::class,'store'])
            ->name('saveChallenge');

        Route::put('update/challenge/{challenge}',[ChallengeController::class,'update'])
            ->name('updateChallenge');

        Route::get('my-challenges',[ChallengeController::class,'myChallenge'])
            ->name('myChallenge');

        Route::get('leaderboard',[LeaderBoardController::class,'mobileIndex'])
            ->name('mobileIndex');

        Route::post('add-new-card', [CardController::class, 'saveCard'])
            ->name('saveCard');
        Route::get('cards-list', [CardController::class, 'cardList'])
            ->name('cardList');

        Route::post('payment',[PaymentController::class,'payment']);

        Route::get('execute-challenge',[Challenge::class,'execute']);
        Route::get('ready-for-challenge',[Challenge::class,'readyForChallenge']);
        Route::get('fetch-challenge-for-challengers',[Challenge::class,'fetchChallenge']);

        Route::post('submit-record',[Challenge::class,'submitRecord']);
        Route::post('challenge-history',[Challenge::class,'submitRecord']);

        Route::get('history',[ChallengeHistoryController::class,'history']);
        Route::get('history-detail/{challengeAttempt}',[ChallengeHistoryController::class,'historyDetail']);

        Route::get('my-challenge-amount',[WalletController::class,'index']);

        Route::get('wallet',[WalletController::class,'wallet']);
        Route::post('withdraw',[WalletController::class,'withdraw']);
        Route::post('rating',[Challenge::class,'rating']);

        Route::get('notifications',[NotificationController::class,'listing']);

        Route::post('create-stripe-account',[PaymentController::class,'createConnectAccount']);

        Route::get('refresh-stripe-account-link',[PaymentController::class,'refreshConnectAccountLink'])
            ->name('refreshAccountLink');

        Route::post('withdraw-request',[WalletController::class,'withdrawRequest']);


        Route::get('refresh-user-info',[UserController::class,'refreshUserInfo']);

        Route::get('logout',[AuthenticationController::class,'logout'])->name('logout');

        Route::get('cancel-challenge',[Challenge::class,'cancelChallenge'])
            ->name('cancelChallenge');


        Route::get('forfeit-challenge-in-ready-state',[Challenge::class,'forfeitChallengeReadyState'])
            ->name('forfeitChallengeReadyState');

        Route::put('update-fcm-token',[UserController::class,'updateFCMToken']);


        Route::get('delete-user',[AuthenticationController::class, 'deleteUserApi'])->name('deleteUser');

        Route::get('refresh-challenge',[HomeController::class,'refresh'])->name('refresh');

        Route::get('setting',[HomeController::class,'setting'])->name('setting');

        Route::post('update-challenge-record',[Challenge::class,'updateRecord']);
        Route::post('/validate-user', [AuthenticationController::class, 'validateUser']);

        Route::post('lsp-payment',[PaymentController::class,'lspPayment']);
        Route::post('generate-crypto-payment-link',[CityPayController::class,'generatePaymentLink']);


        Route::get('cancel-crypto-payment',[CityPayController::class,'cancelPayment']);
    });
});

//web-hook
Route::post('card-status',[CardController::class,'changeCardStatus']);


Route::post('get-conversation-list',[ChatController::class,'getConversationList']);
Route::post('get-chat-history',[ChatController::class,'getHistory']);
Route::post('send-message',[ChatController::class,'sendMessage']);


Route::post('lsp-webhook',[PaymentController::class,'webhook_response']);


Route::post('crypto-callback',[CityPayController::class,'handleCallback']);

//Route::post('crypto-callback', function (Request $request) {
//
//    \Illuminate\Support\Facades\Log::info('in callback');
//    \Illuminate\Support\Facades\Log::info($request->all());
//});

Route::any('cancel', function (Request $request) {
    \Illuminate\Support\Facades\Log::info('in cancel');
    \Illuminate\Support\Facades\Log::info($request->all());
});

Route::any('success', function (Request $request) {
    \Illuminate\Support\Facades\Log::info('in success');
    \Illuminate\Support\Facades\Log::info($request->all());
});


Route::post('generate-order', function () {

    $rand_number = random_int(1, 2147483647);

    $response = Http::post('https://v2-listener.citypay.io/api/generateOrder', [
        'customer_id' => '3941',
        'access_token' => env('CITY_PAY_ACCESS_TOKEN'),
        'order_id' => $rand_number,
        'order_token' => $rand_number,
        'amount' => '1.00',
    ]);

    // Handle the response
    if ($response->successful()) {
        return response()->json([
            'success' => true,
            'data' => $response->json()
        ]);
    }

    // Handle error
    return response()->json([
        'success' => false,
        'message' => 'Error in API request',
        'error' => $response->body()
    ], $response->status());
});
