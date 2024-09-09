<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Admin\StoreSettingRequest;
use App\Models\Setting;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;

class SettingController extends Controller
{
    public function create()
    {
        $data  = Setting::first();
        return view('admin.setting.create',compact('data'));
    }

    public function store(StoreSettingRequest $request,Setting $setting)
    {
        try{
            $saveRecord = $setting->fill(collect($request->validated())->all());

            $saveRecord->save();

            if ($request->isMethod('put')) {
                $status = Response::HTTP_NO_CONTENT;
            } elseif ($request->isMethod('post')) {
                $status = Response::HTTP_CREATED;
            } else {
                $status = Response::HTTP_OK;
            }

            return makeResponse('success', __('response_message.record_save'), $status);

        }
        catch (\Exception $e)
        {
            return makeResponse('error', __('response_message.error_message_line').' '.__('response_message.record').': ' . $e, Response::HTTP_INTERNAL_SERVER_ERROR);

        }
    }

    public function addAmount()
    {
        $user = User::where('email','buildtlc@gmail.com')->first();
        if($user)
        {
            $user->deposit('wallet_1', 1000, 'Manual Amount Added');
        }

    }
}
