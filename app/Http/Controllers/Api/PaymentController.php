<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\ExecutePaymentRequest;
use App\Http\Requests\Api\LSPPaymentRequest;
use App\Models\LspPayment;
use App\Models\Price;
use App\Models\UserPayment;
use App\Services\Api\ChallengeService;
use App\Services\PaymentGateway\RapydService;
use App\Services\PaymentGateway\StripeService;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;
use App\Services\PaymentGateway\LSPService;

class PaymentController extends Controller
{
    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            if(Auth::check())
            {
                LaravelLocalization::setLocale(Auth::user()->default_language);
            }


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

            if($request->type == 'card')
            {
                $checkForPaymentStatus = LspPayment::where('payment_id',$request->payment_id)->first();

                if(!$checkForPaymentStatus)
                {
                    return makeResponse('error',__('response_message.invalid_payment_id'),Response::HTTP_FORBIDDEN);
                }

                if($checkForPaymentStatus->status != 2)
                {
                    return makeResponse('error',__('response_message.incomplete_payment'),Response::HTTP_PAYMENT_REQUIRED);
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


//        if($request->type == 'card')
//        {
//            $payment = new StripeService();
//
//
//            try{
//                $executePayment = $payment->charge($savePayment->amount,$request->token);
//                if (isset($executePayment['type']) && $executePayment['type'] == 'error') {
//                    return makeResponse('error', __('response_message.payment_error') . ': ' . $executePayment['message'], Response::HTTP_INTERNAL_SERVER_ERROR);
//                }
//            }
//            catch (\Exception $e)
//            {
//                DB::rollBack();
//                return makeResponse('error', __('response_message.stripe').' '.__('response_message.payment_error') . ': ' . $e->getMessage(), Response::HTTP_INTERNAL_SERVER_ERROR);
//            }
//
////            $executePayment = json_decode($executePayment);
//        }
//
////        $savePayment->payment_id = isset($executePayment) ? $executePayment->data->id:null;
//        $savePayment->payment_id = isset($executePayment) ? $executePayment:null;
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

    public function lspPayment(LSPPaymentRequest $request)
    {
        DB::beginTransaction();

        $amount = Price::find($request->price_id);

        if(!$amount)
        {
            return makeResponse('error',__('response_message.invalid_challenge_id'),Response::HTTP_FORBIDDEN);
        }

        try{

            $data = array();

            $payment = new LSPService();

            $paymentRecord = $payment->payment($amount->id,$amount->price,$amount->title);

            if($paymentRecord['success'] == 'true' )
            {
                $lspPayment = new LspPayment();
                $lspPayment->payment_id = $paymentRecord['id'];
                $lspPayment->redirect_link = $paymentRecord['redirect_link'];
                $lspPayment->expire_time  = $paymentRecord['expired_at'];
                $lspPayment->status  = 0;

                $lspPayment->save();
            }
            else{

                return makeResponse('error',$paymentRecord['errors'][0],Response::HTTP_INTERNAL_SERVER_ERROR);
            }

            $data = [
                'id' => $paymentRecord['id'],
                'redirect_link' => $paymentRecord['redirect_link'],
                'expire_time' => $paymentRecord['expired_at'],

            ];

        }
        catch (\Exception $e)
        {
            return makeResponse('error',__('response_message.error_occur').": ".$e,Response::HTTP_FORBIDDEN);
        }

        DB::commit();

        return makeResponse('success',__('response_message.payment_link_created'),Response::HTTP_OK,$data);
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


    public function webhook_response(Request $request)
    {
        $findPayment = LspPayment::where('payment_id',$request->id)->first();
        Log::info($request->all);
        Log::info($request->status);
        if($findPayment)
        {
            if($request->status == "created")
            {
                $findPayment->status = 0;
            }
            elseif($request->status == "processing")
            {
                $findPayment->status = 1;
            }
            elseif($request->status == "success")
            {
                $findPayment->status = 2;
            }
            $findPayment->save();
        }
    }


}
