@extends('layout.admin.index')

@section('title')

    {{env('APP_NAME')}} - {{__('title.user').' '.__('actions.edit')}}

@endsection

@section('style')
    <link rel="stylesheet" href="{{asset('admin/css/jquery-ui.css')}}">

    <style>
        .ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active, a.ui-button:active, .ui-button:active, .ui-button.ui-state-active:hover {
            background: #007fff !important;
        }
    </style>

    <link rel="stylesheet" href="{{asset('admin/css/dataTables.bootstrap5.css')}}">

@endsection


@section('content')
    <div class="d-flex justify-content-between align-items-center flex-wrap grid-margin">
        <div>
            <h4 class="mb-3 mb-md-0">{{__('title.user').' '.__('actions.edit')}}</h4>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 stretch-card">
            <div class="card">
                <div class="card-body">
                    <h6 class="card-title mb-4">{{__('title.user').' '.__('title.information')}}</h6>
                    <form id="createForm" action="{{ route('users.update', ['user' => $user]) }}" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('users.full_name')}}</label>
                                    <input type="text" name="full_name" class="form-control"
                                           value="{{$user->full_name}}"
                                           placeholder="{{__('title.enter')}} {{__('users.full_name')}}">
                                </div>
                            </div><!-- Col -->


                            <div class="col-sm-6">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('users.nick_name')}}</label>
                                    <input type="text" name="nick_name" class="form-control"
                                           value="{{$user->nick_name}}"
                                           placeholder="{{__('title.enter')}} {{__('users.nick_name')}}">
                                </div>
                            </div><!-- Col -->


                            <div class="col-sm-6">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('users.email')}}</label>
                                    <input type="email" name="email" class="form-control"
                                           value="{{$user->email}}"
                                           placeholder="{{__('title.enter')}} {{__('users.email')}}">
                                </div>
                            </div><!-- Col -->

                            <div class="col-sm-6">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('users.phone_number')}}</label>
                                    <input type="text" name="phone_number" class="form-control"
                                           value="{{$user->phone_number}}"
                                           placeholder="{{__('title.enter')}} {{__('users.phone_number')}}">
                                </div>
                            </div><!-- Col -->


                            <div class="col-sm-6">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('users.password')}}</label>
                                    <input type="password" name="password" class="form-control" autocomplete="off"
                                           placeholder="{{__('title.enter')}} {{__('users.password')}}">
                                </div>
                            </div><!-- Col -->


                            <div class="col-sm-6">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('users.date_of_birth')}}</label>
                                    <input type="text" name="date_of_birth" class="dob form-control" autocomplete="off"
                                           value="{{\Carbon\Carbon::parse($user->date_of_birth)->format('m/d/Y')}}"
                                           placeholder="{{__('title.enter')}} {{__('users.date_of_birth')}}">
                                </div>
                            </div><!-- Col -->


                            <div class="col-sm-6">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('users.gender')}}</label>
                                    <select name="gender" class="form-control">
                                        <option value="" selected disabled>{{ucfirst(__('options.select'))}}</option>
                                        <option
                                            value="male" {{$user->gender == 'male' ? 'selected':''}}>{{ucfirst(__('options.male'))}}</option>
                                        <option
                                            value="female" {{$user->gender == 'female' ? 'selected':''}}>{{ucfirst(__('options.female'))}}</option>
                                    </select>
                                </div>
                            </div><!-- Col -->

                        </div>

                        <div class="row">


                            <div class="col-md-4 stretch-card grid-margin grid-margin-md-0">
                                <div class="card">
                                    <div class="card-body">
                                        <h6 class="card-title">{{__('users.profile_image')}}</h6>
                                        <input type="file"
                                               {{ $user->image ? 'data-default-file='.asset($user->image):'' }}

                                               accept="image/jpg, image/png, image/jpeg" id="profile_image"
                                               name="image" class="myDropify"/>

                                    </div>
                                </div>
                            </div>


                        </div>

                        <div class="text-end">
                            <a href="{{route('users.index')}}" class="btn btn-outline-danger">
                                {{__('actions.cancel')}}
                            </a>

                            <button type="button" class="primary-theme-btn createBtn">
                                {{__('actions.update')}}
                            </button>

                            @if(!$user->chat || $user->chat->status == 1)

                                <button type="button"
                                        data-url="{{ route('users.start_chat', ['user' => $user]) }}"
                                        class="primary-theme-btn startChatConfirmation">
                                    {{ __('title.start') . ' ' . __('title.chat') }}
                                </button>
                            @endif
                        </div>

                    </form>
                </div>


                @if(sizeof($getChallengeCreateWalletLogs) >0)
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3">
                            <h6 class="card-title mb-4">{{__('title.user').' '.__('title.wallet_history')}}</h6>
                        </div>
                        <div class="table-responsive">
                            <table id="dataTableExample" class="table">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>{{__('users.wallet_type')}}</th>
                                    <th>{{__('users.value')}} </th>
                                    <th>{{__('users.transaction_type')}}</th>
                                    <th>{{__('users.notes')}}</th>
                                    <th>{{__('users.from')}}</th>
                                    <th>{{__('users.to')}}</th>
                                </tr>
                                </thead>
                                <tbody>

                                @foreach($getChallengeCreateWalletLogs as $walletLog)
                                    <tr>
                                        <td>{{$loop->iteration}}</td>
                                        <td>
                                            @if($walletLog->wallet_name == 'wallet_1')
                                                {{__('wallet_type.wallet_1')}}
                                            @elseif($walletLog->wallet_name == 'wallet_2')
                                                {{__('wallet_type.wallet_2')}}
                                            @elseif($walletLog->wallet_name == 'wallet_3')
                                                {{__('wallet_type.wallet_3')}}
                                            @else
                                                N/A
                                            @endif
                                        </td>


                                        <td>{{$walletLog->value }} </td>
                                        <td>{{$walletLog->type}}</td>
                                        <td>{{$walletLog->notes}}</td>
                                        <td>{{$walletLog->from }}</td>
                                        <td>{{$walletLog->to }}</td>
                                    </tr>
                                @endforeach


                                </tbody>
                            </table>
                        </div>

                    </div>
                @endif

                @if(sizeof($getChallengeAttemptWalletLogs) >0)
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3">
                            <h6 class="card-title mb-4">{{__('title.user').' '.__('title.wallet_history')}}</h6>
                        </div>
                        <div class="table-responsive">
                            <table id="dataTableExample" class="table">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>{{__('users.wallet_type')}}</th>
                                    <th>{{__('users.value')}} </th>
                                    <th>{{__('users.transaction_type')}}</th>
                                    <th>{{__('users.notes')}}</th>
                                    <th>{{__('users.from')}}</th>
                                    <th>{{__('users.to')}}</th>
                                </tr>
                                </thead>
                                <tbody>

                                @foreach($getChallengeAttemptWalletLogs as $walletLog)
                                    <tr>
                                        <td>{{$loop->iteration}}</td>
                                        <td>
                                            @if($walletLog->wallet_name == 'wallet_1')
                                                {{__('wallet_type.wallet_1')}}
                                            @elseif($walletLog->wallet_name == 'wallet_2')
                                                {{__('wallet_type.wallet_2')}}
                                            @elseif($walletLog->wallet_name == 'wallet_3')
                                                {{__('wallet_type.wallet_3')}}
                                            @else
                                                N/A
                                            @endif
                                        </td>


                                        <td>{{$walletLog->value}} </td>
                                        <td>{{$walletLog->type}}</td>
                                        <td>{{$walletLog->notes}}</td>
                                        <td>{{$walletLog->from }}</td>
                                        <td>{{$walletLog->to }}</td>
                                    </tr>
                                @endforeach


                                </tbody>
                            </table>
                        </div>

                    </div>
                @endif
            </div>
        </div>
    </div>

    @include('admin.user.modal.start_chat_confirmation')


