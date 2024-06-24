<!DOCTYPE html>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>
        @yield('title')
    </title>


    @include('layout.admin.css')

    @yield('style')


</head>

<body>

<div class="main-wrapper">
    <div class="page-wrapper full-page auth-wrapper">
        <div class="page-content d-flex align-items-center justify-content-center">
            @yield('content')
        </div>
    </div>
</div>


@include('layout.admin.js')
@yield('script')


</body>

</html>
