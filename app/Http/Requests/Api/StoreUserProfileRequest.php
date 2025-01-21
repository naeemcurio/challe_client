<?php

namespace App\Http\Requests\Api;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;

class StoreUserProfileRequest extends FormRequest
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
            'image' => 'nullable|mimes:jpeg,png,jpg',
            'full_name' => 'required',
            'nick_name' => 'required',
            'date_of_birth' => 'nullable|date|date_format:Y/m/d',
            'gender' => 'required',
            'phone_number' => 'nullable|unique:users,phone_number,'.Auth::user()->id,
            'timezone' => 'nullable'
        ];
    }

    public function attributes()
    {
        return [
            'email' => __('users.email'),
            'full_name' => __('users.full_name'),
            'nick_name' => __('users.nick_name'),
            'phone_number' => __('users.phone_number'),
            'gender' => __('users.gender'),
            'date_of_birth' => __('users.date_of_birth'),
            'image' => __('users.profile_image'),
            'timezone' => __('users.timezone'),

        ];
    }


    public function messages()
    {
        return [
            'email.unique' => __('validation.email'),
            'email.required' => __('validation.required'),
            'full_name.required' => __('validation.required'),
            'nick_name.required' => __('validation.required'),
            'phone_number.nullable' => __('validation.nullable'),
            'phone_number.unique' => __('validation.unique'),
            'gender.required' => __('validation.required'),
            'image.mimes' => __('validation.mimes'),
            'date_of_birth.date' => __('validation.date'),
            'date_of_birth.date_format' => __('validation.date_format'),


        ];
    }

    public function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(
            makeResponse('error', $validator->errors()->first(),Response::HTTP_UNPROCESSABLE_ENTITY)
        );
    }
}
