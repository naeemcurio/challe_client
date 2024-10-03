<?php

namespace App\Services\Admin;


use App\Models\Challenge;
use App\Models\User;
use App\Services\PaymentGateway\StripeService;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

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


        $notificationArray = array();
//        $today = Carbon::today(); // Get today's date


        foreach (Auth::user()->notifications->take('10') as $notification) {
            // Convert the notification's created_at to a Carbon instance
            $createdAt = Carbon::parse($notification->created_at);


            // Check if the notification was created today
//            if ($createdAt->isSameDay($today)) {
                if (isset($notification->data['type']) && $notification->data['type'] == 'withdraw_request') {
                    $getUser = User::find($notification->data['user_id']);
                    if ($getUser) {
                        $notificationArray[] = [
                            'id' => $notification->id,
                            'full_name' => $getUser->full_name,
                            'title' => __($notification->data['notification']),
                            'message' => $getUser->full_name . ' ' . __($notification->data['message']) .' $'.__($notification->data['amount']),
                            'type' => isset($notification->data['type']) ? $notification->data['type'] : '',
                        ];
                    }
                }
                elseif (isset($notification->data['type']) && $notification->data['type'] == 'challenge_record_submit') {
                    $getUser = User::find($notification->data['user_id']);
                    if ($getUser) {
                        $notificationArray[] = [
                            'id' => $notification->id,
                            'full_name' => $getUser->full_name,
                            'challenge_attempt_id' => $notification->data['id'],
                            'title' => __($notification->data['notification']),
                            'message' => $getUser->full_name . ' ' . __($notification->data['message']),
                            'type' => isset($notification->data['type']) ? $notification->data['type'] : '',
                        ];
                    }
                }
            }
//        }



        return view('admin.dashboard.dashboard',compact('users','challenges','stripeBalance','notificationArray'));
    }
}
