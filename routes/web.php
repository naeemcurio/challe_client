<?php

use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\PriceController;
use App\Http\Controllers\Admin\SettingController;
use App\Http\Controllers\AuthenticationController;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\ChallengeController;
use App\Http\Controllers\Admin\OnGoingChallengeController;
use App\Http\Controllers\Admin\LeaderBoardController;
use App\Http\Controllers\Admin\WithdrawController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/migrate', function () {
    \Artisan::call('migrate');
    dd('migrated!');
});


Route::get('/migrate-rollback', function () {
    \Artisan::call('migrate:rollback');
    dd('migrate rollback!');
});

Route::get('cache_clear', function () {
    \Artisan::call('optimize:clear');
    \Artisan::call('config:clear');
    \Artisan::call('config:cache');

    dd("All Compile data and Cache is cleared");
});


Route::view('privacy-policy', 'privacy-policy')->name('privacyPolicy');
Route::view('terms-and-conditions', 'terms-conditions')->name('termsAndConditions');
Route::view('delete-user', 'authentication.delete_user')->name('deleteUserView');
Route::post('delete-user',[AuthenticationController::class, 'deleteUser'])->name('deleteUser');

Route::group(['prefix' => LaravelLocalization::setLocale(),
    'middleware' => ['localeSessionRedirect', 'localizationRedirect', 'localeViewPath']
    ], function () {

    Route::middleware('guest')->group(function () {
        Route::view('/', 'authentication.login')->name('adminLogin');

        Route::view('login', 'authentication.login')->name('adminLogin');
        Route::post('login', [AuthenticationController::class, 'login'])->name('loginUser');
        Route::view('register', 'authentication.register')->name('registerForm');
        Route::post('register', [AuthenticationController::class, 'register'])->name('registerUser');
        Route::view('forgot-password', 'authentication.forgotPassword')->name('forgotPassword');
        Route::post('forgot-password', [AuthenticationController::class, 'forgetPassword'])->name('forgotPasswordUser');

        Route::get('reset/password/{token}', [AuthenticationController::class, 'resetPassword'])->name('resetPassword');
        Route::post('change-password', [AuthenticationController::class, 'changePassword'])->name('changePassword');

    });

    Route::middleware('adminAuth')->group(function () {

//        Route::view('dashboard', 'admin.dashboard.dashboard')
//            ->name('adminDashboard');

        Route::get('dashboard', [DashboardController::class, 'index'])
            ->name('adminDashboard');

        Route::get('logout', [AuthenticationController::class, 'logout_web'])->name('logoutUser');

        Route::resource('users',UserController::class);

        Route::resource('challenge', ChallengeController::class);
//        Route::post('save-video-chunks',[ChallengeController::class,'save_video_chunks'])->name('video.uploadChunk');

        Route::resource('on-going-challenge', OnGoingChallengeController::class)->only([
            'index', 'show'
        ]);

        Route::get('on-going-challenge-announce-winner/{on_going_challenge}/{challenger_id}',[OnGoingChallengeController::class,'saveWinner'])->name('on-going-challenge-mark-winner');
        Route::post('on-going-challenge-announce-result/{on_going_challenge}/{challenge_record_id}/{challenge_id}/{challenger_id}',[OnGoingChallengeController::class,'saveResult'])->name('on-going-challenge-result-submit');


        Route::get('leaderboard',[LeaderBoardController::class,'index'])->name('leaderBoard.index');


        Route::get('setting/create',[SettingController::class,'create'])
            ->name('setting.create');
        Route::any('setting/store/{setting?}',[SettingController::class,'store'])
            ->name('setting.store');

        Route::resource('price', PriceController::class);

        Route::get('withdraw-listing', [WithdrawController::class,'index'])
            ->name('withdraw.index');
        Route::get('withdraw-transfer-amount/{withdraw}', [WithdrawController::class,'transfer'])
            ->name('withdraw.transferAmount');


    });
});


Route::get('php-setting',function(){
   phpinfo();
});






