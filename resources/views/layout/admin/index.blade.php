<!DOCTYPE html>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <!-- Favicon Icon -->
    <title>
        @yield('title')
    </title>


    @include('layout.admin.css')

    @yield('style')


</head>

<body>

<div class="main-wrapper">
    @include('layout.admin.sidebar')

    <div class="page-wrapper">
        @include('layout.admin.header')

        <div class="page-content">
            @yield('content')
        </div>

        <!-- @include('layout.admin.footer') -->
    </div>
</div>
@include('layout.admin.js')
@yield('script')


</body>
