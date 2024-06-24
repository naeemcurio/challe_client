$(function() {
    'use strict';

    /* date between */
    let minDate, maxDate;

    // Custom filtering function
    DataTable.ext.search.push(function(settings, data, dataIndex) {
        let min = minDate.val();
        let max = maxDate.val();
        let date = new Date(data[5]);

        return (
            (min === null && max === null) ||
            (min === null && date <= max) ||
            (min <= date && max === null) ||
            (min <= date && date <= max)
        );
    });

    // Create date inputs
    minDate = new DateTime('#min', {
        format: 'MMMM Do YYYY'
    });

    maxDate = new DateTime('#max', {
        format: 'MMMM Do YYYY'
    });
    /* date between */

    var table = $('#dataTableExample').DataTable({
        dom: 'Bfrtip',
        buttons: ['copy', 'csv', 'excel', 'pdf', 'print'],
        processing: true,
        serverSide: true,
        lengthMenu: [[10, 30, 50, -1], [10, 30, 50, 'All']],
        iDisplayLength: 10,
        language: {
            search: ''
        },
        orderCellsTop: true,
        ajax: {
            url: "/admin/ajax-sale-report",
            method: 'GET',
            data: function (d) {
                // Include min and max date values in the request
                d.min = minDate.val();
                d.max = maxDate.val();
            },
            dataSrc: 'data', // Assuming your server response has a 'data' property
        },
        columns: [
            { data: 'title' },
            { data: 'customer' },
            { data: 'vendor' },
            { data: 'payment_gateway' },
            { data: 'earning' },
            { data: 'date' },
            { data: 'commission' }
        ],
    });

    // Customizing DataTable appearance
    $('#dataTableExample').each(function() {
        var datatable = $(this);
        var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
        search_input.attr('placeholder', 'Search');
        search_input.removeClass('form-control-sm');

        var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
        length_sel.removeClass('form-control-sm');
    });

    // Event listener for date changes
    document.querySelectorAll('#min, #max').forEach((el) => {
        el.addEventListener('change', () => table.draw());
    });
});





/*$(function() {
    'use strict';

    $(function() {

        /!* date between*!/
        let minDate, maxDate;
        // Custom filtering function which will search data in column four between two values
        DataTable.ext.search.push(function (settings, data, dataIndex) {
            let min = minDate.val();
            let max = maxDate.val();
            let date = new Date(data[5]);
            if (
                (min === null && max === null) ||
                (min === null && date <= max) ||
                (min <= date && max === null) ||
                (min <= date && date <= max)
            ) {
                return true;
            }
            return false;
        });
        // Create date inputs
        minDate = new DateTime('#min', {
            format: 'MMMM Do YYYY'
        });
        maxDate = new DateTime('#max', {
            format: 'MMMM Do YYYY'
        });
        /!* date between*!/

        var table = $('#dataTableExample').DataTable({
            dom: 'Bfrtip',
            buttons: [
                'copy', 'csv', 'excel', 'pdf', 'print'
            ],
            processing: true,
            serverSide: true,
            "aLengthMenu": [
                [10, 30, 50, -1],
                [10, 30, 50, "All"]
            ],
            "iDisplayLength": 10,
            "language": {
                search: ""
            },
            orderCellsTop: true,
            // ajax: "/admin/ajax-sale-report",
            ajax: {
                url: "/admin/ajax-sale-report",
                method: 'GET',
                dataSrc: {'min':minDate,'max':maxDate},
            },
            columns: [
                { data: 'title' },
                { data: 'customer' },
                { data: 'vendor' },
                { data: 'payment_gateway' },
                { data: 'earning' },
                { data: 'date' },
                { data: 'commission' }
            ],
            /!*initComplete: function() {
                var table = this.api();
                // Add filtering
                table.columns().every(function() {
                    var column = this;
                    var input = $('<input type="text" />')
                        .appendTo($("thead tr:eq(1) td").eq(this.index()))
                        .on("keyup", function() {
                            column.search($(this).val()).draw();
                        });
                    var select = $('<select><option value=""></option></select>')
                        .appendTo($("thead tr:eq(2) td").eq(this.index()))
                        .on('change', function() {
                            var val = $.fn.dataTable.util.escapeRegex(
                                $(this).val()
                            );
                            column
                                .search(val ? '^' + val + '$' : '', true, false)
                                .draw();
                        });
                    column.data().unique().sort().each(function(d, j) {
                        select.append('<option value="' + d + '">' + d + '</option>')
                    });
                });
            }*!/
        });
        $('#dataTableExample').each(function() {
            var datatable = $(this);
            // SEARCH - Add the placeholder for Search and Turn this into in-line form control
            var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
            search_input.attr('placeholder', 'Search');
            search_input.removeClass('form-control-sm');
            // LENGTH - Inline-Form control
            var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
            length_sel.removeClass('form-control-sm');
        });

        /!*date between*!/
        // Refilter the table
        document.querySelectorAll('#min, #max').forEach((el) => {
            el.addEventListener('change', () => table.draw());
        });
        /!*date between*!/


    });

});*/




