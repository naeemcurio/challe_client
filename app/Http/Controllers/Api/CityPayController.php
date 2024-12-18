<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\CancelCityPayRequest;
use App\Http\Requests\Api\CityPayRequest;
use App\Http\Requests\Api\GenerateCityPayLinkRequest;
use App\Models\CryptoPayment;
use App\Models\Price;
use App\Services\PaymentGateway\CityPayService;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use function Kreait\Firebase\JWT\Value\make;

class CityPayController extends Controller
{
    public $cityPayService;

    public function __construct(CityPayService $cityPayService)
    {
        $this->cityPayService = $cityPayService;
    }

    public function generatePaymentLink(GenerateCityPayLinkRequest $request)
    {
        DB::beginTransaction();

        if($request->price_id)
        {
            $amount = Price::find($request->price_id);

            if(!$amount)
            {
                return makeResponse('error',__('response_message.invalid_challenge_id'),Response::HTTP_FORBIDDEN);
            }

            $price = $amount->price;


        }
        else{
            $price = $request->amount;
        }


        try{
            $generateLink = $this->cityPayService->generateOrderLink($price);


            if($generateLink['result'] == 'error')
            {
                return makeResponse('error',$generateLink['error']['message'],$generateLink['statusCode']);
            }
        }
        catch (\Exception $e)
        {
            return makeResponse('error',__('response_message.error_occur_in_link_generate')." :".$e,Response::HTTP_INTERNAL_SERVER_ERROR);
        }


        try{
            $cryptoPayment = new CryptoPayment();

            $cryptoPayment->payment_id = $generateLink['data']['data']['id'];
            $cryptoPayment->payment_url = $generateLink['data']['data']['payment_url'];
            $cryptoPayment->token = $generateLink['data']['data']['token'];
            $cryptoPayment->user_id = Auth::user()->id;
            $cryptoPayment->amount = $price;
            $cryptoPayment->status = 0;

            $cryptoPayment->save();

        }
        catch (\Exception $e)
        {
            DB::rollBack();
            return makeResponse('error',__('response_message.error_occur').": ".$e,Response::HTTP_FORBIDDEN);
        }

        $data = [
            'id' => $cryptoPayment->payment_id,
            'redirect_link' => $cryptoPayment->payment_url,
        ];

        DB::commit();

        return makeResponse('success',__('response_message.payment_link_created'),Response::HTTP_OK,$data);


    }

    public function handleCallback(Request $request)
    {

        \Illuminate\Support\Facades\Log::info($request->all());

        $callbackData = $request->all();

        $findPayment = CryptoPayment::where('payment_id',$callbackData['order_id'])->first();

        if(!$findPayment)
        {
            return makeResponse('error',__('response_message.invalid_record'),Response::HTTP_FORBIDDEN);
        }


        switch ($request->action) {
            case 'status_update':
                $this->cityPayService->handleStatusUpdate($request->all(),$findPayment);
                break;

            case 'receive_transaction':
                $this->cityPayService->handleTransaction($request->all(),$findPayment);
                break;

            default:
                Log::warning('Unknown action type received in callback');
                break;
        }

    }

    public function cancelPayment(CancelCityPayRequest $request)
    {
        try{
            $getCryptoPayment = CryptoPayment::where('payment_id',$request->id)->first();

            if(!$getCryptoPayment)
            {
                return makeResponse('error',__('response_message.invalid_record'),Response::HTTP_FORBIDDEN);
            }

            $getCryptoPayment->status =  4;

            $getCryptoPayment->save();


            return makeResponse('success',__('response_message.payment_cancel'),Response::HTTP_OK);

        }
        catch (\Exception $e)
        {
            return makeResponse('error',__('response_message.error_occur').' :'.$e,Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }
}
