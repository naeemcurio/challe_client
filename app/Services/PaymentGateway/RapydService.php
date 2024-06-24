<?php

namespace App\Services\PaymentGateway;

use Carbon\Carbon;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;

class RapydService
{
    protected $apiKey;
    protected $apiSecret;
    protected $baseURL;
    public $client;

    public function __construct()
    {
        $this->apiKey = env('RAPYD_ACCESS_KEY');
        $this->apiSecret = env('RAPYD_SECRET_KEY');
        $this->baseURL = env('RAPYD_BASE_URL');
        $this->client = new Client();
    }

    public function generateTimestamp()
    {
        $date = new \DateTime();
        $timestamp = $date->getTimestamp();    // Current Unix time.

        return $timestamp;
    }

//    public function generateSalt($length = 16)
//    {
//        // Generate random bytes
//        $salt = random_bytes(12);
//
//        // Encode the random bytes in hexadecimal format
//        $saltHex = bin2hex($salt);
//
//        return $saltHex;
//    }

    function generate_string($length = 12)
    {
        $permitted_chars = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        return substr(str_shuffle($permitted_chars), 0, $length);
    }

    public function generateSignature($httpMethod, $endPoint, $timestamp, $salt, $requestData = null)
    {
//        $body = null;
        $requestData = !is_null($requestData) ? json_encode($requestData, JSON_UNESCAPED_SLASHES) : '';

        $method = strtolower($httpMethod);
        $path = $endPoint;

        $toSign = "$method$path$salt$timestamp$this->apiKey$this->apiSecret$requestData";

        // Construct the string to sign
//        $toSign = $method . 'v1/data/countries' . $salt . $timestamp . $this->apiKey . $this->apiSecret . $requestData;

        // Generate the HMAC-SHA256 hash
        $signature = hash_hmac('sha256', $toSign, $this->apiSecret);

        // Convert the hexadecimal signature to Base64
        $signatureBase64 = base64_encode($signature);

        // Now $signatureBase64 contains your signature in Base64 format
        return $signatureBase64;
    }


    public function createCustomer($user)
    {
        try {

            $userData = [
                'email' => $user->email,
                'metadata' => [
                    'merchant_defined' => 'true'
                ],
                'name' => $user->full_name,
                'phone_number' => $user->phone_number
            ];

            $timeStamp = $this->generateTimestamp();
            $salt = $this->generate_string(16);
            $httpMethod = 'post';
            $path = "/v1/customers";

            $signature = $this->generateSignature($httpMethod, $path, $timeStamp, $salt, $userData);

            $response = $this->client->post($this->baseURL . $path, [
                'headers' => [
                    'Content-Type' => 'application/json',
                    'access_key' => $this->apiKey,
                    'salt' => $salt,
                    'timestamp' => $timeStamp,
                    'signature' => $signature
                ],
                'json' => $userData
            ]);


            // Get response body
            $body = $response->getBody()->getContents();

            // Process response as needed
            return $body;
        } catch (\Exception $e) {

            $error = [
                'result' => 'error',
                'message' => $e
            ];
            return $error;
        }
    }

    public function addPaymentMethod($request)
    {
        try {

            $cardData = [
                "type" => "us_atmdebit_card",
                "fields" => [
                    "number" => $request['card_number'],
                    "expiration_month" => $request['expiry_month'],
                    "expiration_year" => $request['expiry_year'],
                    "cvv" => $request['cvv'],
                    "name" => $request['cardholder_name']
                ],
                "metadata" => [
                    "merchant_defined" => true
                ],
                "complete_payment_url" => "https://challe.cyberasol.com?code=200",
                "error_payment_url" => "https://challe.cyberasol.com?code=500"
            ];

            $timeStamp = $this->generateTimestamp();
            $salt = $this->generate_string(16);
            $httpMethod = 'post';
            $path = "/v1/customers/" . Auth::user()->rapyd_customer_id . "/payment_methods";

            $signature = $this->generateSignature($httpMethod, $path, $timeStamp, $salt, $cardData);

            $response = $this->client->post($this->baseURL . $path, [
                'headers' => [
                    'Content-Type' => 'application/json',
                    'access_key' => $this->apiKey,
                    'salt' => $salt,
                    'timestamp' => $timeStamp,
                    'signature' => $signature
                ],
                'json' => $cardData
            ]);


            // Get response body
            $body = $response->getBody()->getContents();

            // Process response as needed
            return $body;
        } catch (\Exception $e) {

            $error = [
                'result' => 'error',
                'message' => $e
            ];
            return $error;
        }
    }

    public function executePayment($amount, $cardId)
    {
        try {

            $cardData = [
                "amount" => $amount,
                "currency" => "USD",
                "customer" => Auth::user()->rapyd_customer_id,
                "capture" => true,
            ];

            $timeStamp = $this->generateTimestamp();
            $salt = $this->generate_string(16);
            $httpMethod = 'post';
            $path = "/v1/payments/";

            $signature = $this->generateSignature($httpMethod, $path, $timeStamp, $salt, $cardData);

            $response = $this->client->post($this->baseURL . $path, [
                'headers' => [
                    'Content-Type' => 'application/json',
                    'access_key' => $this->apiKey,
                    'salt' => $salt,
                    'timestamp' => $timeStamp,
                    'signature' => $signature
                ],
                'json' => $cardData
            ]);


            // Get response body
            $body = $response->getBody()->getContents();

            // Process response as needed
            return $body;
        } catch (\Exception $e) {

            $error = [
                'result' => 'error',
                'message' => $e
            ];
            return $error;
        }
    }


