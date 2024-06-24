<form id="loginForm">
    @csrf

    <div class="mb-3">
        <label for="userEmail" class="form-label">Name</label>
        <input type="text" name="name" class="form-control" placeholder="Name">
    </div>

    <div class="mb-3">
        <label for="userEmail" class="form-label">Email address</label>
        <input type="email" name="email" class="form-control" id="userEmail" placeholder="Email">
    </div>
    <div class="mb-3">
        <label for="userPassword" class="form-label">Password</label>
        <input type="password" class="form-control" id="userPassword" name="password"
               autocomplete="current-password" placeholder="Password">
    </div>
{{--    <div class="form-check mb-3">--}}
{{--        <input name="remember_me" type="checkbox" class="form-check-input" id="authCheck">--}}
{{--        <label class="form-check-label" for="authCheck">--}}
{{--            Remember me--}}
{{--        </label>--}}
{{--    </div>--}}
    <div class="text-center">
        <a href="javascript:void(0)"
           class="btn mt-4 mb-md-0 text-white common_btn_style loginBtn w-100 d-block">Register</a>
        <!-- <button type="button"
                class="btn mb-2 mb-md-0 common_Outlinebtn_style">
            <i class="btn-icon-prepend" data-feather="twitter"></i>
            Login with twitter
        </button> -->
    </div>
    <div class="text-center">
    <a href="{{route('adminLogin')}}" class="d-inline-block mt-3 common_red_txt">Already a user? Sign in</a>
        <div>
    
</form>
