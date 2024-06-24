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