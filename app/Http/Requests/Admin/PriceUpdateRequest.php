<?php

namespace App\Http\Requests\Admin;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\Response;

class PriceUpdateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     */
    public function rules(): array
    {
        return [
            'title' => 'required',
            'price' => ['required' ,'numeric', 'between:0,999999.99'],
        ];
    }


    public function attributes()
    {
        return [
            'price' => __('challenge.price'),
            'title' => __('challenge.title'),

        ];
    }

    public function messages()
    {
        return [

            'price.required' => __('validation.required'),
            'price.numeric' =>  __('validation.numeric'),
            'title.required' => __('validation.required'),

        ];
    }

    public function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(
            makeResponse('error', $validator->errors()->first(),Response::HTTP_UNPROCESSABLE_ENTITY)
        );
    }
}
