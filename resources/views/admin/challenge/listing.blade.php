@extends('layout.admin.index')

@section('title')

    {{env('APP_NAME')}} - {{__('title.challenge') .' '. __('title.listing')}}

@endsection


@section('style')
    <link rel="stylesheet" href="{{asset('admin/css/dataTables.bootstrap5.css')}}">

@endsection


@section('content')

    <div class="row">
        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between mb-3">
                        <h6 class="card-title">{{__('title.challenge') .' '. __('title.listing')}}</h6>
                        <a title="{{__('actions.create')}}" href="{{route('challenge.create')}}" class="icons">
                            <i data-feather="plus-circle">{{__('actions.create')}}</i>
                        </a>
                    </div>
                    <div class="table-responsive">
                        {{ $dataTable->table() }}
                    </div>
                </div>
            </div>
        </div>
    </div>

    @include('admin.challenge.modal.delete_modal')
    @include('admin.challenge.modal.view_video_modal')


@endsection

@section('script')

    {{--    <script src="{{asset('admin/js/data-table.js')}}"></script>--}}

    @include('layout.admin.datatable_js')

    {{ $dataTable->scripts(attributes: ['type' => 'module']) }}

    <script>
        $(document).ready(function () {


            $(document).on('click', '.deleteRecord', function () {
                var url = $(this).data('url');

                $('#delete_form').attr('action', url);
                $('#delete_modal').modal('show');
            });

            $(document).on('click','.viewVideo',function(){
                var videoUrl = $(this).data('video-url');
                // console.log(videoUrl);

                // Set the video source in the modal
                $('#videoSource').attr('src', videoUrl);

                // Load the video (this is optional, but helps in some browsers)
                $('#modalVideo')[0].load();

                // Open the modal
                $('#video_modal').modal('show');
            });

            $('#video_modal').on('hide.bs.modal', function () {
                // console.log('here');
                $('#videoSource').attr('src', '');
                $('#modalVideo')[0].load();
            });

            $('#deleteRecordBtn').click(function () {
                var url = $('#delete_form').attr('action');
                var data = $('#delete_form').serialize();


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
                $.ajax({
                    type: 'POST',
                    url: url,
                    data: data,

                    success: function (response, status) {

                        if (status === 'nocontent') {
                            $.unblockUI();
                            successMsg("{{__('response_message.record_delete_success')}}");
                            $('#delete_modal').modal('hide');
                            $('#challenge-table').DataTable().ajax.reload(null, false);
                            // setTimeout(function () {
                            //     window.location.reload();
                            // }, 1000);
                        }
                        else if (response.result == 'error') {
                            $.unblockUI();
                            errorMsg(response.message);
                        }

                    },
                    error: function (data, status) {
                        if (data.status == 404) {
                            errorMsg(data.responseJSON.message);
                            setTimeout(function () {
                                window.location.reload();
                            }, 1000);
                        }
                        else {
                            $.unblockUI();
                            errorMsg(data.responseJSON.message);
                        }


                    },


                });
            });

        });
    </script>
@endsection




