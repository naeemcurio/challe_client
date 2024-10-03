<?php

namespace App\Http\Requests\Api;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\Response;

class LSPPaymentRequest extends FormRequest
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
        ];
    }


    public function attributes()
    {
        return [
            'price_id' => __('challenge.price'),
        ];
    }

    public function messages()
    {
        return [
            'price_id.required' => __('validation.required'),
            'price_id.exists' => __('validation.exists'),

        ];
    }


    public function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(
            makeResponse('error', $validator->errors()->first(), Response::HTTP_UNPROCESSABLE_ENTITY)
        );
    }
}
