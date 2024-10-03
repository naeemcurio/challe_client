@extends('layout.admin.index')

@section('title')

    {{env('APP_NAME')}} - {{__('title.withdraw') .' '. __('title.listing')}}

@endsection


@section('style')
    <link rel="stylesheet" href="{{asset('admin/css/dataTables.bootstrap5.css')}}">

    <style>

        .modal-body strong {
            color: #3AAA35;
        }

    </style>

@endsection


@section('content')

    <div class="row">
        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between mb-3">
                        <h6 class="card-title">{{__('title.withdraw') .' '. __('title.listing')}}</h6>

                    </div>
                    <div class="table-responsive">
                        <table id="dataTableExample" class="table">
                            <thead>
                            <tr>
                                <th>#</th>
                                {{--                                <th>{{__('challenge.title')}}</th>--}}
                                <th>{{__('title.requestBy')}}</th>
                                <th>{{__('challenge.price')}}</th>
                                <th>{{__('on_going_challenge.status')}}</th>
                                <th>{{__('title.request_type')}}</th>
                                <th>{{__('title.date')}}</th>
                                <th>{{__('users.action')}}</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($withdrawRequests as $withdrawRequest)
                                <tr>
                                    <td>{{$loop->iteration}}</td>
                                    {{--                                    <td>{{$challenge->title}}</td>--}}
                                    <td>
                                        <a href="{{route('users.edit',['user'=>$withdrawRequest->user])}}">
                                            {{$withdrawRequest->user->full_name}}
                                        </a>
                                    </td>
                                    <td>{{$withdrawRequest->amount}}</td>
                                    <td>{{$withdrawRequest->status == 0 ? __('title.pending'):__('title.completed')}}</td>

                                    @if($withdrawRequest->request_type == 0)
                                        <td>{{ __('withdraw.card')}}</td>
                                    @elseif($withdrawRequest->request_type == 1)
                                        <td>{{ __('withdraw.stripe')}}</td>
                                    @elseif($withdrawRequest->request_type == 2)
                                        <td>{{__('title.crypto')}}</td>
                                    @endif
                                    <td>{{\Carbon\Carbon::parse($withdrawRequest->created_at)->format('Y-m-d')}}</td>

                                    <td class="icons-td">

                                        @if(!$withdrawRequest->user->chat || $withdrawRequest->user->chat->status == 1)
                                            <a title="{{ __('title.start') . ' ' . __('title.chat') }}"
                                               href="javascript:void(0)"
                                               data-url="{{ route('users.start_chat', ['user' => $withdrawRequest->user]) }}"
                                               class="startChatConfirmation">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                     viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                     stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                     class="feather feather-message-square"
                                                     style="color: rgba(58, 170, 53);">
                                                    <path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path>
                                                </svg>

                                            </a>
                                        @endif

                                        @if($withdrawRequest->status == 0)

                                            <a data-url="{{route('withdraw.transferAmount',['withdraw'=>$withdrawRequest])}}"
                                               title="{{__('actions.change_status')}}"
                                               class="changeStatus"
                                               href="javascript:void(0)">
                                                <i data-feather="refresh-ccw">{{__('actions.change_status')}}</i>
                                            </a>

                                            @if($withdrawRequest->request_type == 1)
                                                <a data-record="{{$withdrawRequest->bankDetail}}"
                                                   href="javascript:void(0)" class="showCardDetail">
                                                    <i data-feather="eye">{{__('actions.view_card_detail')}}</i>
                                                </a>

                                            @elseif($withdrawRequest->request_type == 2)
                                                    <a data-record="{{$withdrawRequest->cryptoDetail}}"
                                                       href="javascript:void(0)" class="showCryptoDetail">
                                                        <i data-feather="eye">{{__('actions.view_card_detail')}}</i>
                                                    </a>
                                            @endif



                                        @endif

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

    @include('admin.withdraw.modal.card_detail_modal')
    @include('admin.withdraw.modal.start_chat_confirmation')


@endsection

@section('script')

    {{--    <script src="{{asset('admin/js/data-table.js')}}"></script>--}}

    @include('layout.admin.datatable_js')


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

            $(document).on('click', '.showCardDetail', function () {
                var record = $(this).data('record');
                var bank_name = "{{__('withdraw.bank_name')}}";
                var account_number = "{{__('withdraw.account_number')}}";
                var additional_info = "{{__('withdraw.additional_info')}}";

                var html = '<h3><strong>' + bank_name + ': </strong> ' + record.bank_name + '  </h3>';
                html += '<h3><strong>' + account_number + ': </strong> ' + record.account_number + '  </h3>';
                html += '<h3><strong>' + additional_info + ': </strong> ' + record.additional_info + '  </h3>';
                // html += '<h3><strong>Cardholder Expiry Year: </strong> '+ record.card_expiry_year +'  </h3>';

                $('.modal-body').html(html);
                $('#card_detail_modal').modal('show');
            });


            $(document).on('click', '.showCryptoDetail', function () {
                var record = $(this).data('record');
                var bank_name = "{{__('title.coin_type')}}";
                var account_number = "{{__('title.address')}}";
                var additional_info = "{{__('title.network')}}";

                var html = '<h3><strong>' + bank_name + ': </strong> ' + record.coin_type + '  </h3>';
                html += '<h3><strong>' + account_number + ': </strong> ' + record.address + '  </h3>';
                html += '<h3><strong>' + additional_info + ': </strong> ' + record.network + '  </h3>';

                $('.modal-body').html(html);
                $('#card_detail_modal').modal('show');
            });


            $(document).on('click', '.changeStatus', function () {
                var url = $(this).data('url');


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
                    type: 'GET',
                    url: url,

                    success: function (response, status) {

                        if (response.result == 'success') {
                            $.unblockUI();
                            successMsg(response.message);

                            setTimeout(function () {
                                window.location.reload();
                            }, 1000);

                        } else if (response.result == 'error') {
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


        function cc_format(value) {
            var v = value.replace(/\s+/g, '').replace(/[^0-9]/gi, '')
            var matches = v.match(/\d{4,16}/g);
            var match = matches && matches[0] || ''
            var parts = []
            for (i = 0, len = match.length; i < len; i += 4) {
                parts.push(match.substring(i, i + 4))
            }
            if (parts.length) {
                return parts.join(' ')
            } else {
                return value
            }
        }


    </script>
@endsection




