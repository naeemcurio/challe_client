<script src="{{asset('admin/js/jquery.dataTables.js')}}"></script>
<script src="{{asset('admin/js/dataTables.bootstrap5.js')}}"></script>

<script>
    @if(strtoupper(LaravelLocalization::getCurrentLocale()) == 'KA')
    $('#dataTableExample').DataTable({
        "language": {

            "url": "../admin/ka.json"

        }

    });
    @else
    $('#dataTableExample').DataTable({
        "language": {

            "url": "../admin/en.json"

        }

    });
    @endif

</script>
