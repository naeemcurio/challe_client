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
                        <table id="dataTableExample" class="table">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>{{__('users.full_name')}}</th>
                                <th>{{__('users.nick_name')}}</th>
                                <th>{{__('users.email')}}</th>
                                <th>{{__('users.phone_number')}} </th>
                                <th>{{__('users.wallet_amount')}} </th>
                                <th>{{__('users.action')}}</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($users as $user)
                                <tr>
                                    <td>{{$loop->iteration}}</td>
                                    <td>{{$user->full_name}}</td>
                                    <td>{{$user->nick_name}}</td>
                                    <td>{{$user->email}}</td>
                                    <td>{{$user->phone_number}}</td>
                                    <td>{{$user->walletBalance}}</td>

                                    <td class="icons-td">
                                        <a title="{{__('actions.edit')}}" href="{{route('users.edit',['user'=>$user])}}">
                                            <i data-feather="edit">{{__('actions.edit')}}</i>
                                        </a>
                                        <a data-url="{{route('users.destroy',['user'=>$user])}}" title="{{__('actions.delete')}}"
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

    @include('admin.user.modal.delete_modal')


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

                        if(status === 'nocontent')
                        {
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




