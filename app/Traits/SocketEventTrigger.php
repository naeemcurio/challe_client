<?php

namespace App\Traits;

use ElephantIO\Client;

trait SocketEventTrigger
{
    /**
     * Create regular or static methods here
     */

    public function eventEmit($title, $message, $userID, $notificationType, $data = null)
    {
//        $url = "http://202.166.170.246:8081";
        $url = "http://localhost:8081";


        $options = [
            'transport' => 'websocket',
        ];

        $client = Client::create($url,$options);

//        $client = new Client(new Version2X('http://202.166.170.246:8081')); // Change the URL to your Soketi/Socket.IO server address

        // emit an event to the server
        try{
            $client->connect();


            $emitData = ['title' => $title, 'message' => $message,
                'notification_type' => $notificationType,
                'user_id' => $userID, 'data' => $data];

            $client->emit('statusEvent', $emitData);

        }
        catch (\Exception $e)
        {
            $response = ['result'=>"error",'message'=>$e];
            return $response;
        }

        $response = ['result'=>"success"];
        return $response;
    }

}