<?php

namespace App\Http\Requests\Api;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\Response;

class SubmitRatingRequest extends FormRequest
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
            'rating' => 'required',
            'challenge_attempt_id' => 'required',
            'challenge_id' => 'required'
        ];
    }


    public function attributes()
    {
        return [
            'rating' => __('users.email'),
            'challenge_attempt_id' => __('challenge.challenge_attempt_id'),
            'challenge_id' => __('title.challenge'),
        ];
    }

    public function messages()
    {
        return [
            'rating.required' => __('validation.required'),
            'challenge_attempt_id.required' => __('validation.required'),
            'challenge_id.required' => __('validation.required'),
        ];
    }


    public function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(
            makeResponse('error', $validator->errors()->first(),Response::HTTP_UNPROCESSABLE_ENTITY)
        );
    }


}
