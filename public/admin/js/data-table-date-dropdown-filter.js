// npm package: datatables.net-bs5
// github link: https://github.com/DataTables/Dist-DataTables-Bootstrap5

$(function() {
    'use strict';

    $(function() {

        /* date between*/
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
        /* date between*/

        var table = $('#dataTableExample').DataTable({
            "aLengthMenu": [
                [10, 30, 50, -1],
                [10, 30, 50, "All"]
            ],
            "iDisplayLength": 10,
            "language": {
                search: ""
            },
            orderCellsTop: true,
            initComplete: function() {
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
            }
        });

        /*date between*/
        // Refilter the table
        document.querySelectorAll('#min, #max').forEach((el) => {
            el.addEventListener('change', () => table.draw());
        });
        /*date between*/

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
    });

});














// // npm package: datatables.net-bs5
// // github link: https://github.com/DataTables/Dist-DataTables-Bootstrap5
//
// $(function () {
//     'use strict';
//
//     $(function () {
//
//         let minDate, maxDate;
//         // Custom filtering function which will search data in column four between two values
//         DataTable.ext.search.push(function (settings, data, dataIndex) {
//             let min = minDate.val();
//             let max = maxDate.val();
//             let date = new Date(data[5]);
//             if (
//                 (min === null && max === null) ||
//                 (min === null && date <= max) ||
//                 (min <= date && max === null) ||
//                 (min <= date && date <= max)
//             ) {
//                 return true;
//             }
//             return false;
//         });
//         // Create date inputs
//         minDate = new DateTime('#min', {
//             format: 'MMMM Do YYYY'
//         });
//         maxDate = new DateTime('#max', {
//             format: 'MMMM Do YYYY'
//         });
//
//         let table = $('#dataTableExample').DataTable({
//             "aLengthMenu": [
//                 [10, 30, 50, -1],
//                 [10, 30, 50, "All"]
//             ],
//             "iDisplayLength": 10,
//             "language": {
//                 search: ""
//             },
//             orderCellsTop: true,
//             initComplete: function () {
//                 var table = this.api();
//                 table.columns().every(function () {
//                     var column = this;
//                     var input = $('<input type="text" />')
//                         .appendTo($("thead tr:eq(1) td").eq(this.index()))
//                         .on("keyup", function () {
//                             column.search($(this).val()).draw();
//                         });
//                     var select = $('<select><option value=""></option></select>')
//                         .appendTo($("thead tr:eq(2) td").eq(this.index()))
//                         .on('change', function () {
//                             var val = $.fn.dataTable.util.escapeRegex(
//                                 $(this).val()
//                             );
//                             column
//                                 .search(val ? '^' + val + '$' : '', true, false)
//                                 .draw();
//                         });
//                     column.data().unique().sort().each(function (d, j) {
//                         select.append('<option value="' + d + '">' + d + '</option>')
//                     });
//                 });
//             }
//         });
//
//         // Refilter the table
//         document.querySelectorAll('#min, #max').forEach((el) => {
//             el.addEventListener('change', () => table.draw());
//         });
//
//         $('#dataTableExample').each(function () {
//             var datatable = $(this);
//             // SEARCH - Add the placeholder for Search and Turn this into in-line form control
//             var search_input = datatable.closest('.dataTables_wrapper').find('div[id$=_filter] input');
//             search_input.attr('placeholder', 'Search');
//             search_input.removeClass('form-control-sm');
//             // LENGTH - Inline-Form control
//             var length_sel = datatable.closest('.dataTables_wrapper').find('div[id$=_length] select');
//             length_sel.removeClass('form-control-sm');
//         });
//     });
//
// });
