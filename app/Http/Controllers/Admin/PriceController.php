<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\PriceStoreRequest;
use App\Http\Requests\Admin\PriceUpdateRequest;
use App\Models\Price;
use App\Models\User;
use App\Notifications\PopularPackCreateNotification;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Notification;
use Illuminate\View\View;

class PriceController extends Controller
{
    public function index(Request $request)
    {
        $prices = Price::all();

        return view('admin.price.listing', compact('prices'));
    }

    public function create(Request $request)
    {
        return view('admin.price.create');
    }

    public function store(PriceStoreRequest $request)
    {
        try{
            $price = Price::create($request->validated());
        }
        catch (\Exception $e)
        {
            return makeResponse('error',__('response_message.error_message_line').' '.__('challenge.price').' '.('response_message.record').': '.$e,Response::HTTP_INTERNAL_SERVER_ERROR);
        }

        $users = User::where('role_id',2)->get();

        Notification::send($users,new PopularPackCreateNotification($price));


        return makeResponse('success',  __('response_message.record_save'),  Response::HTTP_CREATED, $price);
    }

//    public function show(Request $request, Price $price): Response
//    {
//        return view('price.show', compact('price'));
//    }

    public function edit(Request $request, Price $price)
    {
        return view('admin.price.edit', compact('price'));
    }

    public function update(PriceUpdateRequest $request, Price $price)
    {
        $check = Price::where('price',$request->price)
            ->where('id','!=',$price->id)->first();

        if($check)
        {
            return makeResponse('response',__('challenge.price').' '.__('price.taken'),Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        try{
            $price->update($request->validated());
        }
        catch (\Exception $e)
        {
            return makeResponse('error',__('response_message.error_message_line').' '.__('challenge.price').' '.('response_message.record').': '.$e,Response::HTTP_INTERNAL_SERVER_ERROR);
        }


        return makeResponse('success',  trans('response_message.record_updated'),  Response::HTTP_NO_CONTENT);
    }

    public function destroy(Request $request, Price $price)
    {

        try{
            $price->delete();

            return makeResponse('success',  trans('response_message.record_updated'),  Response::HTTP_NO_CONTENT);
        }
        catch (\Exception $e)
        {
            return makeResponse('error',__('response_message.delete_record_error').': '.$e,Response::HTTP_INTERNAL_SERVER_ERROR);

        }
    }
}
