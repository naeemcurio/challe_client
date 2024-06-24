<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\Response;

class SocialRegisterRequest extends FormRequest
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
            'email' => 'required|email',
//            'phone_number' => 'required',
            'provider' => 'required|in:GMAIL,APPLE',
            'provider_id' => 'required'
        ];
    }


    public function attributes()
    {
        return [
            'email' => __('users.email'),
            'phone_number' => __('users.phone_number'),
            'provider' => __('users.provider'),
            'provider_id' => __('users.provider_id'),
        ];
    }

    public function messages()
    {
        return [
            'email.required' => __('validation.required'),
            'email.email' => __('validation.email'),
//            'email.unique' => __('validation.unique'),
//            'phone_number.required' => __('validation.required'),
//            'phone_number.unique' => __('validation.unique'),
            'provider.required' => __('validation.required'),
            'provider_id.required' => __('validation.required'),
            'provider.in' => __('validation.in')
        ];
    }


    public function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(
            makeResponse('error', $validator->errors()->first(),Response::HTTP_UNPROCESSABLE_ENTITY)
        );
    }
}
