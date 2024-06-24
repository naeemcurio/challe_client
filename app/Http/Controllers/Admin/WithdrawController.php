<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Leaderboard;
use App\Models\User;
use App\Models\WithdrawHistory;
use App\Services\PaymentGateway\StripeService;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;

class WithdrawController extends Controller
{
    public function index()
    {
        $withdrawRequests =WithdrawHistory::orderBy('status','asc')->get();

        return view('admin.withdraw.listing', compact('withdrawRequests'));
    }

    public function transfer(WithdrawHistory $withdraw)
    {

        $user = User::find($withdraw->user_id);

        $checkUserAmountINWallet = $user->walletBalance;

        if($checkUserAmountINWallet < $withdraw->amount)
        {
            return makeResponse('error',__('response_message.less_balance'),Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        if($withdraw->request_type == 0)
        {
            $payment = new StripeService();

            try{
                $checkBalance = $payment->getBalance();

                if($checkBalance['data'] == 0)
                {
                    return makeResponse('error',__('response_message.sufficient_balance'),Response::HTTP_UNPROCESSABLE_ENTITY);
                }


                if(isset($checkBalance) && $checkBalance['type'] == 'error')
                {
                    return makeResponse($checkBalance['type'],$checkBalance['message'],Response::HTTP_INTERNAL_SERVER_ERROR);
                }
            }
            catch (\Exception $e)
            {
                return makeResponse('error',__('response_message.check_balance_error').': '.$e,Response::HTTP_INTERNAL_SERVER_ERROR);
            }

            try{
                $transfer = $payment->transferAmount($withdraw->amount,$withdraw->user->stripe_connect_id);

                if(isset($transfer) && $transfer['type'] == 'error')
                {
                    return makeResponse($transfer['type'],$transfer['message'],Response::HTTP_INTERNAL_SERVER_ERROR);
                }
            }
            catch (\Exception $e)
            {
                return makeResponse('error',__('response_message.transfer_error').$e,Response::HTTP_INTERNAL_SERVER_ERROR);
            }

            $withdraw->stripe_transfer_id = $transfer['data'];

        }


        try{

            $withdraw->status = 1;

            $withdraw->save();


            $user->pay($withdraw->amount, 'Amount Withdrawn');

            return makeResponse('success',__('response_message.transfer_success'),Response::HTTP_OK);
        }
        catch (\Exception $e)
        {
            return makeResponse('error',__('response_message.transfer_error'),Response::HTTP_INTERNAL_SERVER_ERROR);
        }

    }
}

