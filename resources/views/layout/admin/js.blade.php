<!-- core:js -->
<script src="{{asset('admin/js/core.js')}}"></script>
<!-- endinject -->


<!-- inject:js -->
<script src="{{asset('admin/js/feather.min.js')}}"></script>
<script src="{{asset('admin/js/template.js')}}"></script>
<!-- endinject -->

<!-- Custom js for this page -->
<script src="{{asset('admin/js/dashboard-dark.js')}}"></script>
<!-- End custom js for this page -->

<script src="{{asset('admin/js/jquery.blockUI.js')}}"></script>
<script src="{{asset('admin/js/toastr.min.js')}}"></script>
<script src="{{asset('admin/js/keypress_functions.js')}}"></script>

<script>

    $.blockUI.defaults.baseZ = 2000;

    function successMsg(_msg) {
        window.toastr.success(_msg);
    }

    function errorMsg(_msg) {
        window.toastr.error(_msg);
    }

    function warningMsg(_msg) {
        window.toastr.warning(_msg);
    }

    @foreach ($errors->all() as $error)
    toastr.error("{{$error}}")
    @endforeach

    @if(Session::has('success'))
    successMsg('{{Session::get("success")}}');
    @endif

    @if(Session::has('error'))
    errorMsg("{{Session::get('error')}}");
    @endif

    $(document).ready(function () {
        var activeMenuItem = $('.nav-item.active');


        // Check if there's an active menu item
        if (activeMenuItem.length > 0) {
            console.log('in active');
            // Calculate the scroll position to bring the active menu item into view
            var scrollPosition = activeMenuItem.offset().top - $('.sidebar-body').offset().top - 15;
            // Set the scroll position
            // $('.sidebar-body').scrollTop(scrollPosition);
            // $('.sidebar-body').scrollTo({top:scrollPosition,behavior:"smooth"});
            $('.sidebar-body').animate({
                scrollTop: scrollPosition
            }, 800);
        }


        function getNotification() {
            console.log('in here');
            // $.blockUI({
            //     css: {
            //         border: 'none',
            //         padding: '15px',
            //         backgroundColor: '#000',
            //         '-webkit-border-radius': '10px',
            //         '-moz-border-radius': '10px',
            //         opacity: .5,
            //         color: '#fff'
            //     }
            // });
            $.ajax({
                type: 'GET',
                url: '{{route('notification.index')}}',

                success: function (response, status) {

                    if (response.result == 'success') {
                        // $.unblockUI();
                        // successMsg(response.message);

                        var html = '';

                        $.each(response.data,function(index,value){
                            if(value.type == 'challenge_record_submit')
                            {
                                html += '<a href="javascript:;" class="dropdown-item d-flex align-items-center py-2">'
                            }
                            else{
                                html += '<a href="{{route('withdraw.index')}}" class="dropdown-item d-flex align-items-center py-2">'
                            }
                            html += '<div class="wd-30 ht-30 d-flex align-items-center justify-content-center bg-primary rounded-circle me-3">';
                            if(value.type == 'challenge_record_submit')
                            {
                                html += '<img src="{{asset('/admin/img/ongoing.svg')}}" class="img-fluid side-bar-icons" alt="" style="width: 24px; height: 24px;">';
                            }
                            else{
                                html += '<img src="{{asset('admin/img/pricel.svg')}}" class="img-fluid side-bar-icons" alt="" style="width: 24px; height: 24px;">';
                            }
                            html += '</div>';
                            html += '<div class="flex-grow-1 me-2">';
                            html += '<p>'+value.message+'</p>';
                            // html += '<p class="tx-12 text-muted"></p>';
                            html += '</div>';
                            html += '</a>';
                        });

                        $('.notificationShow').html(html);
                        $('.notification_count').text(response.data.length+' {{__('users.notification')}}')

                    } else if (response.result == 'error') {
                        // $.unblockUI();
                        errorMsg(response.message);
                    }
                },
                error: function (data, status) {
                    if (data.status == 404) {
                        // errorMsg(data.responseJSON.message);
                    } else {
                        // $.unblockUI();
                        errorMsg(data.responseJSON.message);
                    }


                },


            });
        }

        // const delay = 30000; //30 seconds
        window.onload = function() {
            // console.log('start');

            getNotification();
            // setTimeout(getNotification, delay);
        };
    });

    if ($('.notificationShow').length) {
        const sidebarBodyScroll = new PerfectScrollbar('.notificationShow');
    }
</script>
