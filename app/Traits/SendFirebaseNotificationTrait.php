<?php


namespace App\Traits;


use Illuminate\Support\Facades\Log;
use Kreait\Firebase\Messaging\CloudMessage;
use Kreait\Firebase\Messaging\Notification;
use App\Services\GoogleAuthService;

trait SendFirebaseNotificationTrait
{

    public function sendInChallengeNotification($fcmToken,$getPayment)
    {
        $notificationType = 7;
        $title = __('notification_message.someone_searching_title');
        $message = __('notification_message.someone_searching').' '.$getPayment->price.'$ '.__('title.challenge');


        $data = array();
        $data['notification_type'] = $notificationType;
        $data ['title'] = $title;
        $data['body'] = $message;
        $data['data'] = null;

        $this->sendPushNotification('/topics/'.$fcmToken, $data);

        return true;
    }


    public function waitNotification($fcmToken, $title, $message, $notification_type,$dataBody = null)
    {
        $data = array();
        $data['notification_type'] = $notification_type;
        $data ['title'] = $title;
        $data['body'] = $message;
        $data['data'] = $dataBody;

        $this->sendPushNotification($fcmToken, $data);

        return true;
    }

    public function getReady($fcmToken, $title, $message, $notification_type,$dataBody)
    {
        $data = array();
        $data['notification_type'] = $notification_type;
        $data ['title'] = $title;
        $data['body'] = $message;
        $data['data'] = $dataBody;

        if ($fcmToken) {
            $this->sendPushNotification($fcmToken, $data);
        }

        return true;
    }

    public function recordSubmitNotification($fcmToken, $title, $message, $notification_type)
    {
        $data = array();
        $data['notification_type'] = $notification_type;
        $data ['title'] = $title;
        $data['body'] = $message;
        $data['data'] = null;

        if ($fcmToken) {
            $this->sendPushNotification($fcmToken, $data);
        }

        return true;
    }


    public function announcement($fcmToken, $title, $message, $notification_type,$challengeData)
    {
        $data = array();
        $data['notification_type'] = $notification_type;
        $data ['title'] = $title;
        $data['body'] = $message;
        $data['data'] = $challengeData;

        if ($fcmToken) {
            $this->sendPushNotification($fcmToken, $data);
        }

        return true;
    }


    public function sendChatNotification($fcmToken,$title,$message)
    {
        $data = array();
        $data ['title'] = $title;
        $data['body'] = $message;

        if ($fcmToken) {
            $this->sendPushNotificationNew($fcmToken, $data);
        }

        return true;
    }



    public function sendPushNotification($fcm, $dataBody)
    {

        $client = new \GuzzleHttp\Client(['verify' => false]);
        $API_SERVER_KEY = env('FCM_SERVER_KEY');


        $request = $client->post(
            'https://fcm.googleapis.com/fcm/send',
            [
                'headers' => [
                    'Authorization' => 'key=' . $API_SERVER_KEY,
                    'Content-Type' => 'application/json',
//                    'Content-Length' => '1564'
                ],
                'body' => json_encode([
                    "to" => $fcm,
                    "priority" => "high",
                    "content_available" => true,
                    "mutable_content" => true,
                    "time_to_live" => 0,
                    "notification" => $dataBody,
                    "data" => $dataBody
                ])
            ]
        );

        $response = $request->getBody();
        $response = json_decode($response);

        if (isset($response->success) &&  $response->success > 0) {
            return true;
        } else {

//            Log::debug($response);

            return false;
        }

    }


    public function sendPushNotificationNew($fcm, $dataBody, $notificationData = null)
    {
        $service = new GoogleAuthService();

        $accessToken = $service->getAccessToken();
//        dd($accessToken);

        $client = new \GuzzleHttp\Client(['verify' => false]);

        $request = $client->post(
            'https://fcm.googleapis.com/v1/projects/' . env('FCM_PROJECT_ID') . '/messages:send',
            [
                'headers' => [
                    'Authorization' => 'Bearer ' . $accessToken,
                    'Content-Type' => 'application/json',
                ],
                'body' => json_encode([

                    'message' => [
                        "token" => $fcm,
//                        "priority" => "high",
//                        "content_available" => true,
//                        "mutable_content" => true,
//                        "time_to_live" => 0,
                        "notification" => $dataBody,
                        "data" => $dataBody
                    ]
                ])
            ]
        );

        $response = $request->getBody();

        $response = json_decode($response);


        if (isset($response->name)) {
            return true;
        } else {
            return false;
        }

    }
}
