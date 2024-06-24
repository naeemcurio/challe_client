@extends('layout.admin.auth')

@section('title')
    {{env('APP_NAME')}} -  Delete User
@endsection


@section('content')
    <div class="row justify-content-center w-100 mx-0 auth-page">
        <div class="col-md-4 ">
            <div class="">
                <div class="row justify-content-center">
                    <div class="col-md-12 ps-md-0">
                        <div class="auth-form-wrapper px-5 py-5">
                            <a href="{{route('adminLogin')}}" class="noble-ui-logo logo-light d-block mb-2">
                                <img src="{{asset('admin/img/logos/white.png')}}" class="img-fluid"/>
                            </a>
{{--                            <h5 class="text-white mb-5 text-center">Welcome back! Log in to your account.</h5>--}}
                            @include('authentication.section.delete_user_form')
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

            $("#passwordLogin").keydown(function (e) {
                if (e.keyCode == 13) {
                    $('.loginBtn').click();
                }
            });

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
                    url: '{{route("deleteUser")}}',
                    data: data,
                    success: function (response, status) {
                        if (response.result == 'success') {
                            $.unblockUI();
                            successMsg(response.message);
                            setTimeout(function () {
                                window.location.reload();
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
