<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\ExecutePaymentRequest;
use App\Models\Price;
use App\Models\UserPayment;
use App\Services\Api\ChallengeService;
use App\Services\PaymentGateway\RapydService;
use App\Services\PaymentGateway\StripeService;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class PaymentController extends Controller
{
    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            LaravelLocalization::setLocale(Auth::user()->default_language);

            return $next($request);
        });
    }

    public function payment(ExecutePaymentRequest $request)
    {
        DB::beginTransaction();
        //save in DB
        try{
            $amount = Price::find($request->price_id);

            if($request->type == 'wallet')
            {
                $balance = Auth::user()->walletBalance;

                if($balance < $amount->price )
                {
                    return makeResponse('error',__('response_message.insufficient_balance_in_wallet'),Response::HTTP_INTERNAL_SERVER_ERROR);
                }
            }

            $savePayment = new UserPayment();

            $savePayment->user_id = Auth::user()->id;
            $savePayment->amount = $amount->price;

            $savePayment->fill(collect($request->validated())
                ->except('card_id','type','token','lat','lng','city')->all());

            $savePayment->save();

        }
        catch (\Exception $e)
        {
            DB::rollBack();
            return makeResponse('error',__('response_message.payment_error').': '.$e,Response::HTTP_INTERNAL_SERVER_ERROR);
        }


        if($request->type == 'card')
        {
            $payment = new StripeService();

            try{
                $executePayment = $payment->charge($savePayment->amount,$request->token);
                if (isset($executePayment['result']) && $executePayment['result'] == 'error') {
                    return makeResponse('error', __('response_message.payment_error') . ': ' . $executePayment['message'], Response::HTTP_INTERNAL_SERVER_ERROR);
                }
            }
            catch (\Exception $e)
            {
                DB::rollBack();
                return makeResponse('error', __('response_message.stripe').' '.__('response_message.payment_error') . ': ' . $e->getMessage(), Response::HTTP_INTERNAL_SERVER_ERROR);
            }

//            $executePayment = json_decode($executePayment);
        }

//        $savePayment->payment_id = isset($executePayment) ? $executePayment->data->id:null;
        $savePayment->payment_id = isset($executePayment) ? $executePayment:null;
        $savePayment->save();

        if($request->type == 'wallet')
        {
            Auth::user()->pay((float)$savePayment->amount,  "Paying Price of Starting Challenge: ".$request->price_id);
        }

        DB::commit();

//        $data = [
//            'payment_id' => $savePayment->id
//        ];


        $request->merge(['payment_id' => $savePayment->id]);

        $challengeService = new ChallengeService();
        $challengeExecute = new ChallengeController($challengeService);


        return  $challengeExecute->execute($request);

//        return makeResponse('success',__('response_message.payment_success'),Response::HTTP_OK,$data);
    }


    public function createConnectAccount(Request $request)
    {
        $payment = new StripeService();


        $account = $payment->createConnectAccount($request);

        if ($account['type'] == 'error') {
            return makeResponse('error', $account['message'], 500);
        }

        Auth::user()->stripe_connect_id = $account['data'];
        Auth::user()->save();

        $accountLink = $payment->createConnectAccountLink();

        if ($accountLink['type'] == 'error') {
            return makeResponse("error", $accountLink['message'], 500);

        }


        return makeResponse("success", 'User account created successfully.', 200, $accountLink['data']);
    }

    public function refreshConnectAccountLink(Request $request)
    {
        $payment = new StripeService();

        $accountLink = $payment->createConnectAccountLink($request);

        if ($accountLink['type'] == 'error') {
            return makeResponse("error", $accountLink['message'], 500);

        }


        return redirect($accountLink['data']['url']);
    }

}
