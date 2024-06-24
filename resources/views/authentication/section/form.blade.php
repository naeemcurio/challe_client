<form id="loginForm">
    @csrf
    <div class="mb-3 auth-input-wrapper">
        <label for="userEmail" class="form-label">Email address</label>
        <input type="email" name="email" class="form-control" id="userEmail" placeholder="Email" autocomplete="off">
    </div>
    <div class="mb-3 auth-input-wrapper">
        <label for="userPassword" class="form-label">Password</label>
        <input type="password" class="form-control" id="passwordLogin" name="password"
               autocomplete="off" placeholder="Password">
    </div>
    <div class="form-check mb-3 d-flex login-sec-btn d-flex justify-content-between align-items-center">
        <div>
        <input name="remember_me" type="checkbox" class="form-check-input" id="authCheck">
        <label class="form-check-label" for="authCheck">
            Remember me
        </label>
        </div>
{{--            <div>--}}
{{--                <a href="{{route('forgotPassword')}}" class="d-block mt-0 common_red_txt">Forgot Password ?</a>--}}
{{--           </div>--}}

    </div>
    <div>
        <a href="javascript:void(0)"
           class="btn mt-5 text-white common_btn_style loginBtn d-block w-100">Login</a>
        <!-- <button type="button"
                class="btn mb-2 mb-md-0 common_Outlinebtn_style">
            <i class="btn-icon-prepend" data-feather="twitter"></i>
            Login with twitter
        </button> -->
    </div>
{{--    <div class="text-center">--}}
{{--    <a href="{{route('registerForm')}}" class="d-inline-block text-center mx-auto mt-3 ms-1 common_red_txt">Not a user? Sign up</a>--}}
{{--    </div>--}}




</form>
