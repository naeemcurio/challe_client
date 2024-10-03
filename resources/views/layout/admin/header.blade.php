<nav class="navbar">
    <a href="#" class="sidebar-toggler">
        <i data-feather="menu"></i>
    </a>
    <div class="navbar-content">

        <ul class="navbar-nav">

            <li class="nav-item dropdown mb-0">
                <a class="nav-link dropdown-toggle languageWrapper" href="#" id="languageDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                    {{ strtoupper(LaravelLocalization::getCurrentLocale()) }}
                </a>
                <div class="dropdown-menu" aria-labelledby="languageDropdown" data-bs-popper="static">
                    @foreach(LaravelLocalization::getLocalesOrder() as $localeCode => $properties)
                        <a hreflang="{{ $localeCode }}" href="{{ LaravelLocalization::getLocalizedURL($localeCode, null, [], true) }}" class="dropdown-item py-2"> <span class="ms-1"> {{ ucfirst($properties['native']) }} </span></a>
                    @endforeach

                </div>
            </li>

            <li class="nav-item dropdown mb-0">
                <a class="nav-link dropdown-toggle" href="#" id="notificationDropdown" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="green" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell">
                        <path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path>
                        <path d="M13.73 21a2 2 0 0 1-3.46 0"></path>
                    </svg>                    <div class="indicator">
                        <div class="circle"></div>
                    </div>
                </a>
                <div class="dropdown-menu p-0" aria-labelledby="notificationDropdown">
                    <div class="px-3 py-2 d-flex align-items-center justify-content-between border-bottom">
                        <p class="notification_count"></p>
{{--                        <a href="javascript:;" class="text-muted">Clear all</a>--}}
                    </div>
                    <div class="p-1 notificationShow">


                    </div>
                    <div class="px-3 py-2 d-flex align-items-center justify-content-center border-top">
                        <a href="{{route('notification.listing')}}">View all</a>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</nav>


<style type="text/css">
    .languageWrapper{
        display: flex;
    background: #3AAA35;
    padding: 0px !important;
    width: 30px;
    height: 30px;
    justify-content: center;
    align-items: center;
    border-radius: 100px;
    padding-left: 0px !important;
    color: #fff !important;
    font-family: 'Quicksand', sans-serif;
    font-weight: 700;
}
</style>
