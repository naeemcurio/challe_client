<?php

namespace App\Services\Api;


use App\Helper\ImageUploadHelper;


class UserService
{

    public function save($request,$user)
    {
        try{
            if ($request->image) {
                try {
                    $image = ImageUploadHelper::uploadImage($request->image, 'upload/image/user/');
                    $user->image = $image;
                } catch (\Exception $e) {
                    $exception = __('response_message.image_save_error').': '. $e;
                    return ['type'=>'error','message'=>$exception];
                }
            }

            $user->is_profile_complete = 1;
            $user->fill($request->except(['image']));

            $user->save();
        }
        catch (\Exception $e)
        {
            $exception = __('response_message.error_message_line').' ' .__('admin_sidebar.user') .' ' .__('response_message.record') . $e;
            return ['type'=>'error','message'=>$exception];

        }
    }


    public function updateFirebaseToken($request,$user)
    {
        try{

            $user->fill($request->validated());
            $user->save();

        }
        catch (\Exception $e)
        {
            $exception = __('response_message.error_message_line').' ' .__('admin_sidebar.user') .' ' .__('response_message.record') . $e;
            return ['type'=>'error','message'=>$exception];

        }
    }
}
