@extends('layout.admin.index')

@section('title')

    {{env('APP_NAME')}} - {{__('title.challenge').' '.__('actions.create')}}

@endsection

@section('style')
    <link rel="stylesheet" href="{{asset('admin/css/select2(4.0.3).min.css')}}">

    <link rel="stylesheet" href="{{asset('admin/css/jquery-ui.css')}}">

    <style>
        .ui-state-active, .ui-widget-content .ui-state-active, .ui-widget-header .ui-state-active, a.ui-button:active, .ui-button:active, .ui-button.ui-state-active:hover {
            background: #007fff !important;
        }
        .select2-container .select2-selection--single{
            height: 45px !important;
        }
        .select2-container--default .select2-selection--single .select2-selection__rendered{
            line-height: 45px !important;
        }
        .select2-container--default .select2-selection--single .select2-selection__arrow{
            height: 45px !important;
        }
        .select2-container--default .select2-selection--single{
            background-color: transparent;
            border: 1px solid rgba(68, 68, 68, 1) !important;
            border-radius: 10px !important;
        }
        .select2-container--default .select2-selection--single .select2-selection__rendered{
            color: #fff !important;
            font-family: 'Quicksand', sans-serif;
            font-size: 16px !important;
            font-weight: 600 !important;
        }
        .select2-dropdown{
            background-color: #0c1427 !important;
        }
        .select2-results__option[aria-selected]{
            color: #fff !important;
        }
    </style>
@endsection


