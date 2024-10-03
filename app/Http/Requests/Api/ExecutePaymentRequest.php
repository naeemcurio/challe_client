<?php

namespace App\Http\Requests\Api;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\Response;

class ExecutePaymentRequest extends FormRequest
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
            'price_id' => 'required|exists:prices,id',
//            'card_id' => 'required_if:type,card',
            'type' => 'required',
//            'token' => 'required_if:type,card',

            'lat' => 'required',
            'lng' => 'required',
            'city' => 'nullable',
            'payment_id' => 'required_if:type,card',

        ];
    }


    public function attributes()
    {
        return [
            'price_id' => __('challenge.price'),
//            'card_id' => __('title.card_id'),
            'type' => __('title.type'),
//            'token' => __('title.token'),

            'lat' => __('title.lat'),
            'lng' => __('title.lng'),
            'city' => __('title.city'),
            'payment_id' => __('title.payment_id'),

        ];
    }

    public function messages()
    {
        return [
            'price_id.required' => __('validation.required'),
            'price_id.exists' => __('validation.exists'),
//            'card_id.required' => __('validation.required'),
//            'type.required' => __('validation.required'),
            'token.required_if' => __('validation.required'),

            'lat.required' => __('validation.required'),
            'lng.required' => __('validation.required'),
            'payment_id.required_if' => __('validation.required_if'),
        ];
    }


    public function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(
            makeResponse('error', $validator->errors()->first(), Response::HTTP_UNPROCESSABLE_ENTITY)
        );
    }
}
