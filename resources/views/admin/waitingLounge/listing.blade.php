@extends('layout.admin.index')

@section('title')

    {{env('APP_NAME')}} - {{__('waiting_lounge.seeking_a_match') .' '. __('title.listing')}}

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
{{--                        <h6 class="card-title">{{__('waiting_lounge.seeking_a_match') .' '. __('title.listing')}}</h6>--}}
                        <h6 class="card-title">{{__('waiting_lounge.seeking_a_match') }}</h6>

                    </div>
                    <div class="table-responsive">
                        <table id="dataTableExample" class="table">
                            <thead>
                            <tr>
                                <th>#</th>
                                {{--                                <th>{{__('challenge.title')}}</th>--}}
                                <th>{{__('title.user')}}</th>
                                <th>{{__('challenge.price')}}</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($data as $waitingLounge)
                                <tr>
                                    <td>{{$loop->iteration}}</td>
                                    <td>{{$waitingLounge->user->full_name}}</td>
                                    <td>{{$waitingLounge->price->price}}</td>
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
                var bank_name = "{{__('withdraw.bank_name')}}";
                var account_number = "{{__('withdraw.account_number')}}";
                var additional_info = "{{__('withdraw.additional_info')}}";

                var html = '<h3><strong>'+bank_name+': </strong> '+ record.bank_name +'  </h3>';
                 html += '<h3><strong>'+account_number+': </strong> '+ record.account_number +'  </h3>';
                 html += '<h3><strong>'+additional_info+': </strong> '+ record.additional_info +'  </h3>';
                 // html += '<h3><strong>Cardholder Expiry Year: </strong> '+ record.card_expiry_year +'  </h3>';

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