@section('content')
    <div class="d-flex justify-content-between align-items-center flex-wrap grid-margin">
        <div>
            <h4 class="mb-3 mb-md-0 title-dashboard">{{__('title.challenge').' '.__('actions.create')}}</h4>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 stretch-card">
            <div class="card">
                <div class="card-body">
                    <h6 class="card-title mb-4">{{__('title.challenge').' '.__('title.information')}} </h6>
                    <form id="createForm">
                        @csrf
                        <div class="row">
                            {{--                            <div class="col-sm-6">--}}
                            {{--                                <div class="mb-3 innerDashboard-inputs">--}}
                            {{--                                    <label class="form-label">{{__('challenge.title')}}</label>--}}
                            {{--                                    <input type="text" name="title" class="form-control"--}}
                            {{--                                           placeholder="{{__('title.enter')}} {{__('challenge.title')}}">--}}
                            {{--                                </div>--}}
                            {{--                            </div><!-- Col -->--}}


                            <div class="col-sm-6">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('challenge.price')}}</label>
                                    <select class="form-select" name="price">
                                        <option value="" selected disabled>Select</option>
                                        @foreach($prices as $price)
                                            <option value="{{$price->id}}">{{$price->price}}</option>
                                        @endforeach

                                    </select>
                                </div>
                            </div><!-- Col -->


                            <div class="col-sm-6">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('challenge.video')}}</label>
                                    <input type="file" accept="video/*" name="video" class="form-control"
                                           id="videoInput">

                                    {{--                                    <input type="text" name="video_url" class="form-control"--}}
                                    {{--                                           onkeypress="return isNumberKey(event)"--}}
                                    {{--                                           placeholder="{{__('title.enter')}} {{__('challenge.video')}}">--}}
                                </div>
                            </div><!-- Col -->


                            <div class="col-sm-6">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('challenge.createdBy')}}</label>
                                    <select name="createdBy" data-width="100%"
                                            class="js-example-basic-single form-select select2-hidden-accessible createdBy">
                                        <option value="" selected disabled>{{ucfirst(__('options.select'))}}</option>
                                        {{--                                        @foreach($users as $user)--}}
                                        {{--                                            <option value="{{$user->id}}">{{$user->full_name.'('.$user->nick_name.')'}}</option>--}}
                                        {{--                                        @endforeach--}}
                                    </select>
                                </div>
                            </div><!-- Col -->




                            <div class="col-sm-6">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('challenge.status')}}</label>
                                    <select name="status" class="form-select">
                                        <option value="0" selected>{{ucfirst(__('options.disapproved'))}}</option>
                                        <option value="1">{{ucfirst(__('options.approved'))}}</option>
                                    </select>
                                </div>
                            </div><!-- Col -->


                            <div class="col-sm-12">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('challenge.description')}}</label>
                                    <textarea name="description" class="form-control"></textarea>

                                </div>
                            </div><!-- Col -->


                        </div>

                        <div class="row">


                            <div class="col-md-4 stretch-card grid-margin grid-margin-md-0">
                                <div class="card">
                                    <div class="card-body">
                                        <h6 class="card-title">{{__('challenge.image')}}</h6>
                                        <input type="file"
                                               accept="image/jpg, image/png, image/jpeg" id="profile_image"
                                               name="image" class="myDropify"/>

                                    </div>
                                </div>
                            </div>


                        </div>

                        <div class="text-end">
                            <a href="{{route('challenge.index')}}" class="primary-theme-btn createBtn redBtn">
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

    <script src="{{asset('admin/js/select2(4.0.3).full.js')}}"></script>

    <script src="https://cdn.jsdelivr.net/npm/resumablejs@1.1.0/resumable.min.js"></script>

    <script>

        $(document).ready(function () {
            $('.dob').datepicker();

            {{--$('.createBtn').click(function () {--}}
            {{--    var formData = new FormData($('#createForm')[0]);--}}
            {{--    uploadVideoChunks(formData);--}}
            {{--});--}}

            {{--function uploadVideoChunks(formData) {--}}
            {{--    var file = $('#videoInput')[0].files[0];--}}
            {{--    var chunkSize = 1024 * 1024; // 1 MB chunk size--}}
            {{--    var totalChunks = Math.ceil(file.size / chunkSize);--}}
            {{--    var start = 0;--}}
            {{--    var chunkIndex = 0;--}}
            {{--    var videoName = 'your_video_name'; // Provide a name for your video--}}


            {{--    function readNextChunk() {--}}
            {{--        var blob = file.slice(start, start + chunkSize);--}}
            {{--        formData.append('chunk', blob, videoName + '_' + chunkIndex + '.part');--}}
            {{--        formData.append('total_chunks', totalChunks);--}}
            {{--        formData.append('video_name', videoName);--}}
            {{--        formData.append('chunk_index', chunkIndex);--}}
            {{--        $.ajax({--}}
            {{--            url: '{{ route("challenge.store") }}',--}}
            {{--            type: 'POST',--}}
            {{--            data: formData,--}}
            {{--            dataType: 'json',--}}
            {{--            cache: false,--}}
            {{--            contentType: false,--}}
            {{--            processData: false,--}}
            {{--            success: function (response) {--}}
            {{--                // Handle success--}}
            {{--            },--}}
            {{--            error: function (xhr, status, error) {--}}
            {{--                // Handle error--}}
            {{--            }--}}
            {{--        });--}}

            {{--        start += chunkSize;--}}
            {{--        chunkIndex++;--}}

            {{--        if (start < file.size) {--}}
            {{--            setTimeout(readNextChunk, 1000); // Delay between chunks (adjust as needed)--}}
            {{--        } else {--}}
            {{--            // All chunks sent, perform final upload--}}

            {{--        }--}}
            {{--    }--}}

            {{--    readNextChunk();--}}
            {{--}--}}

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
                    url: '{{route("challenge.store")}}',
                    data: data,
                    cache: false,
                    contentType: false,
                    processData: false,

                    success: function (response, status) {
                        if (response.result == 'success') {
                            $.unblockUI();
                            successMsg(response.message);


                            setTimeout(function () {
                                window.location.href = "{{route('challenge.index')}}";
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


            $('.createdBy').select2({
                placeholder: "{{ucfirst(__('options.select'))}}",
                minimumInputLength: 2, // Search after typing 2 characters
                language: {
                    inputTooShort: function () {
                        return "{{__('datatable.more_character')}}";
                    }
                },
                ajax: {
                    url: "{{ route('users.search') }}", // Define route to fetch data
                    dataType: 'json',
                    delay: 250,
                    data: function (params) {
                        return {
                            search: params.term // Send search term
                        };
                    },
                    processResults: function (data) {
                        return {
                            results: $.map(data.data, function (user) {
                                return {
                                    id: user.id,
                                    text: user.full_name + ' (' + user.nick_name + ')'
                                }
                            })
                        };
                    },
                    cache: true
                }
            });

        });

    </script>
@endsection
