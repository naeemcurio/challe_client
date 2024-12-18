<?php

namespace App\Http\Controllers\Admin;

use App\DataTables\WaitingLoungeDataTable;
use App\Http\Controllers\Controller;
use App\Models\WaitingLounge;
use Illuminate\Http\Request;

class WaitingLoungeController extends Controller
{
    public function index(WaitingLoungeDataTable $dataTable)
    {
        return $dataTable->render('admin.waitingLounge.listing');

    }
}
