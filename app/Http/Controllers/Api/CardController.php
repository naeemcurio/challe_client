<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\SaveCardRequest;
use App\Models\UserCard;
use App\Notifications\NewCardAdded;
use App\Services\PaymentGateway\RapydService;
use App\Services\PaymentGateway\StripeService;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Notification;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class CardController extends Controller
{
    public function __construct()
    {
        $this->middleware(function ($request, $next) {
            if (Auth::check()) {
                LaravelLocalization::setLocale(Auth::user()->default_language);
            }
            return $next($request);
        });
    }

    public function saveCard(SaveCardRequest $request)
    {
        $paymentGateway = new StripeService();

        try {
            $card = $paymentGateway->charge($request->all());


            if (isset($card['result']) && $card['result'] == 'error') {
                return makeResponse('error', __('response_message.error_card_save') . ': ' . $card['message'], Response::HTTP_INTERNAL_SERVER_ERROR);
            }
        } catch (\Exception $e) {
            return makeResponse('error', __('response_message.error_card_save').$e, Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        try {

            $saveCard = new UserCard();
//            if ($card->status->status == 'SUCCESS') {
                $saveCard->user_id = Auth::user()->id;
                $saveCard->card_id = $card->id;
                $saveCard->last_4_digit = $card->card->last4;
//                $saveCard->redirect_url = $card->data->redirect_url;
                $saveCard->card_brand = $card->card->brand;
                $saveCard->save();

//                $url = $saveCard->redirect_url;
                $url = null;

                $data = [
                    'url' => $url
                ];

//            }
        } catch (\Exception $e) {
            return makeResponse('error', __('response_message.error_card_save') . ': ' . $e, Response::HTTP_INTERNAL_SERVER_ERROR);

        }

        try{
            Notification::send(Auth::user(), new NewCardAdded($saveCard));

        }
        catch (\Exception $e) {
            return makeResponse('error', __('response_message.error_card_save') . ': ' . $e, Response::HTTP_INTERNAL_SERVER_ERROR);

        }

        return makeResponse('success', __('card.card') . ' ' . __('actions.save') . ' ' . __('actions.successfully'), Response::HTTP_CREATED, $data);


    }

    public function cardList()
    {
        try {
//
//            $userCardArray = array();
//            foreach (Auth::user()->cards as $userCard) {
//                $userCardArray[] = ['last_4_digit' => "xxxx xxxx xxxx " . $userCard->last_4_digit,
//                    'card_id' => $userCard->card_id,
//                    'card_verification' => $userCard->card_verification,
//                    'redirect_url' => $userCard->redirect_url,
//                    'card_brand' => $userCard->card_brand,
//                    'is_default' => $userCard->is_default];
//            }

            $walletAmount = Auth::user()->walletBalance;


            $data = [
//                'cards' => $userCardArray,
                'walletAmount' => number_format($walletAmount,2)
            ];

//            if (sizeof($userCardArray) > 0) {
                return makeResponse('success', __('response_message.record_found'), Response::HTTP_OK, $data);

//            }

//            return makeResponse('error', __('response_message.record_not_found'), Response::HTTP_NOT_FOUND);

        } catch (\Exception $e) {
            return makeResponse('error', __('response_message.error_in_finding_record') . ': ' . $e, Response::HTTP_INTERNAL_SERVER_ERROR);
        }

    }

    //web-hook
    public function changeCardStatus(Request $request)
    {
        if ($request->type == 'CARD_ADDED_SUCCESSFULLY' && $request->status == "NEW") {
            $cardId = $request->data['id'];
            if ($request->data['next_action'] == 'not_applicable') {
                $userCard = UserCard::where('card_id', $cardId)->first();
                if ($userCard) {
                    $userCard->card_verification = 1;
                    $userCard->save();
                }
            } else {
                $userCard = UserCard::where('card_id', $cardId)->first();

                $paymentGateway = new RapydService();
                $cards = $paymentGateway->retrieveCustomerPaymentMethod($userCard->user->rapyd_customer_id, $cardId);


                $card = json_decode($cards);


//                foreach ($cards->data as $card) {
                if ($card->data->id == $userCard->card_id) {
                    if ($card->data->next_action == 'not_applicable') {
                        if ($userCard) {
                            $userCard->card_verification = 1;
                            $userCard->save();
                        }
                    }
                }

//                }

            }
        }
    }




}
