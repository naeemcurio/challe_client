<?php

namespace App\Services;

use Firebase\JWT\JWT;
use Illuminate\Support\Facades\Http;

class GoogleAuthService
{
    protected $clientEmail;
    protected $privateKey;
    protected $scopes;

//    public function __construct()
//    {
//        $serviceAccount = json_decode(file_get_contents(public_path('admin/challe-80e31-e3db5757efad.json')), true);
//        $this->clientEmail = $serviceAccount['client_email'];
//        $this->privateKey = $serviceAccount['private_key'];
//        $this->scopes = 'https://www.googleapis.com/auth/firebase.messaging'; // Replace with your actual scopes
//    }
//
//    public function getAccessToken()
//    {
//        $now = time();
//        $token = [
//            'iss' => $this->clientEmail,
//            'scope' => $this->scopes,
//            'aud' => 'https://oauth2.googleapis.com/token',
//            'iat' => $now,
//            'exp' => $now + 3600,
//        ];
//
//        $jwt = JWT::encode($token, $this->privateKey, 'RS256');
//
//        $response = Http::asForm()->post('https://oauth2.googleapis.com/token', [
//            'grant_type' => 'urn:ietf:params:oauth:grant-type:jwt-bearer',
//            'assertion' => $jwt,
//        ]);
//
//        if ($response->failed()) {
//            throw new \Exception('Failed to get access token: ' . $response->body());
//        }
//
////        dd($response->body());
//        return $response->json()['id_token'];
//    }


// This function is needed, because php doesn't have support for base64UrlEncoded strings
    function base64UrlEncode($text)
    {
        return str_replace(
            ['+', '/', '='],
            ['-', '_', ''],
            base64_encode($text)
        );
    }

    public function getAccessToken()
    {
// Read service account details
//                $serviceAccount = json_decode(file_get_contents(public_path('admin/challe-80e31-e3db5757efad.json')), true);

        $authConfigString = file_get_contents(config_path('firebase_key/challe-80e31-e3db5757efad.json'));

        // Parse service account details
        $authConfig = json_decode($authConfigString);

        // Read private key from service account details
        $secret = openssl_get_privatekey($authConfig->private_key);

        // Create the token header
        $header = json_encode([
            'typ' => 'JWT',
            'alg' => 'RS256'
        ]);

        // Get seconds since 1 January 1970
        $time = time();

        // Allow 1 minute time deviation between client en server (not sure if this is necessary)
        $start = $time - 60;
        $end = $start + 3600;

        // Create payload
        $payload = json_encode([
            "iss" => $authConfig->client_email,
            "scope" => "https://www.googleapis.com/auth/firebase.messaging",
            "aud" => "https://oauth2.googleapis.com/token",
            "exp" => $end,
            "iat" => $start
        ]);

        // Encode Header
        $base64UrlHeader = $this->base64UrlEncode($header);

        // Encode Payload
        $base64UrlPayload = $this->base64UrlEncode($payload);

        // Create Signature Hash
        $result = openssl_sign($base64UrlHeader . "." . $base64UrlPayload, $signature, $secret, OPENSSL_ALGO_SHA256);

        // Encode Signature to Base64Url String
        $base64UrlSignature = $this->base64UrlEncode($signature);

        // Create JWT
        $jwt = $base64UrlHeader . "." . $base64UrlPayload . "." . $base64UrlSignature;

        //-----Request token, with an http post request------
        $options = array('http' => array(
            'method' => 'POST',
            'content' => 'grant_type=urn:ietf:params:oauth:grant-type:jwt-bearer&assertion=' . $jwt,
            'header' => "Content-Type: application/x-www-form-urlencoded"
        ));
        $context = stream_context_create($options);
        $responseText = file_get_contents("https://oauth2.googleapis.com/token", false, $context);


        $response = json_decode($responseText);


        return $response->access_token;
    }
}
