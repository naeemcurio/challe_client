<?php

namespace App\Http\Requests\Api;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\Response;

class CityPayRequest extends FormRequest
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
            'type' => 'required|string',
            'action' => 'required|string',
            'status' => 'required|string',
            'order_id' => 'required|string|max:2147483647',
            'client_order_id' => 'required|string',
//            'transaction_id' => 'nullable|string',
//            'received_amount_in_coins' => 'required|numeric',
//            'received_amount_in_fiat' => 'required|numeric',
            'fiat_currency' => 'required|string',
            'crypto_currency' => 'required|string',
            'created_at' => 'required|date',
//            'order_token' => 'required|string',
//            'order_expiration' => 'required|integer',
//            'exchange_rate' => 'required|numeric',

        ];
    }


    public function attributes()
    {
        return [
            'type' => __('city_pay.type'),
            'status' => __('city_pay.status'),
            'order_id' => __('city_pay.order_id'),
            'client_order_id' => __('city_pay.client_order_id'),
            'transaction_id' => __('city_pay.transaction_id'),
            'received_amount_in_coins' => __('city_pay.received_amount_in_coins'),
            'received_amount_in_fiat' => __('city_pay.transaction_id'),
            'fiat_currency' => __('city_pay.transaction_id'),
            'crypto_currency' => __('city_pay.transaction_id'),
            'created_at' => __('city_pay.transaction_id'),
            'order_token' => __('city_pay.transaction_id'),
            'order_expiration' => __('city_pay.transaction_id'),
            'exchange_rate' => __('city_pay.transaction_id'),
        ];
    }

    public function messages()
    {
        return [
            'type.required' => __('validation.required'),
            'type.string' => __('validation.string'),

            'status.required' => __('validation.required'),
            'status.string' => __('validation.string'),

            'order_id.required' => __('validation.required'),
            'order_id.string' => __('validation.string'),

            'client_order_id.required' => __('validation.required'),

            'transaction_id.string' => __('validation.string'),

            'received_amount_in_coins.required' => __('validation.required'),
            'received_amount_in_coins.numeric' => __('validation.numeric'),

            'received_amount_in_fiat.required' => __('validation.required'),
            'received_amount_in_fiat.numeric' => __('validation.numeric'),


            'fiat_currency.required' => __('validation.required'),
            'fiat_currency.string' => __('validation.string'),

            'crypto_currency.required' => __('validation.required'),
            'crypto_currency.string' => __('validation.string'),

            'created_at.required' => __('validation.required'),
            'created_at.date' => __('validation.date'),

            'order_token.required' => __('validation.required'),
            'order_token.string' => __('validation.string'),

            'order_expiration.required' => __('validation.required'),
            'order_expiration.integer' => __('validation.integer'),

            'exchange_rate.required' => __('validation.required'),
            'exchange_rate.numeric' => __('validation.numeric'),

        ];
    }


    public function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(
            makeResponse('error', $validator->errors()->first(), Response::HTTP_UNPROCESSABLE_ENTITY)
        );
    }
}