/*$(function() {
    'use strict';
    $(function() {
        let minDate, maxDate;

        // Function to add date range filtering
        DataTable.ext.search.push(function (settings, data, dataIndex) {
            let min = (minDate && minDate.val)?minDate.val():null;
            let max = (maxDate && maxDate.val)?maxDate.val():null;
            let date = new Date(data[5]);
            if (
                (min === null && max === null) ||
                (min === null && date <= max) ||
                (min <= date && max === null) ||
                (min <= date && date <= max)
            ) {
                return true;
            }
            return false;
        });

        // Create DataTable with AJAX
        var table = $('#dataTableExample').DataTable({
            dom: 'Bfrtip',
            buttons: ['copy', 'csv', 'excel', 'pdf', 'print'],
            processing: true,
            serverSide: true,
            "aLengthMenu": [
                [10, 30, 50, -1],
                [10, 30, 50, "All"]
            ],
            "iDisplayLength": 10,
            "language": {
                search: ""
            },
            orderCellsTop: true,
            // ajax: "/admin/ajax-sale-report",
            ajax: {
                url: '/admin/ajax-sale-report',
                method: 'GET',
                dataSrc: 'data'
            },
            columns: [
                { data: 'title' },
                { data: 'customer' },
                { data: 'vendor' },
                { data: 'payment_gateway' },
                { data: 'earning' },
                { data: 'date' },
                { data: 'commission' }
            ],
            initComplete: function () {
                var table = this.api();
                table.columns().every(function () {
                    var column = this;
                    var input = $('<input type="text" />')
                        .appendTo($("thead tr:eq(1) td").eq(this.index()))
                        .on("keyup", function () {
                            column.search($(this).val()).draw();
                        });
                    var select = $('<select><option value=""></option></select>')
                        .appendTo($("thead tr:eq(2) td").eq(this.index()))
                        .on('change', function () {
                            var val = $.fn.dataTable.util.escapeRegex(
                                $(this).val()
                            );
                            column
                                .search(val ? '^' + val + '$' : '', true, false)
                                .draw();
                        });
                    column.data().unique().sort().each(function (d, j) {
                        select.append('<option value="' + d + '">' + d + '</option>')
                    });
                });
            }
        });


        document.querySelectorAll('#min, #max').forEach((el) => {
            el.addEventListener('change', () => table.draw());
        });

        $('#dataTableExample').each(function () {
            var datatable = $(this);
            var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
            search_input.attr('placeholder', 'Search');
            search_input.removeClass('form-control-sm');
            var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
            length_sel.removeClass('form-control-sm');
        });
    });
});*/




