<?php

namespace App\Exceptions;

use Illuminate\Auth\AuthenticationException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Throwable;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Session\TokenMismatchException;

class Handler extends ExceptionHandler
{
    /**
     * The list of the inputs that are never flashed to the session on validation exceptions.
     *
     * @var array<int, string>
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     *
     * @return void
     */
    public function register()
    {
//        $this->reportable(function (Throwable $e) {
//            //
//        });

        $this->renderable(function (NotFoundHttpException $e,$request){
            if($request->is('api/*')){
                return makeResponse('error','Route Not Found',404);
            }
        });
    }

    protected function unauthenticated($request, AuthenticationException $exception)
    {
        if ($request->expectsJson()) {

            return makeResponse('error',$exception->getMessage(),Response::HTTP_UNAUTHORIZED);
        }
    }

    public function report(Throwable $exception)
    {
        parent::report($exception);
//        return makeResponse('error',$exception->getMessage(),404);

    }

    public function render($request, Throwable $exception)
    {

        if ($exception instanceof ModelNotFoundException) {

            if ($request->expectsJson()) {
                // Custom handling for ModelNotFoundException
                return makeResponse('error','Model not Found',Response::HTTP_NOT_FOUND);
            }
            else{
                // Custom handling for ModelNotFoundException
                return redirect()->back()->with('error',trans('response_message.record_not_found'));

            }
        }

         if ($exception instanceof TokenMismatchException) {

             $routeName = Request()->route()->getName();

             if($routeName == 'loginUser')
             {
                $user = Auth::user();


                 if($user)
                 {
                     return makeResponse('error','You are already a login user. Refresh a page');
                 }

             }

             // Redirect the user back to the previous page.
             else{
                 return makeResponse('error','CSRF token mismatch.');

             }


         }



        return parent::render($request, $exception);
    }
}
