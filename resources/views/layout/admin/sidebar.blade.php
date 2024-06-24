<!-- partial:partials/_sidebar.html -->
<nav class="sidebar">
    <div class="sidebar-header">
        <a href="{{route('adminLogin')}}" class="sidebar-brand">
            <img src="{{asset('admin/img/logos/longwhite.png')}}" class="img-fluid" alt="">
        </a>
        <div class="sidebar-toggler not-active">
            <span></span>
            <span></span>
            <span></span>
        </div>
    </div>
    <div class="sidebar-body">
        <ul class="nav">
            <li class="nav-item {{Request()->route()->getName() == 'adminDashboard' ? 'active':''}}">
                <a href="{{route('adminDashboard')}}" class="nav-link">
                    <img src="{{asset('admin/img/dashboard.svg')}}" class="img-fluid side-bar-icons" alt="">
                    <span class="link-title">{{__('admin_sidebar.dashboard')}}</span>
                </a>
            </li>
            <li class="nav-item {{Str::is('users.*',Request()->route()->getName() ) ? 'active':''}}">
                <a href="{{route('users.index')}}" class="nav-link">
                    <img src="{{asset('admin/img/users.svg')}}" class="img-fluid side-bar-icons" alt="" style="width: 24px; height: 24px;">
                    <span class="link-title">{{__('admin_sidebar.user')}}</span>
                </a>
            </li>

            <li class="nav-item {{Str::is('challenge.*',Request()->route()->getName() ) ? 'active':''}}">
                <a href="{{route('challenge.index')}}" class="nav-link">
                    <img src="{{asset('admin/img/puzzle.svg')}}" class="img-fluid side-bar-icons" alt="">
                    <span class="link-title">{{__('title.challenge')}}</span>
                </a>
            </li>

            <li class="nav-item {{Str::is('on-going-challenge.*',Request()->route()->getName() ) ? 'active':''}}">
                <a href="{{route('on-going-challenge.index')}}" class="nav-link">
                    <img src="{{asset('admin/img/ongoing.svg')}}" class="img-fluid side-bar-icons" alt=""  style="width: 24px; height: 24px;">
                    <span class="link-title">{{__('title.on_going_challenge')}}</span>
                </a>
            </li>

            <li class="nav-item {{Str::is('leaderBoard.*',Request()->route()->getName() ) ? 'active':''}}">
                <a href="{{route('leaderBoard.index')}}" class="nav-link">
                    <img src="{{asset('admin/img/challenge.svg')}}" class="img-fluid side-bar-icons" alt="" style="width: 24px; height: 24px;">
                    <span class="link-title">{{__('title.leaderboard')}}</span>
                </a>
            </li>


            <li class="nav-item {{Str::is('setting.*',Request()->route()->getName() ) ? 'active':''}}">
                <a href="{{route('setting.create')}}" class="nav-link">
                    <img src="{{asset('admin/img/setting.svg')}}" class="img-fluid side-bar-icons" alt="">
                    <span class="link-title">{{__('title.setting')}}</span>
                </a>
            </li>

            <li class="nav-item {{Str::is('price.*',Request()->route()->getName() ) ? 'active':''}}">
                <a href="{{route('price.index')}}" class="nav-link">
                    <img src="{{asset('admin/img/pricel.svg')}}" class="img-fluid side-bar-icons" alt="" style="width: 24px; height: 24px;">
                    <span class="link-title">{{__('challenge.price')}}</span>
                </a>
            </li>


            <li class="nav-item {{Str::is('withdraw.*',Request()->route()->getName() ) ? 'active':''}}">
                <a href="{{route('withdraw.index')}}" class="nav-link">
                    <img src="{{asset('admin/img/pricel.svg')}}" class="img-fluid side-bar-icons" alt="" style="width: 24px; height: 24px;">
                    <span class="link-title">{{__('title.withdraw')}}</span>
                </a>
            </li>



            {{--            <li class="nav-item {{Str::is('image.*',Request()->route()->getName() ) ? 'active':''}}">--}}
{{--                <a href="{{route('image.listing')}}" class="nav-link">--}}
{{--                    <img src="{{asset('admin/img/banner.svg')}}" class="img-fluid side-bar-icons" alt="">--}}
{{--                    <span class="link-title">Images</span>--}}
{{--                </a>--}}
{{--            </li>--}}


            <li class="nav-item mb-0 mt-auto">
                <a href="{{route('logoutUser')}}" class="nav-link">
                    <img src="{{asset('admin/img/logout.svg')}}" class="img-fluid side-bar-icons" alt="">
                    <span class="link-title">{{__('admin_sidebar.logout')}}</span>
                </a>
            </li>





        </ul>
    </div>
</nav>
<!-- partial -->