/*$(function () {
    'use strict';
    let minDate, maxDate;

    DataTable.ext.search.push(function (settings, data, dataIndex) {
        let min = minDate.val();
        let max = maxDate.val();
        let date = new Date(data[5]); // Adjusted index for the 'date' column

        if (
            (min === null && max === null) ||
            (min === null && date <= max) ||
            (min <= date && max === null) ||
            (min <= date && date <= max)
        ) {
            return true;
        }

        return false;
    });

    minDate = new DateTime('#min', {
        format: 'MMMM Do YYYY'
    });

    maxDate = new DateTime('#max', {
        format: 'MMMM Do YYYY'
    });

    var table = $('#dataTableExample').DataTable({
        dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ],
        ajax: {
            url: "/ajax-sale-report",
            dataSrc: ''
        },
        columns: [
            { data: 'product' },
            { data: 'customer' },
            { data: 'vendor' },
            { data: 'payment_gateway' },
            { data: 'earning' },
            { data: 'date' },
            { data: 'commission' }
        ],
        lengthMenu: [
            [10, 30, 50, -1],
            [10, 30, 50, "All"]
        ],
        pageLength: 10,
        language: {
            search: ""
        },
        orderCellsTop: true,
        initComplete: function () {
            var table = this.api();
            table.columns().every(function () {
                var column = this;
                var input = $('<input type="text" />')
                    .appendTo($("thead tr:eq(1) td").eq(this.index()))
                    .on("keyup", function () {
                        column.search($(this).val()).draw();
                    });
                var select = $('<select><option value=""></option></select>')
                    .appendTo($("thead tr:eq(2) td").eq(this.index()))
                    .on('change', function () {
                        var val = $.fn.dataTable.util.escapeRegex(
                            $(this).val()
                        );
                        column
                            .search(val ? '^' + val + '$' : '', true, false)
                            .draw();
                    });
                column.data().unique().sort().each(function (d, j) {
                    select.append('<option value="' + d + '">' + d + '</option>')
                });
            });
        }
    });

    document.querySelectorAll('#min, #max').forEach((el) => {
        el.addEventListener('change', () => table.draw());
    });

    $('#dataTableExample').each(function () {
        var datatable = $(this);
        var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
        search_input.attr('placeholder', 'Search');
        search_input.removeClass('form-control-sm');
        var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
        length_sel.removeClass('form-control-sm');
    });
});*/




// $(function () {
//     'use strict';
//
//     // Initialize date pickers
//     let minDate, maxDate;
//     DataTable.ext.search.push(function (settings, data, dataIndex) {
//         let min = minDate.val();
//         let max = maxDate.val();
//         let date = new Date(data[6]); // Adjusted index for the 'created_at' column
//         if (
//             (min === null && max === null) ||
//             (min === null && date <= max) ||
//             (min <= date && max === null) ||
//             (min <= date && date <= max)
//         ) {
//             return true;
//         }
//         return false;
//     });
//
//     minDate = new DateTime('#min', {
//         format: 'MMMM Do YYYY'
//     });
//     maxDate = new DateTime('#max', {
//         format: 'MMMM Do YYYY'
//     });
//
//     // Initialize DataTable
//     var table = $('#dataTableExample').DataTable({
//         dom: 'Bfrtip',
//         buttons: [
//             'copy', 'csv', 'excel', 'pdf', 'print'
//         ],
//         ajax: {
//             url: "/ajax-sale-report",
//             dataSrc: ''
//         },
//         columns: [
//             { data: 'title' },
//             { data: 'customer' },
//             { data: 'vendor' },
//             { data: 'payment_gateway' },
//             { data: 'earning' },
//             { data: 'date' },
//             { data: 'commission' }
//         ],
//         "aLengthMenu": [
//             [10, 30, 50, -1],
//             [10, 30, 50, "All"]
//         ],
//         "iDisplayLength": 10,
//         "language": {
//             search: ""
//         },
//         orderCellsTop: true,
//         initComplete: function () {
//             var table = this.api();
//             table.columns().every(function () {
//                 var column = this;
//                 var input = $('<input type="text" />')
//                     .appendTo($("thead tr:eq(1) td").eq(this.index()))
//                     .on("keyup", function () {
//                         column.search($(this).val()).draw();
//                     });
//                 var select = $('<select><option value=""></option></select>')
//                     .appendTo($("thead tr:eq(2) td").eq(this.index()))
//                     .on('change', function () {
//                         var val = $.fn.dataTable.util.escapeRegex(
//                             $(this).val()
//                         );
//                         column
//                             .search(val ? '^' + val + '$' : '', true, false)
//                             .draw();
//                     });
//                 column.data().unique().sort().each(function (d, j) {
//                     select.append('<option value="' + d + '">' + d + '</option>')
//                 });
//             });
//         }
//     });
//
//     // Update table on date picker change
//     document.querySelectorAll('#min, #max').forEach((el) => {
//         el.addEventListener('change', () => table.draw());
//     });
//
//     // Customize DataTable search input and length select
//     $('#dataTableExample').each(function () {
//         var datatable = $(this);
//         var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
//         search_input.attr('placeholder', 'Search');
//         search_input.removeClass('form-control-sm');
//         var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
//         length_sel.removeClass('form-control-sm');
//     });
// });
