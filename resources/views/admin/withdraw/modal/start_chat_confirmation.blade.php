<div class="modal fade" id="start_chat_modal" tabindex="-1" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title h4" id="exampleModalLabel2">{{__('title.start').' '.__('title.chat')}}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="btn-close">
                </button>
            </div>
            <form id="start_chat_form" method="POST">
                @csrf
                <div class="modal-body">
                    <strong class="para3"> {{__('chat.start_chat_confirmation')}}?</strong>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-light" data-bs-dismiss="modal">{{__('actions.close')}}</button>
                    <button type="button" id="startChat" class="primary-theme-btn">{{__('title.start').' '.__('title.chat')}}</button>
                </div>
            </form>
        </div>
    </div>
</div>
