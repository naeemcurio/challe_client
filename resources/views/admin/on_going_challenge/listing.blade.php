@extends('layout.admin.index')

@section('title')

    {{env('APP_NAME')}} - {{__('title.on_going_challenge') .' '. __('title.listing')}}

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
                        <h6 class="card-title">{{__('title.on_going_challenge') .' '. __('title.listing')}}</h6>

                    </div>
                    <div class="table-responsive">
                        <table id="dataTableExample" class="table">
                            <thead>
                            <tr>
                                <th>#</th>
{{--                                <th>{{__('title.challenge').' '.__('challenge.title')}}</th>--}}
                                <th>{{__('title.challenge').' '.__('challenge.price')}}</th>
                                <th>{{__('on_going_challenge.challenger') .' '.__('on_going_challenge.1')}}</th>
                                <th>{{__('on_going_challenge.challenger') .' '.__('on_going_challenge.2')}} </th>
                                <th>{{__('on_going_challenge.winner')}} </th>
                                <th>{{__('on_going_challenge.status')}}</th>
                                <th>{{__('on_going_challenge.winning_amount')}}</th>
                                <th>{{__('users.action')}}</th>
                            </tr>
                            </thead>
                            <tbody>
                            @foreach($allChallenges as $allChallenge)
                                <tr>
                                    <td>{{$loop->iteration}}</td>
{{--                                    <td>{{$allChallenge->challenge->title}}</td>--}}
                                    <td>{{$allChallenge->challenge->price}}</td>
                                    <td>{{$allChallenge->challenger1->full_name}}</td>
                                    <td>{{$allChallenge->challenger2->full_name}}</td>
                                    <td>{{$allChallenge->winner_id ? $allChallenge->winner->full_name:'N/A'}}</td>

                                    <td>{{$allChallenge->is_completed == 1 ? 'Completed':'Pending'}}</td>
                                    <td>{{$allChallenge->winning_amount}}</td>

{{--                                    @if($allChallenge->is_completed == 1)--}}
                                        <td class="icons-td">

                                            <a title="{{__('actions.view')}}"
                                               href="{{route('on-going-challenge.show',['on_going_challenge'=>$allChallenge])}}">
                                                <i data-feather="eye">{{__('actions.view')}}</i>
                                            </a>


{{--                                            <a data-url="{{route('on-going-challenge.destroy',['on_going_challenge'=>$allChallenge])}}"--}}
{{--                                               title="{{__('actions.delete')}}"--}}
{{--                                               class="deleteRecord"--}}
{{--                                               href="javascript:void(0)">--}}
{{--                                                <i data-feather="trash">{{__('actions.delete')}}</i>--}}
{{--                                            </a>--}}
                                        </td>
{{--                                    @else--}}
{{--                                        <td>N/A</td>--}}
{{--                                    @endif--}}
                                </tr>
                            @endforeach


                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>


@endsection

@section('script')

    {{--    <script src="{{asset('admin/js/data-table.js')}}"></script>--}}

    @include('layout.admin.datatable_js')



@endsection




