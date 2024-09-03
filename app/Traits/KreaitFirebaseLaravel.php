<?php


namespace App\Traits;


use Kreait\Firebase\Factory;
use Kreait\Firebase\Messaging\CloudMessage;
use Kreait\Firebase\Messaging\Notification;

trait KreaitFirebaseLaravel
{

    protected $firebaseMessaging;

    public function __construct()
    {
        $this->firebaseMessaging = (new Factory)
            ->withServiceAccount(config_path('firebase_key/challe-80e31-e3db5757efad.json'))
            ->createMessaging();
    }



    public function sendInChallengeNotification($fcmToken,$getPayment)
    {

        $notificationType = 7;
        $title = __('notification_message.someone_searching_title');
        $message = __('notification_message.someone_searching').' '.$getPayment->price.'$ '.__('title.challenge');

        $notification = Notification::create($title, $message);
        $data = [
            'notification_type' => $notificationType,
            'title' => $title,
            'body' => $message,
//            'data' => []
        ];


        $message = CloudMessage::withTarget('token', '/topics/'.$fcmToken)
            ->withNotification($notification)
            ->withData($data);

        $this->sendPushNotification($message);



        return true;
    }


    public function waitNotification($fcmToken, $title, $message, $notification_type,$dataBody = null)
    {
//        $data = array();
//        $data['notification_type'] = $notification_type;
//        $data ['title'] = $title;
//        $data['body'] = $message;
//        $data['data'] = $dataBody;


        $notification = Notification::create($title, $message);
        $data = [
            'notification_type' => $notification_type,
            'title' => $title,
            'body' => $message,
//            'data' => null
        ];

        $message = CloudMessage::withTarget('token', $fcmToken)
            ->withNotification($notification)
            ->withData($data);

        $this->sendPushNotification($message);


        return true;
    }

    public function getReady($fcmToken, $title, $message, $notification_type,$dataBody)
    {
//        $data = array();
//        $data['notification_type'] = $notification_type;
//        $data ['title'] = $title;
//        $data['body'] = $message;
//        $data['data'] = $dataBody;

//        dd($dataBody);
        if ($fcmToken) {
            $notification = Notification::create($title, $message);
            $data = [
                'notification_type' => $notification_type,
                'title' => $title,
                'body' => $message,
                'data' => ''
            ];
            // Remove 'data' key if it's empty
            if (empty($data['data'])) {
                unset($data['data']);
            }

//            dd($data);
            $message = CloudMessage::withTarget('token', $fcmToken)
                ->withNotification($notification)
                ->withData($data);

//            dd($message);

            $this->sendPushNotification($message);
        }

        return true;
    }

    public function recordSubmitNotification($fcmToken, $title, $message, $notification_type)
    {
//        $data = array();
//        $data['notification_type'] = $notification_type;
//        $data ['title'] = $title;
//        $data['body'] = $message;
//        $data['data'] = null;

        if ($fcmToken) {
            $notification = Notification::create($title, $message);
            $data = [
                'notification_type' => $notification_type,
                'title' => $title,
                'body' => $message,
//                'data' => null
            ];

            $message = CloudMessage::withTarget('token', $fcmToken)
                ->withNotification($notification)
                ->withData($data);

            $this->sendPushNotification($message);
        }

        return true;
    }


    public function announcement($fcmToken, $title, $message, $notification_type,$challengeData)
    {
//        $data = array();
//        $data['notification_type'] = $notification_type;
//        $data ['title'] = $title;
//        $data['body'] = $message;
//        $data['data'] = $challengeData;

        if ($fcmToken) {
            $notification = Notification::create($title, $message);
            $data = [
                'notification_type' => $notification_type,
                'title' => $title,
                'body' => $message,
//                'data' => null
            ];

            $message = CloudMessage::withTarget('token', $fcmToken)
                ->withNotification($notification)
                ->withData($data);

            $this->sendPushNotification($message);
        }

        return true;
    }


    public function sendPushNotification(CloudMessage $message)
    {
        try {

            if (!$this->firebaseMessaging) {
                $this->firebaseMessaging = (new Factory)
                    ->withServiceAccount(config_path('firebase_key/challe-80e31-e3db5757efad.json'))
                    ->createMessaging();
            }

            $this->firebaseMessaging->send($message);
            return true;
        } catch (\Exception $e) {
            // Log the error
            \Log::error('Firebase Notification Error: ' . $e->getMessage());
            return false;
        }
    }
}
