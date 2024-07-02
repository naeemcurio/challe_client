<?php

namespace App\Http\Controllers;

use App\Models\Setting;
use Illuminate\Http\Request;

class PageController extends Controller
{

    public function privacyPolicy()
    {
        $data =  Setting::first();
        return view('privacy-policy',compact('data'));
    }
    public function termsAndConditions()
    {
        $data =  Setting::first();
        return view('terms-conditions',compact('data'));
    }
}
