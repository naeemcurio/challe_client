@extends('layout.admin.index')

@section('title')

    {{env('APP_NAME')}} - {{__('title.user').' '.__('actions.create')}}

@endsection

@section('style')
    <link rel="stylesheet" href="{{asset('admin/css/jquery-ui.css')}}">

    <style>
        .ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active, a.ui-button:active, .ui-button:active, .ui-button.ui-state-active:hover {
            background: #007fff !important;
        }
    </style>
@endsection


@section('content')
    <div class="d-flex justify-content-between align-items-center flex-wrap grid-margin">
        <div>
            <h4 class="mb-3 mb-md-0 title-dashboard">{{__('title.user').' '.__('actions.create')}}</h4>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 stretch-card">
            <div class="card">
                <div class="card-body">
                    <h6 class="card-title mb-4">{{__('title.user').' '.__('title.information')}} </h6>
                    <form id="createForm">
                        @csrf
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('users.full_name')}}</label>
                                    <input type="text" name="full_name" class="form-control"
                                           placeholder="{{__('title.enter')}} {{__('users.full_name')}}">
                                </div>
                            </div><!-- Col -->


                            <div class="col-sm-6">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('users.nick_name')}}</label>
                                    <input type="text" name="nick_name" class="form-control"
                                           placeholder="{{__('title.enter')}} {{__('users.nick_name')}}">
                                </div>
                            </div><!-- Col -->


                            <div class="col-sm-6">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('users.email')}}</label>
                                    <input type="email" name="email" class="form-control"
                                           placeholder="{{__('title.enter')}} {{__('users.email')}}">
                                </div>
                            </div><!-- Col -->

                            <div class="col-sm-6">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('users.phone_number')}}</label>
                                    <input type="text" name="phone_number" class="form-control"
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
                                           placeholder="{{__('title.enter')}} {{__('users.date_of_birth')}}">
                                </div>
                            </div><!-- Col -->




                            <div class="col-sm-6">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('users.gender')}}</label>
                                    <select name="gender" class="form-control">
                                        <option value="" selected disabled>{{ucfirst(__('options.select'))}}</option>
                                        <option value="{{__('options.male')}}">{{ucfirst(__('options.male'))}}</option>
                                        <option value="{{__('options.female')}}">{{ucfirst(__('options.female'))}}</option>
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
                                {{__('actions.create')}}
                            </button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection

@section('script')

    <script src="{{asset('admin/js/dropify.min.js')}}"></script>

    <script src="{{asset('admin/js/dropify.js')}}"></script>

    <script src="{{asset('admin/js/jquery-ui.js')}}"></script>



    <script>

        $(document).ready(function () {
            $('.dob').datepicker();

            $('.createBtn').click(function () {
                // var data = $('#createForm').serialize();
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
                    url: '{{route("users.store")}}',
                    data: data,
                    cache: false,
                    contentType: false,
                    processData: false,

                    success: function (response, status) {
                        if (response.result == 'success') {
                            $.unblockUI();
                            successMsg(response.message);


                            setTimeout(function () {
                                window.location.href = "{{route('users.index')}}";
                            }, 1000);

                        } else if (response.result == 'error') {
                            $.unblockUI();
                            errorMsg(response.message);
                        }


                    },
                    error: function (data, status) {
                        if (data.status == 422) {
                            $.unblockUI();
                            errorMsg(data.responseJSON.message);
                        } else {
                            $.unblockUI();
                            errorMsg(data.responseJSON.message);
                        }


                    }
                });


            });

        });

    </script>
@endsection
