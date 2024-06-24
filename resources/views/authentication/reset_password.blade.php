@extends('layout.admin.auth')

@section('title')
    {{env('APP_NAME')}} -  Reset Password

@endsection


@section('content')
    <div class="row w-100 mx-0 auth-page justify-content-center auth-page">
        <div class="col-md-4">
            <div class="">
                <div class="row justify-content-center">
                    <!-- <div class="col-md-4 pe-md-0">
                        <div class="auth-side-wrapper">

                        </div>
                    </div> -->
                    <div class="col-md-12 ps-md-0">
                        <div class="auth-form-wrapper px-5 py-5">
                        <a href="{{route('home')}}" class="noble-ui-logo logo-light d-block mb-2"><img src="{{asset('web/images/headerLogo.png')}}" class="img-fluid"/></a>
                            <h5 class="text-white mb-5 text-center">Welcome! Reset Password.</h5>
                            @include('authentication.section.reset_password')
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('script')

    <script>
        $(document).ready(function () {

            $('.loginBtn').click(function (e) {
                var data = $('#loginForm').serialize();
                $.blockUI({
                    css: {
                        border: 'none',
                        padding: '15px',
                        backgroundColor: '#000',
                        '-webkit-border-radius': '10px',
                        '-moz-border-radius': '10px',
                        opacity: .5,
                        color: '#fff !important'
                    }
                });
                $.ajax({
                    type: 'POST',
                    url: '{{route("changePassword")}}',
                    data: data,
                    success: function (response, status) {
                        if (response.result == 'success') {
                            $.unblockUI();
                            successMsg(response.message);

                            setTimeout(function () {
                                window.location.href = "{{route('adminLogin')}}";
                            }, 1000);

                        }
                        else if (response.result == 'error') {
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
