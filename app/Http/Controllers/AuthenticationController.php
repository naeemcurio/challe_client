<?php

namespace App\Http\Controllers;

use App\Http\Requests\ForgetPasswordRequest;
use App\Http\Requests\LoginRequest;
use App\Http\Requests\RegisterRequest;
use App\Http\Requests\SocialRegisterRequest;
use App\Http\Requests\UpdatePasswordRequest;
use App\Models\User;
use App\Services\AuthenticationService;
use App\Services\PaymentGateway\RapydService;
use App\Traits\UserTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class AuthenticationController extends Controller
{
    use UserTrait;
    public $authService;

    public function __construct(AuthenticationService $service)
    {
        $this->authService =  $service;

//        if(Request()->route()->getName() == 'mobileLogin')
//        {
//            LaravelLocalization::setLocale('ka');
//
//        }
    }

    public function login(LoginRequest $request)
    {
        return $this->authService->login($request);
    }

    public function logout_web()
    {
        Auth::logout();
        Session::flush();
        return redirect()->route('adminLogin')->with('success',__('response_message.logout_success'));
    }


    public function register(RegisterRequest $request)
    {
        DB::beginTransaction();

        try{
            $user =  new User();
            $saveUser = $this->authService->saveUser($request,$user);

            if(isset($saveUser['result']) && $saveUser['result']=='error')
            {
                DB::rollBack();
                return makeResponse('error',__('response_message.error_in_saving_user').': '.$saveUser['message'],Response::HTTP_INTERNAL_SERVER_ERROR);
            }
        }
        catch (\Exception $e)
        {
            DB::rollBack();
            return makeResponse('error',__('response_message.error_in_saving_user').': '.$e,Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        try{
            Auth::loginUsingId($saveUser->id);
            $token = Auth::user()->createToken('ChalleApp')->plainTextToken;

            $data = $this->userResponse(Auth::user());
        }
        catch (\Exception $e)
        {
            DB::rollBack();
            return makeResponse('error',__('response_message.token_error').': '.$e,Response::HTTP_INTERNAL_SERVER_ERROR);
        }
//
        DB::commit();
        return makeResponse('success', __('response_message.register_success'), Response::HTTP_CREATED, $data,$token);
    }


//    public function forgotPassword(ForgotPasswordRequest $request)
//    {
//        return $this->authService->forgotPassword($request);
//    }
//
//    public function resetPassword(ResetPasswordRequest $request)
//    {
//        return $this->authService->resetPassword($request);
//    }

    public function changePassword(UpdatePasswordRequest $request)
    {
        return $this->authService->changePassword($request);
    }

    public function socialRegister(SocialRegisterRequest $request)
    {
        try{
            $check = User::where('provider_id', $request->provider_id)
                ->where('provider', $request->provider)->first();


            if($check)
            {
                $user = $check;
                $message = __('response_message.login_success');
                $statusCode = Response::HTTP_OK;
            }
            else{

                $checkEmail = User::where('email', $request->email)->first();
                if($checkEmail)
                {
                    return makeResponse('error', __('response_message.unique_email'), Response::HTTP_UNPROCESSABLE_ENTITY);
                }

//                $checkPhoneNumber = User::where('phone_number', $request->phone_number)->first();
//                if($checkPhoneNumber)
//                {
//                    return makeResponse('error', __('response_message.unique_phone_number'), Response::HTTP_UNPROCESSABLE_ENTITY);
//                }

                $user = new User;
                $message = __('response_message.register_success');
                $statusCode = Response::HTTP_CREATED;
            }

            $saveUser = $this->authService->saveUser($request,$user);

            if(isset($saveUser['result']) && $saveUser['result']=='error')
            {
                return makeResponse('error',__('response_message.error_in_saving_user').': '.$saveUser['message'],Response::HTTP_INTERNAL_SERVER_ERROR);
            }
        }
        catch (\Exception $e)
        {
            return makeResponse('error',__('response_message.error_in_saving_user').': '.$e,Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        //create User Token and Response
        try{
            if ($saveUser && Auth::loginUsingId($saveUser->id)) {
                Auth::user()->fcm_token = null;
                Auth::user()->save();
                Auth::guard('sanctum')->user()->tokens()->delete();
                Session::flush();
            }


            Auth::loginUsingId($saveUser->id);
            $token = Auth::user()->createToken('ChalleApp')->plainTextToken;

            $data = $this->userResponse(Auth::user());
        }
        catch (\Exception $e)
        {
            return makeResponse('error',__('response_message.token_error').': '.$e,Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        return makeResponse('success',$message,$statusCode,$data,$token);
    }

    public function checkUser(Request $request)
    {
        if($request->email)
        {
            $user = User::where('email',$request->email)->first();
        }
        elseif($request->phone_number)
        {
            $user = User::where('phone_number',$request->phone_number)->first();
        }
        else{
            return makeResponse('error',__('response_message.record_not_found'),Response::HTTP_NO_CONTENT);
        }

        if(!$user)
        {
            return makeResponse('error',__('response_message.record_not_found'),Response::HTTP_NOT_FOUND);
        }

        $data= ['id'=>$user->id,'phone_number'=>$user->phone_number,'email'=>$user->email];
        return makeResponse('success',__('response_message.record_found'),Response::HTTP_OK,$data);
    }

    public function logout()
    {
        Auth::user()->fcm_token = null;
        Auth::user()->save();
        Auth::guard('sanctum')->user()->tokens()->delete();
        Session::flush();

        return makeResponse('success',__('response_message.logout_success'),Response::HTTP_OK);
    }

    public function deleteUser(LoginRequest $request)
    {
        return $this->authService->deleteUser($request);
    }


    public function deleteUserApi()
    {
        return $this->authService->deleteUserApi();
    }

    public function validateUser(Request $request)
    {
        return response()->json(['userId' => $request->user()->id]);
    }

}
