<?php

namespace App\Services\PaymentGateway;

use Illuminate\Support\Facades\Auth;
use \Illuminate\Support\Facades\Http;

class LSPService
{
    public $clientID;
    public $apiKey;

    public function __construct()
    {
        $this->clientID = env('LSP_CLIENT_ID');
        $this->apiKey = env('LSP_API_KEY');
    }

    public function payment($paymentID,$amount,$title)
    {

        $data = [
            'order_id' => $paymentID,
            'payment_amount' => $amount * 100,
            'payment_currency' => 'USD',
            'payment_description' => 'Payment For Challenge: '.$title,
            'return_url' => env('LSP_RETURN_URL'),
            'callback_url' => env('LSP_CALLBACK_URL'),
            "billing_info" => [ // optional array
                "first_name" => Auth::user()->full_name, // payer first name (string. optional.)
                "last_name" => Auth::user()->nick_name, // payer last name (string. optional.)
                "email" => Auth::user()->email, // payer email (string. optional.)
                "phone" => Auth::user()->phone_number, // payer phone number (string. optional.)

            ]
        ];


        // Exclude billing_info and sort the array by key
        $filteredData = array_filter($data, function($key) {
            return $key !== 'billing_info';
        }, ARRAY_FILTER_USE_KEY);

        ksort($filteredData);

        // Join the values with "|" symbol
        $signatureString = implode('|', $filteredData);

        $checksum = hash_hmac('sha256', $signatureString, $this->apiKey);

        // Prepare headers
        $headers = [
            'Authorization' => 'Basic ' . base64_encode($this->clientID.':'.$this->apiKey),
            'Message-Checksum' => $checksum
        ];

        // Send the API request with the headers and data
        $response = Http::withHeaders($headers)->post('https://api.lsp.capital/api/v2/payments/client-to-server', $data);

        // Retrieve the response
        $responseData = $response->json();

        return $responseData;

    }
}
