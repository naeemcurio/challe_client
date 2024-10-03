@extends('layout.admin.index')

@section('title')

    {{env('APP_NAME')}} - {{__('title.chat')}}

@endsection

@section('style')
    <style>
        /* width */
        .chat-body-placeholder::-webkit-scrollbar {
            width: 4px;
            border-radius: 10px;
        }

        /* Track */
        .chat-body-placeholder::-webkit-scrollbar-track {
            background: rgba(255,255,255,0.02);
            border-radius: 10px;
        }

        /* Handle */
        .chat-body-placeholder::-webkit-scrollbar-thumb {
            background: #888;
            order-radius: 10px;
        }

        /* Handle on hover */
        .chat-body-placeholder::-webkit-scrollbar-thumb:hover {
            background: #555;
            order-radius: 10px;
        }
    </style>
@endsection

@section('content')

    <div class="row chat-wrapper">
        <div class="col-md-12">
            <div class="card">
                <div class="card-body">
                    <div class="row position-relative">
                        <div class="col-lg-4 chat-aside border-end-lg">
                            <div class="aside-content">
                                <div class="aside-header">
                                    <div class="d-flex justify-content-between align-items-center pb-2 mb-2">
                                        <div class="d-flex align-items-center">
                                            <figure class="me-2 mb-0">
                                                @if(Auth::user()->image)
                                                    <img src="{{asset(Auth::user()->image)}}"
                                                         class="img-sm rounded-circle" alt="profile">
                                                @else
                                                    <img src="{{asset('admin/img/admin.png')}}"
                                                         class="img-sm rounded-circle" alt="profile">
                                                @endif
                                                {{--                        <div class="status online"></div>--}}
                                            </figure>
                                            <div>
                                                <h6>{{Auth::user()->full_name}}</h6>
                                                {{--                                                <p class="text-muted tx-13">Software Developer</p>--}}
                                            </div>
                                        </div>
                                        {{--                <div class="dropdown">--}}
                                        {{--                    <a type="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">--}}
                                        {{--                        <i class="icon-lg text-muted pb-3px" data-feather="settings"></i>--}}
                                        {{--                    </a>--}}
                                        {{--                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">--}}
                                        {{--                        <a class="dropdown-item d-flex align-items-center" href="javascript:;"><i data-feather="eye" class="icon-sm me-2"></i> <span class="">View Profile</span></a>--}}
                                        {{--                        <a class="dropdown-item d-flex align-items-center" href="javascript:;"><i data-feather="settings" class="icon-sm me-2"></i> <span class="">End Chat</span></a>--}}
                                        {{--                    </div>--}}
                                        {{--                </div>--}}
                                    </div>
                                    {{--                                    <form class="search-form">--}}
                                    {{--                                        <div class="input-group">--}}
                                    {{--                                            <span class="input-group-text">--}}
                                    {{--                                              <i data-feather="search" class="cursor-pointer"></i>--}}
                                    {{--                                            </span>--}}
                                    {{--                                            <input type="text" class="form-control" id="searchForm" placeholder="Search here...">--}}
                                    {{--                                        </div>--}}
                                    {{--                                    </form>--}}
                                </div>
                                @include('admin.chat.sections.chat_threads')
                            </div>
                        </div>

                        @include('admin.chat.sections.chat_screen')
                    </div>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('script')
    <script src="{{asset('admin/js/chat.js')}}"></script>
{{--    <script src="{{asset('admin/js/socket_io.js')}}"></script>--}}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.3.0/socket.io.js"></script>

    <script>

        const adminToken = '{{ $token }}';

        console.log(adminToken);

        var socket = io.connect('{{ env('CHAT_SOCKET_URL') }}');

        let currentReceiverId = null;
        let currentRoomId = null;
        let pageVisit = 1;

        $(document).ready(function () {


            // Emit 'get-conversation-list' event to fetch conversations
            socket.emit('get-conversation-list',{'user_id':{{Auth::user()->id}}});

            $.blockUI({
                css: {
                    border: 'none',
                    padding: '15px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }
            });

            // Listen for 'conversation-list' event to receive the response
            socket.on({{Auth::user()->id}} + '-conversation-list', function (data) {
                console.log('here');
                console.log('Received conversation list:', data);

                var asset = "{{asset('')}}";

                console.log(data.data, data.data.length > 0)

                $.unblockUI();

                if (data.data && data.data.length > 0) {
                    // Clear the existing list if needed
                    const conversationList = document.getElementById('conversation-list');
                    conversationList.innerHTML = '';

                    // Process each conversation
                    data.data.forEach((conversation, index) => {
                        // Create a new list item element
                        const listItem = document.createElement('li');
                        listItem.className = 'chat-item pe-1';
                        listItem.id = `chat-item-${conversation.room_id}`;
                        // Set the inner HTML for the list item
                        listItem.innerHTML = `
                <a href="javascript:;" class="d-flex align-items-center" onclick="openChat('${conversation.room_id}','${conversation.user_id}', '${conversation.full_name}', '${conversation.image ? conversation.image : 'admin/img/admin.png'}');  setActiveChat('${conversation.room_id}')">
                    <figure class="mb-0 me-2">
                        <img src="${conversation.image ? asset+conversation.image : asset+'admin/img/admin.png'}" class="img-xs rounded-circle" alt="user">
                        {{-- Uncomment and adjust as needed
                        <div class="status online"></div>
                        --}}
                        </figure>

                        <div class="d-flex justify-content-between flex-grow-1 border-bottom">
                            <div>
                                <p class="text-body fw-bolder">${conversation.full_name || 'Unknown'}</p>
                            <p class="text-muted tx-13">${conversation.last_message || 'No message'}</p>
                        </div>
                        <div class="d-flex flex-column align-items-end">
                            ${conversation.message_send_time_format ? `<p class="text-muted tx-13 mb-1">${conversation.message_send_time_format}</p>` : `<p class="text-muted tx-13 mb-1">00:00:00</p>`}

                            <div class="badge rounded-pill bg-primary ms-auto">${conversation.unread_message || 0}</div>
                        </div>
                    </div>
                </a>
            `;

                        // Append the new list item to the conversation list container
                        document.getElementById('conversation-list').appendChild(listItem);

                        console.log(index,pageVisit,'hello');
                        if (index === 0 && pageVisit == 1) {
                            console.log(pageVisit);
                            openChat(conversation.room_id,conversation.user_id, conversation.full_name, conversation.image ?  conversation.image: 'admin/img/admin.png');
                            setActiveChat(conversation.room_id);
                            pageVisit = pageVisit +1;
                        }
                    });
                } else {
                   var html = '<h6 class="card-title text-center">No conversations found</h6>';

                   $('.card-body').html(html);

                   console.log('No conversations found');
                }

            });


            socket.on('chat-history', function(data) {
                console.log('Received chat history:', data);
                var assetUrl = "{{ asset('') }}";
                $.unblockUI();
                // Ensure 'data' is an array and has items
                if (data.data &&  data.data.length > 0) {
                    // Clear the existing messages if needed
                    const messageList = document.querySelector('ul.messages');
                    messageList.innerHTML = '';

                    // Process each message
                    data.data.forEach(message => {
                        // Create a new message item element
                        const messageItem = document.createElement('li');
                        messageItem.className = `message-item ${message.sender_id === {{Auth::user()->id}} ? 'me' : 'friend'}`;

                        var imageShow = '';

                        if(message.sender_id == {{Auth::user()->id}})
                        {
                            imageShow = assetUrl+message.sender_image;
                        }

                        if(message.receiver_id == {{Auth::user()->id}})
                        {
                            console.log(message.receiver_image);
                            imageShow = assetUrl+message.sender_image;
                        }



                        // Set the inner HTML for the message item
                        messageItem.innerHTML = `
                            <img src="${imageShow}" class="img-xs rounded-circle" alt="avatar">
                            <div class="content">
                                <div class="message">
                                    <div class="bubble">
                                        <p>${message.message || 'No message content'}</p>
                                    </div>
                                    <span>${message.created_at} ${message.sender_id === {{Auth::user()->id}} ? message.sender_time:message.receiver_time}</span>
                                </div>
                            </div>
                        `;

                        // Append the new message item to the messages container
                        messageList.appendChild(messageItem);

                    });

                    if(data.data.length > 10)
                    {
                        console.log(data.data.length,data.data);
                        console.log('scroll');
                        scrollToBottom();

                        let chatBody = document.querySelector('.chat-body');
                        if(chatBody) {
                            // Setting position to relative and removing display:none
                            chatBody.style.position = 'relative';
                            // chatBody.style.display = 'block'; // or '' to remove any inline display:none
                        }
                    }
                    else{
                        let chatBody = document.querySelector('.chat-body');
                        if(chatBody) {
                            // Setting position to relative and removing display:none
                            chatBody.style.position = 'inherit';
                            // chatBody.style.display = 'block'; // or '' to remove any inline display:none
                        }
                    }


                } else {
                    let chatBody = document.querySelector('.chat-body');
                    if(chatBody) {
                        // Setting position to relative and removing display:none
                        chatBody.style.position = 'inherit';
                        // chatBody.style.display = 'block'; // or '' to remove any inline display:none
                    }
                    console.log('No chat history found');
                }
            });


            $(document).on('click','#sendMessageButton',function(){
                if($('#chatForm').val() == '')
                {
                    errorMsg('Please Type Something in field');
                    return false;
                }
                sendMessage();
            });

            $(document).on('keypress','#chatForm',function(e){
                if (e.key === 'Enter') {
                    e.preventDefault();

                    if($('#chatForm').val() == '')
                    {
                        errorMsg('Please Type Something in field');
                        return false;
                    }

                    sendMessage();
                }
            });

            socket.on('save-message', function (data) {
                console.log('Message saved successfully:', data);
                var assetUrl = "{{ asset('') }}";
                if(data.data.receiver_id == {{Auth::user()->id}})
                {
                    const messageList = document.querySelector('.messages');
                    const messageItem = document.createElement('li');
                    messageItem.className = 'message-item friend'; // Add class 'me' for sent messages
                    messageItem.innerHTML = `
                    <img src="${assetUrl+data.data.sender_image}" class="img-xs rounded-circle" alt="avatar">
                    <div class="content">
                        <div class="message">
                            <div class="bubble">
                                <p>${data.data.message}</p>
                            </div>
                            <span>${data.data.message_send_time}</span>
                        </div>
                    </div>
                `;
                    messageList.appendChild(messageItem);

                    // Scroll to the bottom of the chat
                    messageList.scrollTop = messageList.scrollHeight;
                    // Handle the message saving confirmation here if needed
                    socket.emit('get-conversation-list',{'user_id':{{Auth::user()->id}}});
                }
                scrollToBottom();
            });

            // socket.emit('get-conversation-list');

        });

        function openChat(roomId,userId, userName, userImage) {
            $.blockUI({
                css: {
                    border: 'none',
                    padding: '15px',
                    backgroundColor: '#000',
                    '-webkit-border-radius': '10px',
                    '-moz-border-radius': '10px',
                    opacity: .5,
                    color: '#fff'
                }
            });


            console.log('in open chat');

            console.log(userImage);

            currentReceiverId = userId; // Example: Extract '19' from 'private-1-19'
            currentRoomId = roomId;

            // Emit 'get-chat-history' event with the room_id
            socket.emit('get-chat-history', { room_id: roomId,'user_id':{{Auth::user()->id}}} );

            var asset = "{{asset('')}}";

            // Update the chat header with user details
            document.querySelector('.chat-header figure img').src = asset+userImage;
            document.querySelector('.chat-header p').textContent = userName || 'Unknown';

            let baseUrl = "{{ url('/close_chat') }}";

            let url = `${baseUrl}/${currentReceiverId}`;

            document.querySelector('.chat-header a.disableChat').href = url || 'javascript:void(0)';

            // Clear previous messages
            document.querySelector('.messages').innerHTML = '';
        }

        function sendMessage() {
            const messageInput = document.getElementById('chatForm');
            const message = messageInput.value.trim();

            // Ensure the message is not empty and receiver_id and room_id are set
            if (message && currentReceiverId && currentRoomId) {
                // Prepare the data to be sent
                const data = {
                    receiver_id: currentReceiverId,
                    room_id: currentRoomId,
                    message: message,
                    user_id:{{Auth::user()->id}}
                };

                // Emit the 'send-message' event with the data
                socket.emit('send-message', data);

                // Optionally, update the UI with the sent message
                const messageList = document.querySelector('.messages');
                const messageItem = document.createElement('li');
                messageItem.className = 'message-item me'; // Add class 'me' for sent messages
                messageItem.innerHTML = `
                    <img src="{{Auth::user()->image ? asset(Auth::user()->image):asset('admin/img/admin.png')}}" class="img-xs rounded-circle" alt="avatar">
                    <div class="content">
                        <div class="message">
                            <div class="bubble">
                                <p>${message}</p>
                            </div>
                            <span>${getCurrentTime()}</span>
                        </div>
                    </div>
                `;
                messageList.appendChild(messageItem);

                // Scroll to the bottom of the chat
                messageList.scrollTop = messageList.scrollHeight;

                // Clear the message input field
                messageInput.value = '';
            }

            {{--socket.emit('get-conversation-list',{'user_id':{{Auth::user()->id}} });--}}
        }

        function getCurrentTime() {
            const now = new Date();
            let hours = now.getHours();
            const minutes = now.getMinutes().toString().padStart(2, '0');
            const ampm = hours >= 12 ? 'PM' : 'AM';
            hours = hours % 12 || 12; // Convert 24-hour time to 12-hour time, keeping 12 as 12 instead of 0
            return `${hours}:${minutes} ${ampm}`;
        }

        window.addEventListener('beforeunload', () => {
            console.log('leave room');
            // Emit 'leave-all-rooms' event when the user is about to leave the page
            socket.emit('leave-all-room',{"user_id":{{Auth::user()->id}}});
        });

        function scrollToBottom() {
            var chatBody = document.querySelector('.chat-body-placeholder');
            chatBody.scrollTop = chatBody.scrollHeight;
        }

        function setActiveChat(roomId) {

            // Remove 'active' class from all chat items
            const chatItems = document.querySelectorAll('.chat-item');
            chatItems.forEach(item => {
                item.classList.remove('active');
            });

            // Add 'active' class to the clicked chat item
            const activeItem = document.getElementById(`chat-item-${roomId}`);
            if (activeItem) {
                activeItem.classList.add('active');
            }
        }
    </script>
@endsection
