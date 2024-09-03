<?php

namespace App\Services\Admin;


use App\Models\Challenge;
use App\Models\User;
use App\Services\PaymentGateway\StripeService;

class DashboardService
{
    public function index()
    {
        $payment = new StripeService();

        $users = User::count();
        $challenges = Challenge::count();
        $stripeBalance = $payment->getBalance();


        if(isset($stripeBalance['data']))
        {
            $stripeBalance = $stripeBalance['data'];
        }
        else{
            $stripeBalance = 0;
        }


        return view('admin.dashboard.dashboard',compact('users','challenges','stripeBalance'));
    }
}
