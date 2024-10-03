<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<!-- End fonts -->

<!-- core:css -->
<link rel="stylesheet" href="{{asset('admin/css/core.css')}}">
<!-- endinject -->

<!-- inject:css -->
<link rel="stylesheet" href="{{asset('admin/css/feather-font/css/iconfont.css')}}">
<!-- endinject -->

@if(Request()->route()->getName() == 'users.create' ||
Request()->route()->getName() == 'users.edit' || Request()->route()->getName() == 'challenge.create'
 || Request()->route()->getName() == 'challenge.edit' )
    <link rel="stylesheet" href="{{asset('admin/css/dropify.min.css')}}">
@endif

<!-- Layout styles -->
<link rel="stylesheet" href="{{asset('admin/css/style.css')}}">
<link rel="stylesheet" href="{{asset('admin/css/NewStyle.css')}}">
<!-- End layout styles -->

{{--<link rel="shortcut icon" href="{{asset('admin/img/favicon.png')}}" />--}}
<link rel="shortcut icon" href="{{asset('admin/img/logos/favicon_io/apple-touch-icon.png')}}">

<link rel="stylesheet" href="{{asset('admin/css/toastr.css')}}">

<style>
    .blockUI.blockMsg.blockPage h1{
        color: #ffffff !important;
    }



</style>




