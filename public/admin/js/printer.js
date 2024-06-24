function printContent() {
    // window.print();
    var printWindow = window.open('', '_blank');
    printWindow.document.open();
    printWindow.document.write('<!DOCTYPE html><html lang="en"><head><meta charset="UTF-8"><meta name="viewport" content="width=device-width, initial-scale=1.0"><meta http-equiv="X-UA-Compatible" content="ie=edge"><title>Receipt</title>');
    printWindow.document.write(`<link rel="preconnect" href="https://fonts.googleapis.com">`);
    printWindow.document.write(`<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>`);
    printWindow.document.write(`<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" rel="stylesheet">`);
    printWindow.document.write(`<link rel="stylesheet" href="../css/core.css">`);
    printWindow.document.write(`<link rel="stylesheet" href="../css/feather-font/css/iconfont.css">`);
    printWindow.document.write(`<link rel="stylesheet" href="../css/style.css">`);
    printWindow.document.write(`<link rel="stylesheet" href="../css/NewStyle.css">`);
    printWindow.document.write(`<link rel="shortcut icon" href="../img/favicon.png" />`);
    printWindow.document.write(`<link rel="stylesheet" href="../css/toastr.css">`);
    printWindow.document.write(`<style>.blockUI.blockMsg.blockPage h1{color: #ffffff !important;}</style></head>`);
    printWindow.document.write('<body><div class="main-wrapper"><div class="page-wrapper"><div class="page-content">');
    // printWindow.document.write('<link rel="stylesheet" href="styles.css">');
    // Select and print only the specific div with class "receipt"
    printWindow.document.write('<div class="row"> <div class="col-md-12"> <div class="card"> <div class="card-body">');
    printWindow.document.write('<div class="receipt">' + document.querySelector('.receipt').innerHTML + '</div>');
    printWindow.document.write('</div></div></div></div></div>');
    printWindow.document.write('<footer class="footer d-flex flex-column flex-md-row align-items-center justify-content-between px-4 py-3 border-top small"><p class="text-muted mb-1 mb-md-0">Copyright © 2023 HarryFox.</p></footer>');
    printWindow.document.write('</div></div>');
    printWindow.document.write(`<script src="./core.js"></script>`);
    printWindow.document.write(`<script src="./feather.min.js"></script>`);
    printWindow.document.write(`<script src="./template.js"></script>`);
    printWindow.document.write(`<script src="./dashboard-dark.js"></script>`);
    printWindow.document.write('</body></html>');
    printWindow.document.close();
    printWindow.print();
}
