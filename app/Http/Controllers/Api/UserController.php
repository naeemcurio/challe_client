<?php

namespace App\Http\Controllers\Api;

use App\Helper\ImageUploadHelper;
use App\Http\Controllers\Controller;
use App\Http\Requests\Api\SaveCardRequest;
use App\Http\Requests\Api\StoreUserProfileRequest;
use App\Http\Requests\Api\UpdateLanguageRequest;
use App\Http\Requests\Api\UpdateNotificationRequest;
use App\Http\Requests\Api\UpdateProfileRequest;
use App\Http\Requests\Api\UpdateUserFCMTokenRequest;
use App\Models\UserCard;
use App\Models\UserNotification;
use App\Services\Api\UserService;
use App\Services\PaymentGateway\RapydService;
use App\Traits\UserTrait;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;
use App\Services\PaymentGateway\StripeService;
use App\Services\PaymentGateway\LSPService;

class UserController extends Controller
{
    use UserTrait;

    public $userService;

    public function __construct(UserService $userService)
    {
        $this->userService = $userService;

        $this->middleware(function ($request, $next) {
            LaravelLocalization::setLocale(Auth::user()->default_language);

            return $next($request);
        });
    }

    public function completeProfile(StoreUserProfileRequest $request)
    {
        DB::beginTransaction();
        try {
            $save = $this->userService->save($request, Auth::user());

            if (isset($save['type']) && $save['type'] == 'error') {
                DB::rollBack();
                return makeResponse('error', $save['message'], Response::HTTP_INTERNAL_SERVER_ERROR);

            }
        } catch (\Exception $e) {
            DB::rollBack();
            return makeResponse('error', __('response_message.error_in_saving_user'), Response::HTTP_INTERNAL_SERVER_ERROR);
        }

//        try{
//            $paymentGateway = new StripeService();
//            $createCustomer = $paymentGateway->create_customer_without_token();
//
//            if(isset($createCustomer['type']) && $createCustomer['type'] == 'error')
//            {
//                return makeResponse('error',$createCustomer['message'],$createCustomer['code']);
//            }
//
//
//            Auth::user()->stripe_customer_id = $createCustomer;
//            Auth::user()->save();
//
//        }
//        catch (\Exception $e)
//        {
//            DB::rollBack();
//            return makeResponse('error', __('response_message.error_card_save').$e, Response::HTTP_INTERNAL_SERVER_ERROR);
//        }


//        try {
//            $paymentGateway = new RapydService();
//            $customer = $paymentGateway->createCustomer(Auth::user());
//
//            if (isset($customer['result']) && $customer['result'] == 'error') {
//                DB::rollBack();
//                return makeResponse('error', $customer['message'], Response::HTTP_INTERNAL_SERVER_ERROR);
//            }
//
//            $customer = json_decode($customer);
//            if ($customer->status->status == 'SUCCESS') {
//                Auth::user()->rapyd_customer_id = $customer->data->id;
//                Auth::user()->save();
//            }
//        } catch (\Exception $e) {
//            DB::rollBack();
//            return makeResponse('error', __('response_message.rapyd_error') . ': ' . $e, Response::HTTP_INTERNAL_SERVER_ERROR);
//        }

        DB::commit();
        $data = $this->userResponse(Auth::user());

        return makeResponse('success', __('response_message.profile_completed') . ' ' . __('actions.successfully'), Response::HTTP_CREATED, $data);

    }

    public function updateProfile(UpdateProfileRequest $request)
    {
        try {
            $save = $this->userService->save($request, Auth::user());

            if (isset($save['type']) && $save['type'] == 'error') {
                return makeResponse('error', $save['message'], Response::HTTP_INTERNAL_SERVER_ERROR);
            }
        } catch (\Exception $e) {
            return makeResponse('error', __('response_message.error_in_saving_user'), Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        $data = $this->userResponse(Auth::user());

        return makeResponse('success', __('response_message.profile_completed') . ' ' . __('actions.successfully'), Response::HTTP_OK, $data);

    }

    public function updateNotification(UpdateNotificationRequest $request)
    {
        $notification = Auth::user()->userNotification;

        if (!$notification) {
            $notification = new UserNotification();
            $notification->user_id = Auth::user()->id;
        }

        try {
            $notification->fill($request->validated());

            $notification->save();
        } catch (\Exception $e) {
            return makeResponse('error', __('response_message.error_in_saving_user') . ' ' . __('users.notification') . ': ' . $e, Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        $data = $this->userResponse(Auth::user());
        return makeResponse('success', __('users.notification') . ' ' . __('response_message.record_save'), Response::HTTP_OK, $data);

    }

    public function updateLanguage(UpdateLanguageRequest $request)
    {

        try {
            Auth::user()->default_language = $request->default_language;
            if($request->timezone)
            {
                Auth::user()->timezone =  $request->timezone;
            }
            Auth::user()->save();

            LaravelLocalization::setLocale(Auth::user()->default_language);
        } catch (\Exception $e) {
            return makeResponse('error', __('response_message.error_in_saving_user') . ' ' . __('users.notification') . ': ' . $e, Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        $data = $this->userResponse(Auth::user());
        return makeResponse('success', __('users.default_language') . ' ' . __('actions.update') . ' ' . __('actions.successfully'), Response::HTTP_OK, $data);
    }

    public function refreshUserInfo()
    {
        $data = $this->userResponse(Auth::user());
        return makeResponse('success', __('response_message.record_found')  , Response::HTTP_OK, $data);
    }

    public function updateFCMToken(UpdateUserFCMTokenRequest $request)
    {
        try {
            $save = $this->userService->updateFirebaseToken($request, Auth::user());

            if (isset($save['type']) && $save['type'] == 'error') {
                return makeResponse('error', $save['message'], Response::HTTP_INTERNAL_SERVER_ERROR);
            }
        } catch (\Exception $e) {
            return makeResponse('error', __('response_message.error_in_saving_user'), Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        $data = $this->userResponse(Auth::user());

        return makeResponse('success', __('response_message.update_fcm_key'), Response::HTTP_OK, $data);

    }


}
