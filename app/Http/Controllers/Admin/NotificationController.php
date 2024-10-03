<?php

namespace App\Http\Controllers\Admin;

use App\DataTables\NotificationListing;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;

class NotificationController extends Controller
{
    public function index()
    {
        $notificationArray = array();
        foreach (Auth::user()->notifications as $notification) {

            if(isset($notification->data['type']) &&
                $notification->data['type'] == 'withdraw_request')
            {
                $getUser = User::find($notification->data['user_id']);
                if($getUser)
                {
                    $notificationArray[] = ['id'=>$notification->id,
                        'title'=>__($notification->data['notification']),
                        'message' => $getUser->full_name.' '.__($notification->data['message']),
                        'type'  => isset($notification->data['type']) ? $notification->data['type']:'',
                    ];
                }

            }
            elseif(isset($notification->data['type']) &&
                $notification->data['type'] == 'challenge_record_submit')
            {
                $getUser = User::find($notification->data['user_id']);
                if($getUser)
                {
                    $notificationArray[] = ['id'=>$notification->id,
                        'title'=>__($notification->data['notification']),
                        'message' => $getUser->full_name.' '.__($notification->data['message']),
                        'type'  => isset($notification->data['type']) ? $notification->data['type']:'',
                    ];
                }

            }

        }


        if(sizeof($notificationArray) > 0)
        {
            return makeResponse('success',__('response_message.notification_list'),Response::HTTP_OK,$notificationArray);
        }

        return makeResponse('error',__('response_message.record_not_found'),Response::HTTP_NOT_FOUND);

    }

    public function listing(NotificationListing $dataTable)
    {

        return $dataTable->render('admin.notification.listing');

    }
}
