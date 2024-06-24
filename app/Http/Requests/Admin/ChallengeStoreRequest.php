<?php

namespace App\Http\Requests\Admin;

use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\Response;

class ChallengeStoreRequest extends FormRequest
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
        $rules =  [
//            'title' => ['required', 'string', 'max:400'],
            'description' => ['nullable', 'string'],
            'price' => ['required'],
            'image' => ['nullable', 'mimes:jpg,jpeg,png'],
            'video' => ['nullable', 'mimes:mp4'],
            'createdBy' => ['required', 'integer', 'exists:users,id'],
            'status' => ['nullable','boolean']
        ];

        // Check if the user is an admin creating the resource
        $user = auth()->user(); // Assuming you are using Laravel's authentication
        if ($user->role_id == 1 && request()->isMethod('post')) {
            $rules['createdBy'] = ['required', 'integer', 'exists:users,id'];
        } else {
            $rules['createdBy'] = ['nullable', 'integer', 'exists:users,id'];
        }

        return $rules;

    }


    public function attributes()
    {
        return [
//            'title' => __('challenge.title'),
            'description' => __('challenge.description'),
            'price' => __('challenge.price'),
            'image' => __('challenge.image'),
            'video' => __('challenge.video'),
            'createdBy' => __('challenge.createdBy'),
            'status' => __('challenge.status'),
        ];
    }

    public function messages()
    {
        return [
//            'title.required' => __('validation.required'),
            'description.string' => __('validation.string'),
            'price.required' => __('validation.required'),
            'image.mimes' => __('validation.mimes'),
            'video.mimes' => __('validation.mimes'),
//            'video.required' => __('validation.required'),
            'createdBy.required' => __('validation.required'),
            'createdBy.integer' => __('validation.integer'),
            'createdBy.exists' => __('validation.exists'),
//            'status.required' => __('validation.required'),
            'status.boolean' => __('validation.boolean')
        ];
    }

    public function failedValidation(Validator $validator)
    {
        throw new HttpResponseException(
            makeResponse('error', $validator->errors()->first(),Response::HTTP_UNPROCESSABLE_ENTITY)
        );
    }
}
