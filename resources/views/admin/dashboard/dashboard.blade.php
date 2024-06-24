@extends('layout.admin.index')

@section('title')

    {{env('APP_NAME')}} - {{__('admin_sidebar.dashboard')}}

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



@endsection






