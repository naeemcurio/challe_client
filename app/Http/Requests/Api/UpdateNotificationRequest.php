<?php

namespace App\Http\Requests\Api;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\Response;

class UpdateNotificationRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, mixed>
     */
    public function rules()
    {
        return [
            'special_offers' => 'nullable|boolean',
            'sound' => 'nullable|boolean',
            'general_notification' => 'nullable|boolean',
            'payment_option' => 'nullable|boolean',
            'app_update' => 'nullable|boolean',
            'new_service_available' => 'nullable|boolean',
            'new_tips_available' => 'nullable|boolean',
        ];
    }


    public function attributes()
    {
        return [
            'special_offers' => __('users.special_offer'),
            'sound' => __('users.sound'),
            'general_notification' => __('users.general_notification'),
            'payment_option' => __('users.payment_option'),
            'app_update' => __('users.app_update'),
            'new_service_available' => __('users.new_service_available'),
            'new_tips_available' => __('users.new_tips_available'),

        ];
    }


    public function messages()
    {
        return [
            'special_offers.boolean' => __('validation.boolean'),
            'sound.boolean' => __('validation.boolean'),
            'general_notification.boolean' => __('validation.boolean'),
            'payment_option.boolean' => __('validation.boolean'),
            'phone_number.boolean' => __('validation.boolean'),
            'app_update.boolean' => __('validation.boolean'),
            'new_service_available.boolean' => __('validation.boolean'),
            'new_tips_available.boolean' => __('validation.boolean')
        ];
    }

    public function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(
            makeResponse('error', $validator->errors()->first(),Response::HTTP_UNPROCESSABLE_ENTITY)
        );
    }
}
