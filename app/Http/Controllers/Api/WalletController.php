<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\WithdrawalRequest;
use App\Models\User;
use App\Models\WithdrawHistory;
use App\Models\WithdrawHistoryCard;
use App\Services\PaymentGateway\RapydService;
use Carbon\Carbon;
use HPWebdeveloper\LaravelPayPocket\Exceptions\WalletNotFoundException;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class WalletController extends Controller
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


    public function index()
    {
        try {
            $walletAmount = Auth::user()->getWalletBalanceByType('wallet_2');
            return makeResponse('success', __('response_message.wallet_balance'), Response::HTTP_OK, ['wallet_amount' => $walletAmount]);
        } catch (WalletNotFoundException $e) {
            return makeResponse('error', __('response_message.record_not_found'), Response::HTTP_NOT_FOUND);

        }

    }

    public function wallet()
    {
        $withdrawAmounts = WithdrawHistory::where('user_id', Auth::user()->id)
            ->get();

        $withdrawTransactionArray = array();
        foreach ($withdrawAmounts as $withdrawAmount) {
            $withdrawTransactionArray[] = [
                'id' => $withdrawAmount->id,
                'created_at' => Carbon::parse($withdrawAmount->created_at)->format('Y-m-d'),
                'transaction_id' => $withdrawAmount->stripe_transfer_id,
                'amount' => $withdrawAmount->amount,
                'status' => $withdrawAmount->status
            ];
        }

        $data = [
            'wallet_amount' => (string)Auth::user()->walletBalance,
            'history' => $withdrawTransactionArray
        ];

        return makeResponse('success', __('response_message.record_fetch'), Response::HTTP_OK, $data);
    }

    public function withdraw(WithdrawalRequest $request)
    {
        if ($request->withdraw_amount > Auth::user()->walletBalance) {
            return makeResponse('error', __('response_message.insufficient_balance_in_wallet'), Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        $paymentGateway = new RapydService();

        //create card
        try {
            $card = $paymentGateway->addPaymentMethod($request->all());

            if (isset($card['result']) && $card['result'] == 'error') {
                return makeResponse('error', __('rapyd.save_card_error') . ': ' . $card['message'], Response::HTTP_INTERNAL_SERVER_ERROR);
            }

            $card = json_decode($card);

        } catch (\Exception $e) {
            return makeResponse('error', __('rapyd.save_card_error') . ': ' . $e, Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        //create beneficiary
        try {
            $createBeneficiary = $paymentGateway->createBeneficiary($card->data->id);

            if (isset($createBeneficiary['result']) && $createBeneficiary['result'] == 'error') {
                return makeResponse('error', __('rapyd.create_beneficiary_error') . ': ' . $createBeneficiary['message'], Response::HTTP_INTERNAL_SERVER_ERROR);
            }

            $createBeneficiary = json_decode($createBeneficiary);


        } catch (\Exception $e) {
            return makeResponse('error', __('rapyd.create_beneficiary_error') . ': ' . $e, Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        //create withdraw
        try {
            $adminRecord = User::where('role_id', 1)->first();

            $withdraw = $paymentGateway->createPayout($createBeneficiary->data->id,
                $request->withdraw_amount, $adminRecord);


            if (isset($withdraw['result']) && $withdraw['result'] == 'error') {
                return makeResponse('error', __('rapyd.withdraw') . ': ' . $withdraw['message'], Response::HTTP_INTERNAL_SERVER_ERROR);
            }


            $withdraw = json_decode($withdraw);

        } catch (\Exception $e) {
            return makeResponse('error', __('rapyd.withdrawl_error') . ': ' . $e, Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        //save withdrawal amount
        try {
            $withdraw = WithdrawHistory::create([
                'user_id' => Auth::user()->id,
                'amount' => $request->withdraw_amount,
                'rapyd_transaction_id' => $withdraw->data->id,
                'beneficiary_id' => $createBeneficiary->data->id,
                'card_id' => $card->data->id
            ]);

            Auth::user()->pay($request->withdraw_amount, 'Amount Withdrawn');

        } catch (\Exception $e) {
            return makeResponse('error', __('response_message.error_message_line') . ' ' . __('response_message.record'), Response::HTTP_OK);

        }


        return makeResponse('success', __('response_message.withdraw_success'), Response::HTTP_OK);
    }

    public function withdrawRequest(WithdrawalRequest $request)
    {

        DB::beginTransaction();
        if ($request->withdraw_amount > Auth::user()->walletBalance) {
            return makeResponse('error', __('response_message.insufficient_balance_in_wallet'), Response::HTTP_UNPROCESSABLE_ENTITY);
        }


        try {
            $withdraw = WithdrawHistory::create([
                'user_id' => Auth::user()->id,
                'amount' => $request->withdraw_amount,
                'status' => 0,
                'request_type' => isset($request->request_type) ? $request->request_type:0
            ]);

//            Auth::user()->pay($request->withdraw_amount, 'Amount Withdrawn');

        } catch (\Exception $e) {
            DB::rollBack();
            return makeResponse('error', __('response_message.error_message_line') . ' ' . __('response_message.record'), Response::HTTP_OK);

        }

        if($withdraw->request_type == 1)
        {
            try{
                $withdraw_request =  WithdrawHistoryCard::create([
                   'withdraw_history_id' => $withdraw->id,
                   'card_holder_name' => $request->card_holder_name,
                   'card_number' => $request->card_number,
                   'card_expiry_month' => $request->card_expiry_month,
                   'card_expiry_year' => $request->card_expiry_year,
                ]);
            }
            catch (\Exception $e)
            {
                DB::rollBack();
                return makeResponse('error', __('response_message.error_message_line') . ' ' . __('response_message.record'), Response::HTTP_OK);

            }

        }

        DB::commit();
        return makeResponse('success', __('response_message.withdraw_request'), Response::HTTP_OK);

    }

}
