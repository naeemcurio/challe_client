@extends('layout.admin.index')

@section('title')

    {{env('APP_NAME')}} - {{__('admin_sidebar.dashboard')}}

@endsection

@section('style')
    <link rel="stylesheet" href="{{asset('admin/css/dataTables.bootstrap5.css')}}">

@endsection


@section('content')

    <div class="d-flex justify-content-between align-items-center flex-wrap grid-margin">
        <div>
            <h4 class="mb-3 mb-md-0 title-dashboard">{{__('dashboard.welcome_dashboard')}}</h4>
        </div>
    </div>

    <div class="row">
        <div class="col-12 col-xl-12 stretch-card">
            <div class="row flex-grow-1">
                <div class="col-md-4 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-baseline">
                                <h6 class="card-title mb-2">{{__('admin_sidebar.user')}}</h6>

                            </div>
                            <div class="row stretch_card_content">
                                <div class="col-6 col-md-12 col-xl-6">
                                    <h3 class="">{{$users}}</h3>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-baseline">
                                <h6 class="card-title mb-2">{{__('title.challenge')}}</h6>
                            </div>
                            <div class="row stretch_card_content">
                                <div class="col-12 col-md-12 col-xl-12">
                                    <h3 class="">{{$challenges}}</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-baseline">
                                <h6 class="card-title mb-2">{{__('title.my_earning')}}</h6>
                            </div>
                            <div class="row stretch_card_content">
                                <div class="col-12 col-md-12 col-xl-12">
                                    <h3 class="">{{Auth::user()->walletBalance}}</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-md-4 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <div class="d-flex justify-content-between align-items-baseline">
                                <h6 class="card-title mb-2">{{__('title.stripe_balance')}}</h6>
                            </div>
                            <div class="row stretch_card_content">
                                <div class="col-12 col-md-12 col-xl-12">
                                    <h3 class="">{{$stripeBalance}}</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div> <!-- row -->


    <div class="row">

        <div class="col-md-12 stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between mb-3">
                        <h6 class="card-title mb-4">{{__('users.notification').' '.__('title.listing')}}</h6>
                    </div>
                    <div class="table-responsive">
                        <table id="dataTableExample" class="table">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>{{__('users.full_name')}} </th>
                                <th>{{__('title.type')}}</th>
                                <th>{{__('users.action')}}</th>
                            </tr>
                            </thead>
                            <tbody>

                            @foreach($notificationArray as $notification)
                                <tr>
                                    <td>{{$loop->iteration}}</td>
                                    <td>{{$notification['full_name']}}</td>
                                    <td>{{$notification['message']}}</td>

                                    <td class="icons-td">
                                        @if($notification['type'] == 'challenge_record_submit')
                                            <a
                                                href="{{route('on-going-challenge.show',['on_going_challenge'=>$notification['challenge_attempt_id']])}}"
                                                title="{{__('actions.view')}}">
    {{--                                           class="changeStatus"--}}
                                                <i data-feather="eye">{{__('actions.view')}}</i>
                                            </a>
                                        @else
                                            <a
                                                href="{{route('withdraw.index')}}"
                                                title="{{__('actions.view')}}">
                                                {{--                                           class="changeStatus"--}}
                                                <i data-feather="eye">{{__('actions.view')}}</i>
                                            </a>
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



@endsection


@section('script')

    @include('layout.admin.datatable_js')

@endsection