@endsection


@section('script')

    @include('layout.admin.datatable_js')

    <script src="{{asset('admin/js/dropify.min.js')}}"></script>

    <script src="{{asset('admin/js/dropify.js')}}"></script>

    <script src="{{asset('admin/js/jquery-ui.js')}}"></script>

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

                    success: function (response, status, xhr) {
                        $.unblockUI();
                        var statusCode = xhr.status;

                        if (response.result == 'success') {

                            successMsg(response.message);
                            console.log(status, response.data.url, statusCode);

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


            $('.dob').datepicker();
            $('.createBtn').click(function () {
                var url = $('#createForm').attr('action');
                var data = new FormData($('#createForm')[0]);

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
                    cache: false,
                    contentType: false,
                    processData: false,

                    success: function (response, status, xhr) {
                        $.unblockUI();
                        successMsg('{{trans('response_message.record_update')}}');
                        setTimeout(function () {
                            window.location.href = "{{route('users.index')}}";
                        }, 1000);
                    },
                    error: function (xhr, status, error) {
                        if (data.status == 422) {
                            $.unblockUI();
                            errorMsg(xhr.responseJSON.message);
                        } else {
                            $.unblockUI();
                            errorMsg(xhr.responseJSON.message);
                        }


                    }
                });


            });

        });

    </script>

@endsection
