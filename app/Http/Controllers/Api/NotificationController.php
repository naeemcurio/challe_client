<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class NotificationController extends Controller
{
    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            if (Auth::check()) {
                LaravelLocalization::setLocale(Auth::user()->default_language);
            }
            return $next($request);
        });
    }

    public function listing()
    {
        $notificationArray = array();
        foreach (Auth::user()->notifications as $notification) {

            if(isset($notification->data['type']) &&
                $notification->data['type'] == 'pack_added')
            {
                $notificationArray[] = ['id'=>$notification->id,
                    'title'=>__($notification->data['notification']),
                    'message' => __($notification->data['message1']).' '.$notification->data['title'].' '.__($notification->data['message2']),
                    'type'  => isset($notification->data['type']) ? $notification->data['type']:'',
                ];
            }
            else{
                $notificationArray[] = ['id'=>$notification->id,
                    'title'=>__($notification->data['notification']),
                    'message' => __($notification->data['message']),
                    'type'  => isset($notification->data['type']) ? $notification->data['type']:'',
                ];
            }


        }

        if(sizeof($notificationArray) > 0)
        {
            return makeResponse('success',__('response_message.notification_list'),Response::HTTP_OK,$notificationArray);
        }

        return makeResponse('error',__('response_message.record_not_found'),Response::HTTP_NOT_FOUND);

    }
}
