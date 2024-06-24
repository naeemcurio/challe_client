@extends('layout.admin.index')

@section('title')

    {{env('APP_NAME')}} - {{__('title.setting').' '.__('actions.create')}}

@endsection


@section('content')
    <div class="d-flex justify-content-between align-items-center flex-wrap grid-margin">
        <div>
            <h4 class="mb-3 mb-md-0 title-dashboard">{{__('title.setting').' '.__('actions.create')}}</h4>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 stretch-card">
            <div class="card">
                <div class="card-body">
                    <h6 class="card-title mb-4">{{__('title.setting').' '.__('title.information')}} </h6>
                    <form id="createForm" action="{{ route('setting.store', [ 'setting' => isset($data) ? $data:'']) }}" method="POST">
                        @csrf
                        @if(isset($data))
                            @method('PUT')
                        @endif
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('setting.company_commission')}} %</label>
                                    <input type="text" name="company_commission" class="form-control"
                                           onkeypress="return isNumberKey(event)"
                                           value="{{isset($data) ? $data->company_commission:''}}"
                                           placeholder="{{__('title.enter')}} {{__('setting.company_commission')}} {{__('setting.in_percentage')}}">
                                </div>
                            </div><!-- Col -->


                            <div class="col-sm-4">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('setting.challenge_creator_commission')}} %</label>
                                    <input type="text" name="challenge_creator_commission" class="form-control"
                                           onkeypress="return isNumberKey(event)"
                                           value="{{isset($data) ? $data->challenge_creator_commission:''}}"
                                           placeholder="{{__('title.enter')}} {{__('setting.challenge_creator_commission')}} {{__('setting.in_percentage')}}">
                                </div>
                            </div><!-- Col -->


                            <div class="col-sm-4">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{ucfirst(__('setting.waiting_time')) .' ('.__('setting.in_seconds').')'}}</label>
                                    <input type="text" name="waiting_time" class="form-control"
                                           onkeypress="return onlyRoundNumber(event)"
                                           value="{{isset($data) ? $data->waiting_time:''}}"
                                           placeholder="{{__('title.enter')}} {{ucfirst(__('setting.waiting_time')) .' ( '. __('setting.in_seconds').')'}}"
                                    >
                                </div>
                            </div><!-- Col -->



                        </div>

                        <div class="text-end">
                            <a href="{{route('setting.create')}}" class="btn btn-outline-danger">
                                {{__('actions.cancel')}}
                            </a>

                            <button type="button" class="primary-theme-btn createBtn">
                                {{__('actions.save')}}
                            </button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>

@endsection


@section('script')
    <script>

        $(document).ready(function () {

            $('.createBtn').click(function () {
                var data = $('#createForm').serialize();
                // var data = new FormData($('#createForm')[0]);
                var url = $('#createForm').attr('action');

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


                    success: function (response, status) {

                        $.unblockUI();
                        successMsg("{{__('response_message.record_save')}}");

                        setTimeout(function () {
                            window.location.href = "{{route('setting.create')}}";
                        }, 1000);

                    },
                    error: function (data, status) {
                        $.unblockUI();

                        if (data.status == 422) {
                            errorMsg(data.responseJSON.message);
                        } else {
                            errorMsg(data.responseJSON.message);
                        }


                    }
                });


            });

        });

    </script>
@endsection


