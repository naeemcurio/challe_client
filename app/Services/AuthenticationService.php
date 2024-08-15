<?php

namespace App\Services;


use App\Models\PasswordReset;
use App\Models\User;
use App\Traits\UserTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Str;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class AuthenticationService
{

    use UserTrait;

    public function login($request)
    {
        $credentials = [
            'email' => $request->email,
            'password' => $request->password
        ];
        Session::flush();
        $remember = false;

        $findUser = User::where('email', $request->email)->first();
        if ($findUser && ($findUser->provider == "GMAIL" || $findUser->provider == "APPLE")) {
            return makeResponse('error', __('response_message.social_login_error'), Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        // Check if the user is already logged in
        if ($findUser && Auth::loginUsingId($findUser->id)) {
            Auth::user()->fcm_token = null;
            Auth::user()->save();
            Auth::guard('sanctum')->user()->tokens()->delete();
            Session::flush();
        }

        if ($request->remember_me) {
            $remember = true;
        }

        if (Auth::attempt($credentials, $remember)) {
            if (Request()->route()->getName() == 'mobileLogin') {
                LaravelLocalization::setLocale(Auth::user()->default_language);
                $result = 'success';
                $message = __('response_message.login_success');

                Auth::user()->fcm_token = $request->fcm_token;
                Auth::user()->save();

                $token = Auth::user()->createToken('ChalleApp')->plainTextToken;
                $data = $this->userResponse(Auth::user());
                return makeResponse($result, $message, Response::HTTP_OK, $data, $token);

            } else {
                if (Auth::user()->role_id == 1) {
                    $url = route('adminDashboard');
                } else {
                    $url = route('image.create');
                }
                $result = 'success';
                $message = __('response_message.login_success');

                $data = ['url' => $url];
                return makeResponse($result, $message, Response::HTTP_OK, $data);

            }
        } else {
            return makeResponse('error', __('response_message.invalid_credential'), Response::HTTP_UNPROCESSABLE_ENTITY);
        }
    }


    public function forgetPassword($request)
    {

        $user = User::where('email', $request->email)->first();

        if ($user) {
            $confirmation_code = Str::random(30);
            PasswordReset::insert(['email' => $request->email,
                'token' => $confirmation_code]);

            $user->sendPasswordResetNotification($confirmation_code);
            return makeResponse('success', 'We just emailed a link to reset your password', Response::HTTP_OK);

        } else {
            return makeResponse('error', 'Email Not Found', Response::HTTP_NOT_FOUND);
        }

    }

    public function resetPassword($token)
    {
        $data = PasswordReset::where('token', '=', $token)->first();

        if ($data) {
//            PasswordReset::where('token', '=', $token)->delete();
            PasswordReset::where('email', '=', $data->email)->delete();

            return view('authentication.reset_password', compact('data'));
        } else {
            return redirect()->route('forgotPassword')
                ->with(['error' => 'Token Expire']);

        }

    }

    public function changePassword($request)
    {
        $user = User::find($request->user_id);

        if ($user) {
            $user->password = Hash::make($request->password);
            $user->save();
            return makeResponse('success', __('response_message.password_change'), Response::HTTP_OK);
        } else {
            return makeResponse('error', __('response_message.record_not_found'), Response::HTTP_BAD_REQUEST);
        }
    }

    public function saveUser($request, $user)
    {
        try {

            $user->email = $request->email;

            if ($request->phone_number) {
                $user->phone_number = $request->phone_number;
            }

            if ($request->password) {
                $user->password = bcrypt($request->password);
            }
            $user->role_id = 2;

            if ($request->fcm_token) {
                $user->fcm_token = $request->fcm_token;
            }

            if ($request->provider_id) {
                $user->provider_id = $request->provider_id;
            }

            if ($request->provider) {
                $user->provider = $request->provider;
            }

            $user->save();

            return $user;

        } catch (\Exception $e) {
            return ['result' => 'error', 'message' => $e];
        }

    }

    public function deleteUser($request)
    {
        $credentials = [
            'email' => $request->email,
            'password' => $request->password
        ];

        Session::flush();

        $findUser = User::where('email', $request->email)->first();
        if ($findUser && ($findUser->provider == "GMAIL" || $findUser->provider == "APPLE")) {
            return makeResponse('error', __('response_message.social_login_error'), Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        if (Auth::attempt($credentials)) {
            $result = 'success';
//            $message = __('response_message.login_success');
            Auth::user()->delete();

            return makeResponse('success', __('response_message.user_delete_success'), Response::HTTP_OK);

        } else {
            return makeResponse('error', __('response_message.invalid_credential'), Response::HTTP_UNPROCESSABLE_ENTITY);
        }
    }

    public function deleteUserApi()
    {
        try{
            Auth::user()->delete();

            return makeResponse('success', __('response_message.user_delete_success'), Response::HTTP_OK);

        }

        catch (\Exception $e)
        {
            return makeResponse('error',__('response_message.user_delete_error'),Response::HTTP_INTERNAL_SERVER_ERROR);
        }

    }

}
