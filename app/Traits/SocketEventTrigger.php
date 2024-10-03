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

        if(env('APP_ENV') == 'prod')
        {
            $url = "https://challe.pro:3001";
        }
        else{
            $url = "http://localhost:3001";
        }



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


    public function eventEmitForSearch($title, $message, $userID, $data )
    {
//        $url = "http://202.166.170.246:8081";
        $url = "https://localhost:3001";


        $options = [
            'transport' => 'websocket',
        ];

        $client = Client::create($url,$options);

//        $client = new Client(new Version2X('http://202.166.170.246:8081')); // Change the URL to your Soketi/Socket.IO server address

        // emit an event to the server
        try{
            $client->connect();

            $setData = [
                'waiting_lounge_id' => $data
            ];


            $emitData = ['title' => $title, 'message' => $message,
                'user_id' => $userID, 'data' => $setData];

//            $client->emit('statusEvent', $emitData);
            $client->emit('searchAgain', $emitData);

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
