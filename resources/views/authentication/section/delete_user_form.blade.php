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

    <div>
        <a href="javascript:void(0)"
           class="btn mt-5 text-white common_btn_style loginBtn d-block w-100">
            Delete My Account
        </a>
    </div>


</form>
