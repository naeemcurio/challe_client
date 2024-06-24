@extends('layout.admin.index')

@section('title')

    {{env('APP_NAME')}} - {{__('challenge.price').' '.__('actions.edit')}}

@endsection




@section('content')
    <div class="d-flex justify-content-between align-items-center flex-wrap grid-margin">
        <div>
            <h4 class="mb-3 mb-md-0">{{__('challenge.price').' '.__('actions.edit')}}</h4>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 stretch-card">
            <div class="card">
                <div class="card-body">
                    <h6 class="card-title mb-4">{{__('challenge.price').' '.__('title.information')}}</h6>
                    <form id="createForm" action="{{ route('price.update', ['price' => $price]) }}" method="POST">
                        @csrf
                        @method('PUT')
                        <div class="row">

                            <div class="col-sm-6">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('challenge.title')}}</label>
                                    <input type="text" name="title" class="form-control"
                                           value="{{$price->title ? $price->title:''}}"
                                           placeholder="{{__('title.enter')}} {{__('challenge.title')}}">
                                </div>
                            </div><!-- Col -->

                            <div class="col-sm-6">
                                <div class="mb-3 innerDashboard-inputs">
                                    <label class="form-label">{{__('challenge.price')}}</label>
                                    <input type="text" name="price" class="form-control"
                                           onkeypress="return onlyRoundNumber(event)"
                                           value="{{$price->price}}"
                                           placeholder="{{__('title.enter')}} {{__('challenge.price')}}">
                                </div>
                            </div><!-- Col -->


                        </div>



                        <div class="text-end">
                            <a href="{{route('price.index')}}" class="btn btn-outline-danger">
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


    <script>

        $(document).ready(function () {
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
                            window.location.href = "{{route('price.index')}}";
                        }, 1000);
                    },
                    error: function (xhr, status, error) {
                        if (data.status == 422) {
                            $.unblockUI();
                            errorMsg(xhr.responseJSON.message);
                        }
                        else {
                            $.unblockUI();
                            errorMsg(xhr.responseJSON.message);
                        }


                    }
                });


            });

        });

    </script>

@endsection
