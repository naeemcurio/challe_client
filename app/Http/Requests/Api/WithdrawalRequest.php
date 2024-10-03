<?php

namespace App\Http\Requests\Api;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\Response;

class WithdrawalRequest extends FormRequest
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
            'bank_name' => 'required_if:request_type,1',
            'account_number' => 'required_if:request_type,1',
            'additional_info' => 'nullable',
//            'card_holder_name' => 'required_if:request_type,1',
//            'card_number' => 'required_if:request_type,1',
//            'card_expiry_month' => 'required_if:request_type,1',
//            'card_expiry_year' => 'required_if:request_type,1',
            'withdraw_amount' => 'required_if:request_type,1',
            'request_type' => 'nullable|in:0,1,2',
            'coin_type' => 'required_if:request_type,2',
            'address' => 'required_if:request_type,2',
            'network' => 'required_if:request_type,2',
        ];
    }

    public function attributes()
    {
        return [
//            'cardholder_name' => __('card.cardholder_name'),
//            'card_number' => __('card.card_number'),
//            'expiry_month' => __('card.expiry_month'),
//            'expiry_year' => __('card.expiry_year'),
//            'cvv' => __('card.cvv'),

            'bank_name' => __('withdraw.bank_name'),
            'account_number' => __('withdraw.account_number'),
            'additional_info' => __('withdraw.additional_info'),

            'withdraw_amount' => __('card.withdraw_amount'),
            'request_type' => __('title.request_type'),
            'coin_type' => __('title.coin_type'),
            'address' => __('title.address'),
            'network' => __('title.network'),
        ];
    }

    public function messages()
    {
        return [
//            'cardholder_name.required' => __('validation.required_if'),
//            'card_number.required' => __('validation.required_if'),
//            'expiry_month.required' => __('validation.required_if'),
//            'expiry_year.required' => __('validation.required_if'),
//            'cvv.required' => __('validation.required_if'),
            'bank_name.required_if' => __('validation.required_if'),
            'account_number.required_if' => __('validation.required_if'),
            'additional_info.required_if' => __('validation.required_if'),

            'withdraw_amount.required' => __('validation.required'),
            'request_type.in' => __('validation.in'),
            'coin_type.required_if' => __('validation.required_if'),
            'address.required_if' => __('validation.required'),
            'network.required_if' => __('validation.required'),
        ];
    }


    public function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(
            makeResponse('error', $validator->errors()->first(),Response::HTTP_UNPROCESSABLE_ENTITY)
        );
    }
}
