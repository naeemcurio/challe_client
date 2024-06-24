<?php

namespace App\Http\Requests\Api;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\Response;

class ExecuteChallengeRequest extends FormRequest
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
            'payment_id' => 'required|exists:user_payments,id',
            'lat' => 'required',
            'lng' => 'required',
            'city' => 'required'
        ];
    }

    public function attributes()
    {
        return [
            'payment_id' => __('title.payment_id'),
            'lat' => __('title.lat'),
            'lng' => __('title.lng'),
            'city' => __('title.city'),
        ];
    }

    public function messages()
    {
        return [
            'payment_id.required' => __('validation.required'),
            'lat.required' => __('validation.required'),
            'lng.required' => __('validation.required'),
            'payment_id.exists' => __('validation.exists'),
            'city' => __('validation.required'),

        ];
    }

    public function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(
            makeResponse('error', $validator->errors()->first(),Response::HTTP_UNPROCESSABLE_ENTITY)
        );
    }
}
