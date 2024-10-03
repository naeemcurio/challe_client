<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\WaitingLounge;
use Illuminate\Http\Request;

class WaitingLoungeController extends Controller
{
    public function index()
    {
        $data =  WaitingLounge::where('status',0)->get();

        return view('admin.waitingLounge.listing',compact('data'));

    }
}