    public function defaultCard($cardId)
    {
        try {

            $cardData = [
                "default_payment_method" => $cardId
            ];

            $timeStamp = $this->generateTimestamp();
            $salt = $this->generate_string(16);
            $httpMethod = 'post';
            $path = "/v1/customers/" . Auth::user()->rapyd_customer_id;

            $signature = $this->generateSignature($httpMethod, $path, $timeStamp, $salt, $cardData);

            $response = $this->client->post($this->baseURL . $path, [
                'headers' => [
                    'Content-Type' => 'application/json',
                    'access_key' => $this->apiKey,
                    'salt' => $salt,
                    'timestamp' => $timeStamp,
                    'signature' => $signature
                ],
                'json' => $cardData
            ]);


            // Get response body
            $body = $response->getBody()->getContents();

            // Process response as needed
            return $body;
        } catch (\Exception $e) {

            $error = [
                'result' => 'error',
                'message' => $e
            ];
            return $error;
        }
    }


    public function retrieveCustomerPaymentMethod($customerId, $cardId)
    {
        try {

            $timeStamp = $this->generateTimestamp();
            $salt = $this->generate_string(16);
            $httpMethod = 'get';
            $path = "/v1/customers/" . $customerId . '/payment_methods/' . $cardId;

            $signature = $this->generateSignature($httpMethod, $path, $timeStamp, $salt);

            $response = $this->client->get($this->baseURL . $path, [
                'headers' => [
                    'Content-Type' => 'application/json',
                    'access_key' => $this->apiKey,
                    'salt' => $salt,
                    'timestamp' => $timeStamp,
                    'signature' => $signature
                ]
            ]);


            // Get response body
            $body = $response->getBody()->getContents();

            // Process response as needed
            return $body;
        } catch (\Exception $e) {

            $error = [
                'result' => 'error',
                'message' => $e
            ];
            return $error;
        }
    }

    public function createBeneficiary($card)
    {
        try {

            $userData = [
                'category' => "card",
                'country' => "US",
                'currency' => "USD",
                'entity_type' => "individual",
                'first_name' => Auth::user()->full_name,
                'last_name' => Auth::user()->nick_name,
                'payment_type' => "regular",
                'card_id' => $card,
            ];

            $timeStamp = $this->generateTimestamp();
            $salt = $this->generate_string(16);
            $httpMethod = 'post';
            $path = "/v1/payouts/beneficiary";

            $signature = $this->generateSignature($httpMethod, $path, $timeStamp, $salt, $userData);

            $response = $this->client->post($this->baseURL . $path, [
                'headers' => [
                    'Content-Type' => 'application/json',
                    'access_key' => $this->apiKey,
                    'salt' => $salt,
                    'timestamp' => $timeStamp,
                    'signature' => $signature
                ],
                'json' => $userData
            ]);


            // Get response body
            $body = $response->getBody()->getContents();

            // Process response as needed
            return $body;
        } catch (\Exception $e) {

            $error = [
                'result' => 'error',
                'message' => $e
            ];
            return $error;
        }
    }

    public function createPayout($beneficiary_id,$withdraw_amount,$adminRecord)
    {
        try {

            $userData = [
                'beneficiary' => $beneficiary_id,
                'beneficiary_country' => "US",
                'beneficiary_entity_type' => "individual",
                'description' => "individual",
                'payout_method_type' => "us_atmdebit_card",
                "metadata" => [
                    "merchant_defined" => true
                ],
                "payout_amount" => $withdraw_amount,
                "payout_currency" => "USD",
                "sender" => [
                    "first_name" => $adminRecord->full_name,
                    "last_name" => $adminRecord->nick_name,
                    "phone_number" => $adminRecord->phone_number,
                    "date_of_birth" => Carbon::parse($adminRecord->date_of_birth)->format('d/m/Y')
                ],
                "sender_country" => "US",
                "sender_currency" => "USD",
                "sender_entity_type" => "individual"
            ];

            $timeStamp = $this->generateTimestamp();
            $salt = $this->generate_string(16);
            $httpMethod = 'post';
            $path = "/v1/payouts";

            $signature = $this->generateSignature($httpMethod, $path, $timeStamp, $salt, $userData);

            $response = $this->client->post($this->baseURL . $path, [
                'headers' => [
                    'Content-Type' => 'application/json',
                    'access_key' => $this->apiKey,
                    'salt' => $salt,
                    'timestamp' => $timeStamp,
                    'signature' => $signature
                ],
                'json' => $userData
            ]);


            // Get response body
            $body = $response->getBody()->getContents();

            // Process response as needed
            return $body;
        }
        catch (\Exception $e) {

            $error = [
                'result' => 'error',
                'message' => $e
            ];
            return $error;
        }
    }

}
