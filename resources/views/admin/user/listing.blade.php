@extends('layout.admin.index')

@section('title')

    {{env('APP_NAME')}} - {{__('title.user_listing')}}

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
                        <h6 class="card-title">{{__('title.user_listing')}}</h6>
                        <a title="{{__('actions.create')}}" href="{{route('users.create')}}" class="icons">
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

    @include('admin.user.modal.delete_modal')
    @include('admin.user.modal.start_chat_confirmation')


@endsection

@section('script')

    {{--    <script src="{{asset('admin/js/data-table.js')}}"></script>--}}

    @include('layout.admin.datatable_js')
    {{ $dataTable->scripts(attributes: ['type' => 'module']) }}


    <script>
        $(document).ready(function () {

            $(document).on('click', '.startChatConfirmation', function () {
                var url = $(this).data('url');

                $('#start_chat_form').attr('action', url);
                $('#start_chat_modal').modal('show');
            });

            $('#startChat').click(function () {
                var data = $('#start_chat_form').serialize();
                var url = $('#start_chat_form').attr('action');

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

                    success: function (response, status,xhr) {
                        $.unblockUI();
                        var statusCode = xhr.status;

                        if (response.result == 'success') {

                            successMsg(response.message);
                            console.log(status,response.data.url,statusCode);

                            // if (statusCode == 201) {
                                console.log(response.data.url);
                                window.location.href = response.data.url;
                            // }

                        } else if (response.result == 'error') {
                            errorMsg(response.message);
                        }
                    },
                    error: function (data, status) {
                        $.unblockUI();
                        errorMsg(data.responseJSON.message);


                    },


                });
            });

            $(document).on('click', '.deleteRecord', function () {
                var url = $(this).data('url');

                $('#delete_form').attr('action', url);
                $('#delete_modal').modal('show');
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
                            successMsg("{{__('response_message.record_delete_success')}}");

                            setTimeout(function () {
                                window.location.reload();
                            }, 1000);
                        }

                        if (response.result == 'error') {
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
                        } else {
                            $.unblockUI();
                            errorMsg(data.responseJSON.message);
                        }
                    },


                });
            });

        });
    </script>
@endsection




