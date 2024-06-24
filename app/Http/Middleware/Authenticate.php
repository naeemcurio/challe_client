<?php

namespace App\Http\Middleware;

use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class Authenticate extends Middleware
{
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     */
    protected function redirectTo(Request $request)
    {
        if(!$request->expectsJson())
        {
            return makeResponse('error',__('response_message.invalid_token'),Response::HTTP_UNAUTHORIZED);
        }
        else{
            return $request->expectsJson() ? null : route('login');
        }

    }
}
