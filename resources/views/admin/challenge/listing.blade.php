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
                        <table id="dataTableExample" class="table">
                            <thead>
                            <tr>
                                <th>#</th>
{{--                                <th>{{__('challenge.title')}}</th>--}}
                                <th>{{__('challenge.price')}}</th>
                                <th>{{__('challenge.video_url')}} </th>
                                <th>{{__('challenge.createdBy')}}</th>
                                <th>{{__('challenge.status')}}</th>
                                <th>{{__('users.action')}}</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($challenges as $challenge)
                                <tr>
                                    <td>{{$loop->iteration}}</td>
{{--                                    <td>{{$challenge->title}}</td>--}}
                                    <td>{{$challenge->price}}</td>
                                    <td>{{$challenge->video}}</td>
                                    <td>{{$challenge->user->full_name}}</td>
                                    <td>{{$challenge->status == 1 ? __('options.approved'):__('options.disapproved')}}</td>

                                    <td class="icons-td">
                                        <a title="{{__('actions.edit')}}"
                                           href="{{route('challenge.edit',['challenge'=>$challenge])}}">
                                            <i data-feather="edit">{{__('actions.edit')}}</i>
                                        </a>
                                        <a data-url="{{route('challenge.destroy',['challenge'=>$challenge])}}"
                                           title="{{__('actions.delete')}}"
                                           class="deleteRecord"
                                           href="javascript:void(0)">
                                            <i data-feather="trash">{{__('actions.delete')}}</i>
                                        </a>
                                    </td>
                                </tr>
                            @endforeach


                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @include('admin.challenge.modal.delete_modal')


@endsection

@section('script')

    {{--    <script src="{{asset('admin/js/data-table.js')}}"></script>--}}

    @include('layout.admin.datatable_js')


    <script>
        $(document).ready(function () {


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




