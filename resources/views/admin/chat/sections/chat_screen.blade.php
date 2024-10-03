<div class="col-lg-8 chat-content">
    <div class="chat-header border-bottom pb-2">
        <div class="d-flex justify-content-between">
            <div class="d-flex align-items-center">
                <i data-feather="corner-up-left" id="backToChatList"
                   class="icon-lg me-2 ms-n2 text-muted d-lg-none"></i>
                <figure class="mb-0 me-2">
                    <img src="{{asset('admin/img/admin.png')}}" class="img-sm rounded-circle" alt="image">

                </figure>
                <div>
                    <p></p>
                </div>
            </div>
            <div class="d-flex align-items-center me-n1">
                {{--                <a class="me-3 viewProfileButton" type="button" data-bs-toggle="tooltip" href="javascript:void(0)" data-bs-title="View Profile">--}}
                {{--                    <i data-feather="eye" class="icon-lg text-muted"></i>--}}
                {{--                </a>--}}
                <a type="button" class="d-none d-sm-block disableChat" data-bs-toggle="tooltip"
                   data-bs-title="Close Chat">
                    <i data-feather="lock" class="icon-lg text-muted"></i>
                </a>
            </div>
        </div>
    </div>
    <div class="chat-body">
        <div class="chat-body-placeholder"  style="position: relative;height: 300px; overflow-y: auto">
            <ul class="messages">

            </ul>
        </div>
    </div>
    <div class="chat-footer d-flex">

        <form class="search-form flex-grow-1 me-2" id="chatFormContainer">
            <div class="input-group">
                <input type="text" class="form-control rounded-pill" id="chatForm" placeholder="Type a message">
            </div>
        </form>
        <div>
            <button type="button" class="btn btn-primary btn-icon rounded-circle" id="sendMessageButton">
                <i data-feather="send"></i>
            </button>
        </div>
    </div>
</div>
