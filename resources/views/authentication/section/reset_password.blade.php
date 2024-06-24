<form id="loginForm">
    @csrf



    <div class="mb-3">
        <label for="userEmail" class="form-label">Email address</label>
        <input type="email" name="email" class="form-control" id="userEmail"
               value="{{$data->email}}"
               readonly placeholder="Email">
    </div>

    <div class="mb-3">
        <label for="newPassword" class="form-label">New Password</label>
        <input type="password" name="password" class="form-control" id="newPassword" placeholder="New Password">
    </div>


    <div class="mb-3">
        <label for="confirmPassword" class="form-label">Confirm Password</label>
        <input id="confirmPassword" type="password" name="password_confirmation" class="form-control" placeholder="Confirm Password">
    </div>


    <div>
        <a href="javascript:void(0)"
           class="btn mt-5 mb-md-0 text-white common_btn_style loginBtn w-100 d-block">Reset Password</a>
        <!-- <button type="button"
                class="btn mb-2 mb-md-0 common_Outlinebtn_style">
            <i class="btn-icon-prepend" data-feather="twitter"></i>
            Login with twitter
        </button> -->
    </div>
</form>
