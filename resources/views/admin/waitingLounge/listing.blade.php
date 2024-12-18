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
                        {{ $dataTable->table() }}
{{--                        <table id="dataTableExample" class="table">--}}
{{--                            <thead>--}}
{{--                            <tr>--}}
{{--                                <th>#</th>--}}
{{--                                --}}{{--                                <th>{{__('challenge.title')}}</th>--}}
{{--                                <th>{{__('title.user')}}</th>--}}
{{--                                <th>{{__('challenge.price')}}</th>--}}
{{--                            </tr>--}}
{{--                            </thead>--}}
{{--                            <tbody>--}}
{{--                            @foreach($data as $waitingLounge)--}}
{{--                                <tr>--}}
{{--                                    <td>{{$loop->iteration}}</td>--}}
{{--                                    <td>{{$waitingLounge->user->full_name}}</td>--}}
{{--                                    <td>{{$waitingLounge->price->price}}</td>--}}
{{--                                </tr>--}}
{{--                            @endforeach--}}


{{--                            </tbody>--}}
{{--                        </table>--}}
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

    {{ $dataTable->scripts(attributes: ['type' => 'module']) }}


@endsection




