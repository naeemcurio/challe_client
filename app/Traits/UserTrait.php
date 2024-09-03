<?php

namespace App\Traits;

trait UserTrait
{
    public function userResponse($user)
    {
        $data = [
            'id' => $user->id,
            'full_name' => $user->full_name,
            'email' => $user->email,
            'fcm_token' => $user->fcm_token,
            'nick_name' => $user->nick_name,
            'image' => $user->image,
            'gender' => $user->gender,
            'default_language' => $user->default_language,
            'date_of_birth' => $user->date_of_birth,
            'wallet_amount' => $user->walletBalance,
            'phone_number' => $user->phone_number,
            'is_profile_complete' => $user->is_profile_complete,
            'provider' => $user->provider,
            'provider_id' => $user->provider_id,
            'rapyd_customer_id' => $user->rapyd_customer_id,
            'stripe_customer_id' => $user->stripe_customer_id,
            'stripe_connect_account_id' => $user->stripe_connect_id,

            'special_offers' => isset($user->userNotification) ? $user->userNotification->special_offers : 0,
            'sound' => isset($user->userNotification) ? $user->userNotification->sound : 0,
            'general_notification' => isset($user->userNotification) ? $user->userNotification->general_notification : 0,
            'payment_option' => isset($user->userNotification) ? $user->userNotification->payment_option : 0,
            'app_update' => isset($user->userNotification) ? $user->userNotification->app_update : 0,
            'new_service_available' => isset($user->userNotification) ? $user->userNotification->new_service_available : 0,
            'new_tips_available' => isset($user->userNotification) ? $user->userNotification->new_tips_available : 0,

            'created_at' => $user->created_at
        ];
        return $data;
    }

    public function fetchUserRecordForChallengeFromRelation($model)
    {

        $data = [
            'id' => $model->id,
            'image' => $model->image,
            'full_name' => $model->full_name,
            'nick_name' => $model->nick_name,
            'phone_number' => $model->phone_number,
            'email' => $model->email,
        ];
        return $data;


    }
}
