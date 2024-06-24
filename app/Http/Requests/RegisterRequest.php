<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\Response;

class RegisterRequest extends FormRequest
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
            'email' => 'required|email|unique:users',
            'password' => 'required|min:8',
            'phone_number' => 'required|unique:users'
        ];
    }


    public function attributes()
    {
        return [
            'email' => __('users.email'),
            'password' => __('users.password'),
            'phone_number' => __('users.phone_number')
        ];
    }

    public function messages()
    {
        return [
            'email.required' => __('validation.required'),
            'password.required' => __('validation.required'),
            'phone_number.required' => __('validation.required'),
            'email.unique' => __('validation.unique'),
            'phone_number.unique' => __('validation.unique'),

        ];
    }


    public function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(
            makeResponse('error', $validator->errors()->first(),Response::HTTP_UNPROCESSABLE_ENTITY)
        );
    }
}
