<?php

namespace App\Http\Requests\Admin;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\Response;

class UpdateUserRequest extends FormRequest
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
            'full_name' => 'required',
            'nick_name' => 'required',
            'email' => 'required|email',
            'phone_number' => 'required',
            'password' => 'nullable|min:8',
            'gender' => 'required',
            'date_of_birth' => 'nullable',
            'image' => 'nullable|mimes:jpeg,jpg,png'
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

        ];
    }


    public function messages()
    {
        return [
            'email.unique' => __('validation.email'),
            'email.required' => __('validation.required'),
            'full_name.required' => __('validation.required'),
            'nick_name.required' => __('validation.required'),
            'phone_number.required' => __('validation.required'),
            'gender.required' => __('validation.required'),
            'date_of_birth.required' => __('validation.required'),
            'image.mimes' => __('validation.mimes')
        ];
    }


    public function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(
            makeResponse('error', $validator->errors()->first(), Response::HTTP_UNPROCESSABLE_ENTITY)
        );
    }
}
