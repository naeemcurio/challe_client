<?php

namespace App\Http\Requests;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\Response;

class UpdatePasswordRequest extends FormRequest
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
//            'password' => 'required|min:8|confirmed',
            'password' => 'required|min:8',
        ];
    }

    public function attributes()
    {
        return [
            'password' => __('users.password'),
        ];
    }

    public function messages()
    {
        return [
            'password.required' => __('validation.required'),
            'password.min' => __('validation.min'),
//            'password.confirmed' => __('validation.confirmed'),
        ];
    }

    public function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(
            makeResponse('error', $validator->errors()->first(),Response::HTTP_UNPROCESSABLE_ENTITY)
        );
    }
}
