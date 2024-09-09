<?php


namespace App\Services\PaymentGateway;


use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Stripe\Customer;
use Stripe\Stripe;
use Illuminate\Http\Response;

class StripeService
{
    public $stripe;

    public function __construct()
    {
        $this->stripe = new \Stripe\StripeClient(
            env('STRIPE_SECRET')
        );
        Stripe::setApiKey(env('STRIPE_SECRET'));

    }

    public function createToken($number, $expiry_month, $expiry_year, $cvc)
    {
        try {
            $token = $this->stripe->tokens->create([
                'card' => [
                    'number' => $number,
                    'exp_month' => $expiry_month,
                    'exp_year' => $expiry_year,
                    'cvc' => $cvc,
                ],
            ]);


            $response = ['type' => 'success', 'data' => $token->id];
            return $response;
        } catch (\Stripe\Error\InvalidRequest $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (\Stripe\Error\Authentication $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (\Stripe\Error\ApiConnection $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (\Stripe\Exception\CardException $e) {
            $response = ['type' => 'error', 'message' => $e->getError()->message, 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (Exception $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        }

    }

    public function create_customer($stripe_token)
    {
        $stripeEmail = Auth::user()->email;
        $customerId = Customer::create([
            'email' => $stripeEmail,
            'source' => $stripe_token,
        ]);


        return $customerId->id;
    }

    public function createSubscription($customer)
    {
        try {

            $subscription = \Stripe\Subscription::create([
                'customer' => $customer,
                'items' => [
                    ['price' => 'price_1O3IjdKxgIbBTP6d3553Eu5o'],
                ],

//                'trial_period_days' => 3


            ]);

            return $subscription->id;

        } catch (\Stripe\Error\InvalidRequest $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (\Stripe\Error\Authentication $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (\Stripe\Error\ApiConnection $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (\Stripe\Exception\CardException $e) {
            $response = ['type' => 'error', 'message' => $e->getError()->message, 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (Exception $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        }

    }

    public function cancelSubscription($subscriptionID)
    {
        try {
            $cancelSubscription = $this->stripe->subscriptions->cancel(
                $subscriptionID,
                []
            );

            return $cancelSubscription;

        } catch (\Stripe\Error\InvalidRequest $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (\Stripe\Error\Authentication $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (\Stripe\Error\ApiConnection $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (\Stripe\Exception\CardException $e) {
            $response = ['type' => 'error', 'message' => $e->getError()->message, 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (Exception $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        }


    }

    public function createPaymentMethod($request)
    {
        try {
            $paymentMethods = $this->stripe->paymentMethods->create([
                'type' => 'card',
                'card' => [
//                    'number' => $request->card_number,
                    'number' => $request['card_number'],
//                    'exp_month' => $request->expiry_month,
                    'exp_month' => $request['expiry_month'],
                    'exp_year' => $request['expiry_year'],
//                    'exp_year' => $request->expiry_year,
//                    'cvc' => $request->cvc,
                    'cvc' => $request['cvv'],
                ],
            ]);

            return $paymentMethods;
        } catch (\Stripe\Error\InvalidRequest $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (\Stripe\Error\Authentication $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (\Stripe\Error\ApiConnection $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (\Stripe\Exception\CardException $e) {
            $response = ['type' => 'error', 'message' => $e->getError()->message, 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (Exception $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        }


    }

    public function create_customer_without_token()
    {
        try {
            $customer = $this->stripe->customers->create([
                'name' => Auth::user()->full_name,
                'email' => Auth::user()->email,
            ]);


            return $customer->id;
        } catch (\Stripe\Error\InvalidRequest $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (\Stripe\Error\Authentication $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (\Stripe\Error\ApiConnection $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (\Stripe\Exception\CardException $e) {
            $response = ['type' => 'error', 'message' => $e->getError()->message, 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (Exception $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        }
    }

    public function attachPaymentMethod($paymentMethod)
    {
        try {
            $attachCard = $this->stripe->paymentMethods->attach(
                $paymentMethod,
                ['customer' => Auth::user()->customer_id]
            );

            return $attachCard;
        } catch (\Stripe\Error\InvalidRequest $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (\Stripe\Error\Authentication $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (\Stripe\Error\ApiConnection $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (\Stripe\Exception\CardException $e) {
            $response = ['type' => 'error', 'message' => $e->getError()->message, 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (Exception $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        }

    }

    public function updateCustomer($paymentMethod)
    {
        try {
            $customer = $this->stripe->customers->update(
                Auth::user()->customer_id,
                ['invoice_settings' => [
                    'default_payment_method' => $paymentMethod]]
            );

            return $customer;
        } catch (\Stripe\Error\InvalidRequest $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (\Stripe\Error\Authentication $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (\Stripe\Error\ApiConnection $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (\Stripe\Exception\CardException $e) {
            $response = ['type' => 'error', 'message' => $e->getError()->message, 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (Exception $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        }
    }

    public function updateSubscription($subcription_id, $autorenewal)
    {
        try {

            $this->stripe->subscriptions->update(
                $subcription_id,
                ['cancel_at_period_end' => $autorenewal == 1 ? 'false' : 'true']
            );
        } catch (\Stripe\Error\InvalidRequest $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (\Stripe\Error\Authentication $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (\Stripe\Error\ApiConnection $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (\Stripe\Exception\CardException $e) {
            $response = ['type' => 'error', 'message' => $e->getError()->message, 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        } catch (Exception $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage(), 'code' => Response::HTTP_INTERNAL_SERVER_ERROR];
            return $response;
        }
    }

    public function charge($amount, $token = null)
    {
        try {

            $customerID = Auth::user()->stripe_customer_id;

//            if (!$amount) {
//                $amount = $bookingRecord->actual_fare;
//            }


            $charge = \Stripe\Charge::create([
                'amount' => $amount * 100,
                'currency' => 'usd',
                'description' => 'Customer Charge For Challenge Attempt Price',
                "source" => $token,
//                'customer' => $customerID,
            ]);

            return $charge->id;

        } catch (\Stripe\Error\InvalidRequest $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage()];
            return $response;
        } catch (\Stripe\Error\Authentication $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage()];
            return $response;
        } catch (\Stripe\Error\ApiConnection $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage()];
            return $response;
        } catch (\Stripe\Exception\CardException $e) {
            $response = ['type' => 'error', 'message' => $e->getError()->message];
            return $response;
        } catch (Exception $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage()];
            return $response;
        }

    }

    public function createConnectAccountLink($request = null)
    {
        try {
            if (Auth::check()) {
                $accountID = Auth::user()->stripe_connect_id;
            } else {
                $accountID = $request->accountID;
            }
            $accountLink = $this->stripe->accountLinks->create([
                'account' => $accountID,
                'refresh_url' => route('refreshAccountLink', ['accountID' => $accountID]),
                'return_url' => route('adminLogin') . '?status=200',
                'type' => 'account_onboarding',
            ]);

            return ['type' => 'success', 'data' => $accountLink];
        } catch (\Stripe\Error\InvalidRequest $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage()];
            return $response;
        } catch (\Stripe\Error\Authentication $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage()];
            return $response;
        } catch (\Stripe\Error\ApiConnection $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage()];
            return $response;
        } catch (\Stripe\Exception\CardException $e) {
            $response = ['type' => 'error', 'message' => $e->getError()->message];
            return $response;
        } catch (Exception $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage()];
            return $response;
        }
    }

    public function createConnectAccount($request)
    {

        if ($request->email) {
            $email = $request->email;
        } else {
            $email = Auth::user()->email;
        }

        try {
            $accountLink = $this->stripe->accounts->create([
                'type' => 'express',
                'country' => 'US',
                'email' => $email
            ]);

            return ['type' => 'success', 'data' => $accountLink->id];

        } catch (\Stripe\Error\InvalidRequest $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage()];
            return $response;
        } catch (\Stripe\Error\Authentication $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage()];
            return $response;
        } catch (\Stripe\Error\ApiConnection $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage()];
            return $response;
        } catch (\Stripe\Exception\CardException $e) {
            $response = ['type' => 'error', 'message' => $e->getError()->message];
            return $response;
        } catch (Exception $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage()];
            return $response;
        }
    }

    public function getBalance()
    {
        try {
            $balance = $this->stripe->balance->retrieve([]);


            foreach ($balance->available as $available) {
                $availableAmount = $available->amount / 100;
            }

            return ['type' => 'success', 'data' => $availableAmount];

        } catch (\Stripe\Error\InvalidRequest $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage()];
            return $response;
        } catch (\Stripe\Error\Authentication $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage()];
            return $response;
        } catch (\Stripe\Error\ApiConnection $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage()];
            return $response;
        } catch (\Stripe\Exception\CardException $e) {
            $response = ['type' => 'error', 'message' => $e->getError()->message];
            return $response;
        } catch (Exception $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage()];
            return $response;
        }
    }

    public function transferAmount($amount, $accountID)
    {
        try {
            $data = $this->stripe->transfers->create([
                'amount' => $amount * 100,
                'currency' => 'usd',
                'destination' => $accountID,
            ]);

            return ['type' => 'success', 'data' => $data->id];
        } catch (\Stripe\Error\InvalidRequest $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage()];
            return $response;
        } catch (\Stripe\Error\Authentication $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage()];
            return $response;
        } catch (\Stripe\Error\ApiConnection $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage()];
            return $response;
        } catch (\Stripe\Exception\CardException $e) {
            $response = ['type' => 'error', 'message' => $e->getError()->message];
            return $response;
        } catch (Exception $e) {
            $response = ['type' => 'error', 'message' => $e->getMessage()];
            return $response;
        }
    }

}
