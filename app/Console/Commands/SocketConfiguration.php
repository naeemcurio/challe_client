<?php

namespace App\Console\Commands;

use App\Http\Controllers\Admin\ChatController;
use App\Models\ReadyLounge;
use App\Models\User;
use App\Models\WaitingLounge;
use App\Services\Chat\ChatService;
use App\Traits\KreaitFirebaseLaravel;
use App\Traits\SendFirebaseNotificationTrait;
use Carbon\Carbon;
use GuzzleHttp\Client;
use Illuminate\Console\Command;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use PHPSocketIO\SocketIO;
use Workerman\Worker;

class SocketConfiguration extends Command
{
    use SendFirebaseNotificationTrait;
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'start';


    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Start the socket server';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        try {
            if (env('APP_ENV') == 'prod') {
                $context = [
                    'ssl' => [
                        'local_cert' => env('LOCAL_CERT'), // Path to your SSL certificate
                        'local_pk' => env('LOCAL_PK'),     // Path to your private key
                        'verify_peer' => false
                    ]
                ];

                $io = new SocketIO('3001', $context);
                $io->worker->transport = 'ssl';

            }
            else{
                $io = new SocketIO('3001');
            }

            $io->on('connection', function ($socket) use ($io) {
//                Log::info('new user connect');
                $socket->on('statusEvent', function ($data) use ($io) {
//                    Log::info($data);
//                    Log::info("user_id is: " . $data['user_id']);

                    $channelName = null;
                    if ($data['notification_type'] == 0) {
                        $channelName = $data['user_id'] . '-wait-channel';
                    } elseif ($data['notification_type'] == 1) {
                        $channelName = $data['user_id'] . '-ready-channel';
                    } elseif ($data['notification_type'] == 2) {
                        $channelName = $data['user_id'] . '-other-user-is-ready-channel';
                    } elseif ($data['notification_type'] == 4) {
                        $channelName = $data['user_id'] . '-record-submit-channel';
                    }

//                    Log::info('at end');

                    $io->emit($channelName, [
                        'title' => $data['title'],
                        'message' => $data['message'],
                        'data' => $data['data']
                    ]);


//                    Log::info('done');
                });

                $socket->on('searchAgain', function ($data) use ($io) {
                    $channelName = $data['user_id'] . '-search-again';

                    $io->emit($channelName, [
                        'title' => $data['title'],
                        'message' => $data['message'],
                        'data' => $data['data']
                    ]);
                });

                $socket->on('get-chat-history', function ($data) use ($socket, $io) {
                    $userId = $data['user_id'];
                    $roomName = $data['room_id'];

                    // Leave previous rooms
                    foreach ($socket->rooms as $room) {
                        $socket->leave($room);
                    }

                    // Fetch chat history from Laravel backend
//                    $client = new Client();
                    try {
//                        $response = $client->post(env('APP_URL') . '/get-chat-history', [
//                            'form_params' => [
//                                'room_id' => $roomName,
//                                'user_id' => $socket->userId
//                            ]
//                        ]);
//                        $responseData = json_decode($response->getBody()->getContents(), true);

                        // Manually create an instance of ChatService
                        $chatService = new ChatService();

                        // Now pass the service to the ChatController
                        $chat = new ChatController($chatService);

                        $request = new Request();
                        $request->merge(['user_id' => $userId,'room_id'=>$roomName]);

                        $response = $chat->getHistory($request);

                        $responseData = $response->getData(true);



                        if ($responseData['result'] === 'success') {
                            // Join the room and send chat history
                            $socket->join($roomName);
                            $socket->emit('chat-history', [
                                'result' => 'success',
                                'message' => $responseData['message'],
                                'data' => $responseData['data']
                            ]);
                        } else {
                            $socket->emit('error', [
                                'result' => 'error',
                                'message' => $responseData['message'],
                                'data' => null
                            ]);
                        }
                    } catch (\Exception $e) {
                        $socket->emit('error', [
                            'result' => 'error',
                            'message' => 'Error fetching chat history',
                            'data' => null
                        ]);
                    }
                });

                // Handle sending messages
                $socket->on('send-message', function ($data) use ($socket, $io) {
                    $roomName = $data['room_id'];
                    $userId = $data['user_id'];


                    // Leave previous rooms
                    foreach ($socket->rooms as $room) {
                        $socket->leave($room);
                    }
                    $socket->join($roomName);


                    $clientsInRoom = $io->sockets->adapter->rooms[$roomName] ?? null;
                    $numClients = is_array($clientsInRoom) ? count($clientsInRoom) : 0;

                    $markAsRead = ($numClients === 2) ? 1 : 0;

//                    dd($markAsRead,$numClients);


//                    $client = new Client();
                    try {
//                        $response = $client->post(env('APP_URL') . '/send-message', [
//                            'form_params' => [
//                                'user_id' => $socket->userId,
//                                'room_id' => $roomName,
//                                'receiver_id' => $data['receiver_id'],
//                                'message' => $data['message'],
//                                'is_read' => $markAsRead
//                            ]
//                        ]);

//                        $responseData = json_decode($response->getBody()->getContents(), true);

                        // Manually create an instance of ChatService
                        $chatService = new ChatService();

                        // Now pass the service to the ChatController
                        $chat = new ChatController($chatService);

                        $request = new Request();
                        $request->merge([
                            'user_id' => $userId,
                            'receiver_id' => $data['receiver_id'],
                            'message' => $data['message'],
                            'is_read' => $markAsRead,
                            'room_id'=>$roomName,

                        ]);

                        $response = $chat->sendMessage($request);

                        $responseData = $response->getData(true);

                        if ($responseData['result'] === 'success') {
                            // Send message to room
                            $io->to($roomName)->emit('save-message', [
                                'result' => 'success',
                                'message' => $responseData['message'],
                                'data' => $responseData['data'],
//                                'numClients' => $numClients
                            ]);

                            $requestForList = new Request();
                            $requestForList->merge(['user_id' => $userId]);

                            $listResponse = $chat->getConversationList($requestForList);

                            $listResponseData = $listResponse->getData(true);

                            if ($listResponseData['result'] === 'success') {


                                $io->emit($userId.'-conversation-list', [
                                    'result' => 'success',
                                    'message' => $listResponseData['message'],
                                    'data' => $listResponseData['data']
                                ]);

                            }


                            $requestForListReceiver = new Request();
                            $requestForListReceiver->merge(['user_id' => $data['receiver_id']]);

                            $listResponseReceiver = $chat->getConversationList($requestForListReceiver);

                            $listResponseDataReceiver = $listResponseReceiver->getData(true);

                            if ($listResponseDataReceiver['result'] === 'success') {


                                $io->emit($data['receiver_id'].'-conversation-list', [
                                    'result' => 'success',
                                    'message' => $listResponseDataReceiver['message'],
                                    'data' => $listResponseDataReceiver['data']
                                ]);




                            }

                            if($numClients != 2)
                            {
                                $findUser = User::find($data['receiver_id']);
                                if($findUser)
                                {
                                    $title = 'Message Received';
                                    $message = 'A new message has been received';
                                    $this->sendChatNotification($findUser->fcm_token,$title,$message);
                                }
                            }







                        }
                    } catch (\Exception $e) {
                        $socket->emit('error', [
                            'result' => 'error',
                            'message' => 'Error sending message',
                            'data' => null
                        ]);
                    }
                });


                // Leave a room
                $socket->on('leave-room', function ($data) use ($socket) {
                    $roomName = $data['room_id'];
                    $socket->leave($roomName);
                    $socket->emit('leave-room-success', [
                        'result' => 'success',
                        'message' => 'Left room successfully'
                    ]);
                });


                $socket->on('get-conversation-list', function($data) use ($socket, $io) {

                    // Fetch the rooms the socket is currently in
                    $rooms = $socket->rooms;

                    // Leave all rooms
//                    foreach ($rooms as $room) {
//                        $socket->leave($room);
//                    }

                    // Assuming 'userId' is passed with the data or stored in socket
                    $userId = $socket->userId ?? $data['user_id'];


                    if (!$userId) {
                        $socket->emit('error', [
                            'result' => 'error',
                            'message' => 'User ID is required',
                            'data' => null
                        ]);
                        return;
                    }

                    // Fetch conversations from Laravel using the User model
                    try {
                        $user = User::find($userId);
                        if (!$user) {
                            $socket->emit('error', [
                                'result' => 'error',
                                'message' => 'User not found',
                                'data' => null
                            ]);
                            return;
                        }

//                        $client = new Client();
                        try {

                            // Manually create an instance of ChatService
                            $chatService = new ChatService();

                            // Now pass the service to the ChatController
                            $chat = new ChatController($chatService);

                            $request = new Request();
                            $request->merge(['user_id' => $userId]);

                            $response = $chat->getConversationList($request);

                            $responseData = $response->getData(true);

                            if ($responseData['result'] === 'success') {
                                // Send message to room
                                $io->emit($userId.'-conversation-list', [
                                    'result' => 'success',
                                    'message' => $responseData['message'],
                                    'data' => $responseData['data']
                                ]);

                            }



                        } catch (\Exception $e) {
                            $socket->emit('error', [
                                'result' => 'error',
                                'message' => 'Error sending message',
                                'data' => null
                            ]);
                        }


                    } catch (\Exception $e) {
                        $socket->emit('error', [
                            'result' => 'error',
                            'message' => 'Error fetching conversation list: ' . $e->getMessage(),
                            'data' => null
                        ]);
                    }
                });


                $socket->on('leave-all-room', function ($data) use ($socket) {
//                    $roomName = $data['room_id'];
//                    $socket->leave($roomName);

                    $user_id = $data['user_id'];


                    $rooms = $socket->rooms;


                    // Leave all rooms
                    foreach ($rooms as $room) {
                        $socket->leave($room);
                    }


//                    $socket->emit($user_id.'-leave-all-rooms', [
//                        'result' => 'success',
//                        'message' => 'Left room successfully'
//                    ]);

                    $socket->broadcast->emit($user_id.'-leave-all-rooms',
                         [
                            'result' => 'success',
                            'message' => 'Left room successfully'
                        ]);

                });

            });

            Worker::runAll();

        } catch (\Exception $e) {
            Log::emergency($e->getMessage());
        }
    }
}
