<?php

namespace App\Http\Requests\Api;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\Response;

class SaveCardRequest extends FormRequest
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
            'cardholder_name' => 'required',
            'card_number' => 'required',
            'expiry_month' => 'required',
            'expiry_year' => 'required',
            'cvv' => 'required'
        ];
    }

    public function attributes()
    {
        return [
            'cardholder_name' => __('card.cardholder_name'),
            'card_number' => __('card.card_number'),
            'expiry_month' => __('card.expiry_month'),
            'expiry_year' => __('card.expiry_year'),
            'cvv' => __('card.cvv'),
        ];
    }

    public function messages()
    {
        return [
            'cardholder_name.required' => __('validation.required'),
            'card_number.required' => __('validation.required'),
            'expiry_month.required' => __('validation.required'),
            'expiry_year.required' => __('validation.required'),
            'cvv.required' => __('validation.required'),
        ];
    }


    public function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(
            makeResponse('error', $validator->errors()->first(),Response::HTTP_UNPROCESSABLE_ENTITY)
        );
    }
}
