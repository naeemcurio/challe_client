<?php

namespace App\Http\Requests\Admin;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\Response;

class StoreSettingRequest extends FormRequest
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
            'company_commission' => 'required',
            'challenge_creator_commission'  => 'required',
            'waiting_time' => 'required|integer'
        ];
    }

    public function attributes()
    {
        return [
            'company_commission' => __('setting.company_commission'),
            'challenge_creator_commission' => __('setting.challenge_creator_commission'),
            'waiting_time' => __('setting.waiting_time'),
        ];
    }


    public function messages()
    {
        return [
            'company_commission.required' => __('validation.required'),
            'challenge_creator_commission.required' => __('validation.required'),
            'company_commission.integer' => __('validation.integer'),
            'challenge_creator_commission.integer' => __('validation.integer'),
            'waiting_time.integer' => __('validation.integer'),

        ];
    }

    public function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(
            makeResponse('error', $validator->errors()->first(),Response::HTTP_UNPROCESSABLE_ENTITY)
        );
    }
}
