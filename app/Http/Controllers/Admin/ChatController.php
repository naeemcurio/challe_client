<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\ChatMessage;
use App\Models\ChatRoom;
use App\Models\User;
use App\Services\Chat\ChatService;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;

class ChatController extends Controller
{
    public $chatService;

    public function __construct(ChatService $chatService)
    {
        $this->chatService = $chatService;
    }


    public function index()
    {
        $user = Auth::user();

        Auth::guard('sanctum')->user()->tokens()->delete();
        $token = Auth::user()->createToken('ChalleApp')->plainTextToken;

        return view('admin.chat.chat', compact('token'));
    }

    public function startChat(User $user)
    {
//        $findChat = ChatRoom::where(function ($query) use ($user) {
//            $query->where('user_1', Auth::user()->id)
//                ->orWhere('user_2', $user->id);
//        })
//            ->first();

        $findChat = ChatRoom::where('user_1',Auth::user()->id)
            ->where('user_2',$user->id)
            ->first();


        if (!$findChat) {
            $createChat = $this->chatService->create($user);

            if ($createChat['type'] == 'error') {
                return makeResponse('error', __('response_message.error_message_line') . ' ' . __('response_message.record') . ' :' . $createChat['message'], Response::HTTP_INTERNAL_SERVER_ERROR);
            }

            $data = [
                'url' => route('chat.index'),
                'chat' => $createChat['data']
            ];
            return makeResponse('success', __('chat.status') . ' ' . __('chat.created_success'), Response::HTTP_CREATED, $data);

        } else {
            if ($findChat->status == 1) {
                $saveStatus = $this->chatService->changeStatus($findChat);

                if ($saveStatus['type'] == 'error') {
                    return makeResponse('error', __('response_message.error_message_line') . ' ' . __('response_message.record') . ' :' . $saveStatus['message'], Response::HTTP_INTERNAL_SERVER_ERROR);
                }

                $data = [
                    'url' => route('chat.index'),
                    'chat' => $findChat
                ];
                return makeResponse('success', __('chat.status') . ' ' . __('chat.change_success'), Response::HTTP_OK, $data);
            } elseif ($findChat->status == 0) {
                $saveStatus = $this->chatService->changeStatus($findChat);

                if ($saveStatus['type'] == 'error') {
                    return makeResponse('error', __('response_message.error_message_line') . ' ' . __('response_message.record') . ' :' . $saveStatus['message'], Response::HTTP_INTERNAL_SERVER_ERROR);
                }

                $data = [
                    'url' => route('chat.index'),
                    'chat' => $findChat
                ];
                return makeResponse('success', __('chat.status') . ' ' . __('chat.created_success'), Response::HTTP_OK, $data);

            }
        }
    }

    public function getConversationList(Request $request)
    {
        if($request->user_id)
        {
            $loggedInUserId = $request->user_id;
        }


        $userChats = ChatRoom::with(['user1', 'user2'])
            ->where(function ($query) use ($loggedInUserId) {
                $query->where('user_1', $loggedInUserId)->orWhere('user_2', $loggedInUserId);
            })
            ->where('status', '!=', 1)
            ->get();


//        return makeResponse('error', 'Conversation List Found: '.sizeof($userChats),
//            Response::HTTP_INTERNAL_SERVER_ERROR);


        $getChatResponse = array();
        if (sizeof($userChats) > 0) {
            $getChatResponse = $this->chatService->chatResponse($userChats, $loggedInUserId);
        }


        return makeResponse('success', 'Conversation List Found',
            Response::HTTP_OK, $getChatResponse);


//
//        return makeResponse('success', 'Conversation List Found',
//            200, $chats);


    }

    public function getHistory(Request $request)
    {
        $room = $request->room_id;
        $loggedInUserId = $request->user_id;

        $chatRoom = ChatRoom::where(function ($query) use ($loggedInUserId) {
            $query->where('user_1', $loggedInUserId)
                ->orWhere('user_2', $loggedInUserId);
        })->where('room_name', $room) // Assuming room_id is passed in the request
        ->first();

        if (!$chatRoom) {
            return makeResponse('error', 'No Chat Record Found', 404);
        }

        $chatMessages = ChatMessage::with(['sender', 'receiver'])
            ->where('chat_room_id', $chatRoom->id)
            ->get();


        $messages = array();
        if (sizeof($chatMessages) > 0) {

            $messages = $this->chatService->messageHistory($chatMessages, $loggedInUserId);

            return makeResponse('success', 'Message Fetch Successfully', 200, $messages);
        } else {
            return makeResponse('success', 'No Previous Message Found', 200, $messages);
        }


    }

    public function sendMessage(Request $request)
    {
        if ($request->room_id) {
            $sender = $request->user_id;
            $receiver = $request->receiver_id;
            $isRead = $request->is_read;


            $findChat = ChatRoom::where(function ($query) use ($sender, $receiver) {
                $query->where(function ($subQuery) use ($sender, $receiver) {
                    $subQuery->where('user_1', $sender)->where('user_2', $receiver);
                })->orWhere(function ($subQuery) use ($sender, $receiver) {
                    $subQuery->where('user_1', $receiver)->where('user_2', $sender);
                });
            })
                ->where('room_name', $request->room_id)
                ->first();


            if (!$findChat) {
                return makeResponse('error', 'Incorrect ID', 422);
            }


            $saveMessage = $this->chatService->saveChatMessage($findChat, $sender, $receiver, $request->message, $isRead);

            if ($saveMessage['type'] == 'error') {
                return makeResponse('error', __('response_message.error_message_line') . ' ' . __('chat.message') . ': ' . $saveMessage['message'], Response::HTTP_INTERNAL_SERVER_ERROR);

            }


            $data = isset($saveMessage['data']) ? $saveMessage['data'] : '';


            return makeResponse('success', __('chat.send_success'), Response::HTTP_OK, $data);


        }
    }


    public function closeChat($user_id)
    {
        $findChat = ChatRoom::where(function ($query) use ($user_id) {
            $query->where('user_1', Auth::user()->id)
                ->Where('user_2', $user_id);
        })
            ->first();



        if ($findChat->status == 0) {
            $saveStatus = $this->chatService->changeStatus($findChat);

            if ($saveStatus['type'] == 'error') {
                return redirect()->route('chat.index')->with('error',__('response_message.error_message_line') . ' ' . __('response_message.record') . ' :' . $saveStatus['message']);
            }

            $data = [
                'url' => route('chat.index'),
                'chat' => $findChat
            ];

            return redirect()->route('chat.index')->with('success', __('chat.status') . ' ' . __('chat.change_success'));

//            return makeResponse('success', __('chat.status') . ' ' . __('chat.created_success'), Response::HTTP_OK, $data);

        }

    }
}
