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
                                    <td>{{$withdrawRequest->user->full_name}}</td>
                                    <td>{{$withdrawRequest->amount}}</td>
                                    <td>{{$withdrawRequest->status == 0 ? __('title.pending'):__('title.completed')}}</td>
                                    <td>{{$withdrawRequest->request_type == 1 ? __('withdraw.card'):__('withdraw.stripe')}}</td>
                                    <td>{{\Carbon\Carbon::parse($withdrawRequest->created_at)->format('Y-m-d')}}</td>

                                    <td class="icons-td">
                                        @if($withdrawRequest->status == 0)

                                            <a data-url="{{route('withdraw.transferAmount',['withdraw'=>$withdrawRequest])}}"
                                               title="{{__('actions.change_status')}}"
                                               class="changeStatus"
                                               href="javascript:void(0)">
                                                <i data-feather="refresh-ccw">{{__('actions.change_status')}}</i>
                                            </a>

                                            @if($withdrawRequest->request_type == 1)
                                                <a data-record = "{{$withdrawRequest->cardDetail}}" href="javascript:void(0)" class="showCardDetail">
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


@endsection

@section('script')

    {{--    <script src="{{asset('admin/js/data-table.js')}}"></script>--}}

    @include('layout.admin.datatable_js')


    <script>
        $(document).ready(function () {

            $(document).on('click', '.showCardDetail', function () {
                var record = $(this).data('record');

                var html = '<h3><strong>Cardholder Name: </strong> '+ record.card_holder_name +'  </h3>';
                 html += '<h3><strong>Card Number: </strong> '+ cc_format(record.card_number) +'  </h3>';
                 html += '<h3><strong>Cardholder Expiry Month: </strong> '+ record.card_expiry_month +'  </h3>';
                 html += '<h3><strong>Cardholder Expiry Year: </strong> '+ record.card_expiry_year +'  </h3>';

                 $('.modal-body').html(html);
                $('#card_detail_modal').modal('show');
            });

            $('.changeStatus').click(function () {
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
            for (i=0, len=match.length; i<len; i+=4) {
                parts.push(match.substring(i, i+4))
            }
            if (parts.length) {
                return parts.join(' ')
            } else {
                return value
            }
        }
    </script>
@endsection




