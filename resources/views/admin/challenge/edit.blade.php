@extends('layout.admin.index')

@section('title')

    {{env('APP_NAME')}} - {{__('title.challenge').' '.__('actions.edit')}}

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
            <h4 class="mb-3 mb-md-0">{{__('title.challenge').' '.__('actions.edit')}}</h4>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 stretch-card">
            <div class="card">
                <div class="card-body">
                    <h6 class="card-title mb-4">{{__('title.challenge').' '.__('title.information')}}</h6>
                    <form id="createForm" action="{{ route('challenge.update', ['challenge' => $challenge]) }}"
                          method="POST">
                        @csrf
                        @method('PUT')
                        <div class="row">
                            {{--                            <div class="col-sm-6">--}}
                            {{--                                <div class="mb-3 innerDashboard-inputs">--}}
                            {{--                                    <label class="form-label">{{__('challenge.title')}}</label>--}}
                            {{--                                    <input type="text" name="title" class="form-control"--}}
                            {{--                                           value="{{$challenge->title}}"--}}
                            {{--                                           placeholder="{{__('title.enter')}} {{__('challenge.title')}}">--}}
                            {{--                                </div>--}}
                            {{--                            </div><!-- Col -->--}}


                            <div class="col-sm-6">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('challenge.price')}}</label>
                                    <select class="form-control" name="price">
                                        @foreach($prices as $price)
                                            <option
                                                value="{{$price->id}}" {{$challenge->price_id == $price->id ? 'selected':''}}>{{$price->price}}</option>
                                        @endforeach

                                    </select>
                                </div>
                            </div><!-- Col -->


                            <div class="col-sm-6">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('challenge.video')}}</label>
                                    <input type="file" accept="video/*" name="video"
                                           class="form-control" id="videoInput" data-id="{{ $challenge->id }}">

                                    {{--                                    <input type="text" name="video_url" class="form-control"--}}
                                    {{--                                           value="{{$challenge->video}}"--}}
                                    {{--                                           placeholder="{{__('title.enter')}} {{__('challenge.video_url')}}">--}}

                                    @if($challenge->video)
                                        <button type="button" id="removeVideoBtn" class="btn btn-danger mt-2">Remove
                                            Video
                                        </button>
                                    @endif
                                </div>
                            </div><!-- Col -->


                            <div class="col-sm-6">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('challenge.createdBy')}}</label>
                                    <select name="createdBy" class="form-control">
                                        @foreach($users as $user)
                                            <option
                                                value="{{$user->id}}" {{$challenge->created_by == $user->id ? 'selected':''}}>{{$user->full_name.'('.$user->nick_name.')'}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div><!-- Col -->


                            <div class="col-sm-6">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('challenge.status')}}</label>
                                    <select name="status" class="form-control">
                                        <option
                                            value="0" {{$challenge->status == 0 ? 'selected':''}}>{{ucfirst(__('options.disapproved'))}}</option>
                                        <option
                                            value="1" {{$challenge->status == 1 ? 'selected':''}}>{{ucfirst(__('options.approved'))}}</option>
                                    </select>
                                </div>
                            </div><!-- Col -->


                            <div class="col-sm-12">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('challenge.description')}}</label>
                                    <textarea name="description"
                                              class="form-control">{{$challenge->description}}</textarea>

                                </div>
                            </div><!-- Col -->


                        </div>

                        <div class="row">


                            <div class="col-md-4 stretch-card grid-margin grid-margin-md-0">
                                <div class="card">
                                    <div class="card-body">
                                        <h6 class="card-title">{{__('challenge.image')}}</h6>
                                        <input type="file"
                                               {{ $challenge->image ? 'data-default-file='.asset($challenge->image):'' }}

                                               accept="image/jpg, image/png, image/jpeg" id="profile_image"
                                               data-id="{{ $challenge->id }}"
                                               name="image" class="myDropify" value="{{$challenge->image}}"/>

                                    </div>
                                </div>
                            </div>


                        </div>

                        <div class="text-end">
                            <a href="{{route('users.index')}}" class="primary-theme-btn createBtn redBtn">
                                {{__('actions.cancel')}}
                            </a>

                            <button type="button" class="primary-theme-btn createBtn">
                                {{__('actions.update')}}
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

            $('.dropify-clear').click(function (e) {
                e.preventDefault();

                // Getting the default value of the clicked input
                var defaultValue = $(this).siblings('input[type="file"]').attr('data-default-file');
                console.log('Default Value:', defaultValue);

                // Getting the value of the clicked input
                var inputValue = $(this).siblings('input[type="file"]').val();
                console.log('Input Value:', inputValue);

                // Getting the ID (data-id) of the clicked input
                var inputId = $(this).siblings('input[type="file"]').attr('data-id');
                console.log('Input ID:', inputId);

                if (inputId) {
                    $.ajax({
                        type: 'POST',
                        url: '{{ route("challenge.removeImage", $challenge->id) }}',
                        data: {
                            _token: '{{ csrf_token() }}',
                            challenge_id: inputId
                        },
                        success: function (response) {
                            if (response.result == 'success') {
                                $.unblockUI();
                                successMsg(response.message);
                            }
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
                }
            });

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
                            window.location.href = "{{route('challenge.index')}}";
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

            $('#removeVideoBtn').click(function (e) {
                e.preventDefault();

                // Getting the ID (data-id) of the video input
                var videoId = $('#videoInput').attr('data-id');
                console.log('Video ID:', videoId);

                if (videoId) {
                    $.ajax({
                        type: 'POST',
                        url: '{{ route("challenge.removeVideo", $challenge->id) }}',
                        data: {
                            _token: '{{ csrf_token() }}',
                            challenge_id: videoId
                        },
                        success: function (response) {
                            if (response.result == 'success') {
                                $.unblockUI();
                                successMsg(response.message);
                                $('#videoInput').val(''); // Clear the input field
                                $('#removeVideoBtn').remove(); // Remove the button
                            }

                        },
                        error: function (xhr, status, error) {
                            $.unblockUI();
                            errorMsg(xhr.responseJSON.message);
                        }
                    });
                }
            });

        });

    </script>

@endsection
