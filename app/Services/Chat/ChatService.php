<?php

namespace App\Services\Chat;


use App\Models\ChatMessage;
use App\Models\ChatRoom;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

class ChatService
{
    public function changeStatus($chatRoom)
    {
        try {
            if ($chatRoom->status == 1) {
                $chatRoom->status = 0;
            } else {
                $chatRoom->status = 1;
            }
            $chatRoom->save();

            $response = ['type' => 'success'];
            return $response;
        } catch (\Exception $e) {
            $response = ['type' => 'error', 'message' => $e];
            return $response;
        }
    }

    public function create($user)
    {
        try {
            $chatRoom = new ChatRoom();
            $chatRoom->user_1 = Auth::user()->id;
            $chatRoom->user_2 = $user->id;
            $chatRoom->room_name = 'private-' . Auth::user()->id . '-' . $user->id;

            $chatRoom->save();

            $response = ['type' => 'success', 'data' => $chatRoom];
            return $response;
        } catch (\Exception $e) {
            $response = ['type' => 'error', 'message' => $e];
            return $response;
        }
    }

    public function chatResponse($userChats, $loggedInUserId)
    {
        $chats = array();

        foreach ($userChats as $chat) {
            if ($chat->user1->id == $loggedInUserId) {
                $fetchLastMessageRecord = $this->lastMessageTime($chat->id,
                    $chat->user1->timezone);

                $chats[] = [
                    'full_name' => $chat->user2->full_name,
                    'email' => $chat->user2->email,
                    'image' => $chat->user2->image  ,
                    'user_id' => $chat->user2->id,
                    'room_id' => $chat->room_name,
                    'last_message_time' => isset($fetchLastMessageRecord['lastMessageTime']) ? $fetchLastMessageRecord['lastMessageTime'] : null,
                    'last_message' => isset($fetchLastMessageRecord['lastMessage']) ? $fetchLastMessageRecord['lastMessage'] : null,
                    'message_send_time' => isset($fetchLastMessageRecord['messageSendTime']) ? $fetchLastMessageRecord['messageSendTime'] : null,
                    'message_send_time_format' => isset($fetchLastMessageRecord['messageSendTimeFormat']) ? $fetchLastMessageRecord['messageSendTimeFormat'] : null,
                    'unread_message' => $this->getUnreadMessageCount($chat->id, $chat->user1->id),
                ];

            } elseif ($chat->user2->id == $loggedInUserId) {

                $fetchLastMessageRecord = $this->lastMessageTime($chat->id,
                    $chat->user2->timezone);

                $chats[] = [
                    'full_name' => $chat->user1->full_name,
                    'email' => $chat->user1->email,
                    'user_id' => $chat->user1->id,
                    'image' => $chat->user1->image ,
                    'room_id' => $chat->room_name,
                    'last_message_time' => isset($fetchLastMessageRecord['lastMessageTime']) ? $fetchLastMessageRecord['lastMessageTime'] : null,
                    'last_message' => isset($fetchLastMessageRecord['lastMessage']) ? $fetchLastMessageRecord['lastMessage'] : null,
                    'message_send_time' => isset($fetchLastMessageRecord['messageSendTime']) ? $fetchLastMessageRecord['messageSendTime'] : null,
                    'message_send_time_format' => isset($fetchLastMessageRecord['messageSendTimeFormat']) ? $fetchLastMessageRecord['messageSendTimeFormat'] : null,
                    'unread_message' => $this->getUnreadMessageCount($chat->id, $chat->user2->id),

                ];

            }
        }

        return $chats;
    }

    public function messageHistory($chatMessages, $loggedInUserId)
    {
        $messages = array();
        foreach ($chatMessages as $chatMessage) {
            if ($chatMessage->receiver_id == $loggedInUserId) {
                $chatMessage->update(['is_read' => 1]);
            }

            $messages[] = [
                'id' => $chatMessage->id,
                'room_id' => $chatMessage->chatRoom->room_name,
                'sender_id' => $chatMessage->sender_id,
                'message' => $chatMessage->message,
                'receiver_id' => $chatMessage->receiver_id,

                'sender_name' => $chatMessage->sender->full_name,
                'sender_image' => $chatMessage->sender->image ?? 'admin/img/admin.png' ,
                'receiver_name' => $chatMessage->receiver->full_name,
                'receiver_image' => $chatMessage->receiver->image ?? 'admin/img/admin.png' ,

                'created_ago' => Carbon::parse($chatMessage->created_at)->diffForHumans(),
                'created_at' => Carbon::parse($chatMessage->created_at)->format('d-m-Y'),
                'receiver_time' => Carbon::parse($chatMessage->created_at)->tz($chatMessage->receiver->timezone)->format('h:i A'),
                'sender_time' => Carbon::parse($chatMessage->created_at)->tz($chatMessage->sender->timezone)->format('h:i A')

//                    'receiver_name' => $chatMessage->receiver->user_name,
            ];

        }

        return $messages;

    }

    public function getUnreadMessageCount($conversation_id, $user_id)
    {
        $data = ChatMessage::where('chat_room_id', $conversation_id)
            ->where('receiver_id', $user_id)
            ->where('is_read', 0)->count();

        return $data;
    }

    public function lastMessageTime($conversation_id, $timeZone)
    {
        $userChats = ChatMessage::where('chat_room_id', $conversation_id)
            ->orderBy('id', 'desc')->first();

        $response = array();

        if ($userChats) {
            $response = [
                'lastMessageTime' => Carbon::parse($userChats->created_at)->tz($timeZone)->format('h:i A'),
                'lastMessage' => $userChats->message,
                'messageSendTime' => strtotime($userChats->created_at),
                'messageSendTimeFormat' => Carbon::parse($userChats->created_at)->tz($timeZone)->diffForHumans()
            ];

        }
        return $response;


    }

    public function saveChatMessage($findChat, $sender, $receiver, $message, $isRead)
    {
        try {
            $saveMessage = ChatMessage::create([
                'chat_room_id' => $findChat->id,
                'sender_id' => $sender,
                'receiver_id' => $receiver,
                'message' => $message,
                'is_read' => $isRead
            ]);



            $saveMessage->message_send_time_format = Carbon::parse($saveMessage->created_at)->tz($saveMessage->receiver->timezone)->diffForHumans();
            $saveMessage->created_ago = Carbon::parse($saveMessage->created_at)->tz($saveMessage->receiver->timezone)->diffForHumans();
            $saveMessage->message_send_time = Carbon::parse($saveMessage->created_at)->tz($saveMessage->receiver->timezone)->format('h:i A');
            $saveMessage->sender_time = Carbon::parse($saveMessage->created_at)->tz($saveMessage->sender->timezone)->format('h:i A');
            $saveMessage->receiver_time = Carbon::parse($saveMessage->created_at)->tz($saveMessage->receiver->timezone)->format('h:i A');

            $saveMessage->sender_name = $saveMessage->sender->full_name;
            $saveMessage->sender_image = $saveMessage->sender->image  ;
            $saveMessage->makeHidden('receiver','sender');

            $saveMessage->room_id = $findChat->room_name;

            $response = ['type' => 'success', 'data' => $saveMessage];
            return $response;
        } catch (\Exception $e) {

            $response = ['type' => 'error', 'message' => $e];
            return $response;
        }
    }
}
