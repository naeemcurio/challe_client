<form id="loginForm">
    @csrf



    <div class="mb-3">
        <label for="userEmail" class="form-label">Email address</label>
        <input type="email" name="email" class="form-control" id="userEmail" placeholder="Email">
    </div>

    <div>
        <a href="javascript:void(0)"
           class="btn mt-5 mb-md-0 text-white common_btn_style loginBtn w-100 d-block">Forgot Password</a>
        <!-- <button type="button"
                class="btn mb-2 mb-md-0 common_Outlinebtn_style">
            <i class="btn-icon-prepend" data-feather="twitter"></i>
            Login with twitter
        </button> -->
    </div>
</form>

<style>
.common_btn_style{
    font-size: 16px !important;
}

</style>
