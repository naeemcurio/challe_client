<div class="modal fade" id="video_modal" tabindex="-1" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title h4" id="exampleModalLabel2">{{__('actions.view').' '.__('challenge.video')}}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="btn-close">
                </button>
            </div>

            <div class="modal-body">
                <video id="modalVideo" width="100%" controls>
                    <source id="videoSource" src="" type="video/mp4">
                    Your browser does not support the video tag.
                </video>
            </div>
        </div>


    </div>
</div>
