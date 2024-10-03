<?php

namespace App\Http\Requests\Api;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\Response;

class SubmitRecordRequest extends FormRequest
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
            'video_url' => 'required',
            'comments' => 'nullable',
            'challenge_attempt_id' => 'required'
        ];
    }

    public function attributes()
    {
        return [
            'video_url' => __('challenge.video_url'),
            'comments' => __('challenge.comment'),
            'challenge_attempt_id' => __('challenge.challenge_attempt_id'),
        ];
    }


    public function messages()
    {
        return [
            'video_url.required' => __('validation.required'),
//            'comments.required' => __('validation.required'),
            'challenge_attempt_id.required' => __('validation.required'),
        ];
    }

    public function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(
            makeResponse('error', $validator->errors()->first(),Response::HTTP_UNPROCESSABLE_ENTITY)
        );
    }
}
