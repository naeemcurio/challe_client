<?php

namespace App\Services\PaymentGateway;
use App\Models\User;
use HPWebdeveloper\LaravelPayPocket\Facades\LaravelPayPocket;
use Illuminate\Support\Facades\Http;


class CityPayService
{
    // Handling status updates
    public function handleStatusUpdate($data,$findPayment)
    {
//        Log::info('Handling status update:', $data);

        // Process the status update based on the 'status' field
        switch (isset($data['status']) && $data['status']) {
            case 'IN_PROGRESS':
                // Handle in-progress status
//                Log::info("Order {$data['order_id']} is in progress");
                $findPayment->status = 1;
                $findPayment->save();
                break;

            case 'CONFIRMED':
                // Handle confirmed status
//                Log::info("Order {$data['order_id']} is confirmed");
                $findPayment->status = 3;
                $findPayment->save();
                break;

            case 'CANCELED':
                // Handle canceled status
//                Log::info("Order {$data['order_id']} is canceled");
                $findPayment->status = 4;
                $findPayment->save();
                break;

            default:
//                Log::warning("Unknown status received: {$data['status']}");
                break;
        }

        if(isset($data['order_status']) == 'CONFIRMED')
        {
            $findPayment->status = 3;
            $findPayment->save();
            if($findPayment->user_id)
            {
                $findUser = User::find($findPayment->user_id);

                LaravelPayPocket::deposit($findUser, 'wallet_4', (float)$findPayment->amount,'Amount Add to Wallet From City Pay: '.$findPayment->transaction_id);

            }

            return true;
        }



    }

    // Handling transactions
    public function handleTransaction($data,$findPayment)
    {
//        Log::info('Handling new transaction:', $data);

        // Process the transaction data (e.g., update the database with transaction details)
        $transactionId = $data['transaction_id'] ?? null;
//        $receivedAmount = $data['received_amount_in_coins'] ?? 0;
//        $fiatAmount = $data['received_amount_in_fiat'] ?? 0;
//
//
//
//        Log::info("Transaction ID: $transactionId, Amount received in coins: $receivedAmount, in fiat: $fiatAmount");

        $findPayment->status = 2;
        $findPayment->transaction_id = $transactionId;
        $findPayment->save();


    }


    public function generateOrderLink($amount)
    {

        $rand_number = random_int(1, 2147483647);

        $response = Http::post('https://v2-listener.citypay.io/api/generateOrder', [
            'customer_id' => env('CITY_PAY_CUSTOMER_ID'),
            'access_token' => env('CITY_PAY_ACCESS_TOKEN'),
            'order_id' => $rand_number,
            'order_token' => $rand_number,
            'amount' => $amount,
        ]);

        // Handle the response
        if ($response->successful()) {
            $result = [
                'result' => 'success',
                'data' => $response->json()
            ];
            return $result;
        }

        $result = [
            'result' => 'error',
            'message' => 'Error in API request',
            'error' => $response->json(),
            'statusCode' => $response->status()
        ];

        return $result;

    }
}
