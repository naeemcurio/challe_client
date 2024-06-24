<?php

namespace App\Http\Controllers\Admin;

use App\Helper\ImageUploadHelper;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Http\Requests\Admin\StoreUserRequest;
use App\Http\Requests\Admin\UpdateUserRequest;
use App\Traits\UserTrait;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Route;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = User::where('role_id',2)->get();
        return view('admin.user.listing',compact('users'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('admin.user.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreUserRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreUserRequest $request)
    {
        DB::beginTransaction();
        try{
            $user = new User();
            if ($request->image) {
                try {
                    $image = ImageUploadHelper::uploadImage($request->image, 'upload/image/user/');
                    $user->image = $image;
                } catch (\Exception $e) {
                    return makeResponse('error', __('response_message.image_save_error').': ' . $e, Response::HTTP_INTERNAL_SERVER_ERROR);
                }
            }
            $user->role_id = 2;
            $user->password = Hash::make($request->password);
            $user->date_of_birth = Carbon::parse($user->date_of_birth)->format('Y-m-d');

            $user->fill($request->except(['image','password','date_of_birth']));

            $user->save();


            DB::commit();

            if ($request->isMethod('put')) {
                $status = Response::HTTP_NO_CONTENT;
            } elseif ($request->isMethod('post')) {
                $status = Response::HTTP_CREATED;
            } else {
                $status = Response::HTTP_OK;
            }

            return makeResponse('success',  __('response_message.record_save'), $status, $user);

        }
        catch (\Exception $e)
        {
            DB::rollBack();

            return makeResponse('error',__('response_message.save_user_error').': '.$e,Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function show(User $user)
    {

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function edit(User $user)
    {
        return view('admin.user.edit',compact('user'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateUserRequest  $request
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateUserRequest $request, User $user)
    {
        $checkEmail = User::where('email',$request->email)
            ->where('id','!=',$user->id)->first();

        if($checkEmail)
        {
            return makeResponse('error',__('response_message.unique_email'),Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        $checkPhone = User::where('phone_number',$request->email)
            ->where('id','!=',$user->id)->first();

        if($checkPhone)
        {
            return makeResponse('error',__('validation.unique_phone_number'),Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        DB::beginTransaction();
        try{
            if ($request->image) {
                try {
                    $image = ImageUploadHelper::uploadImage($request->image, 'upload/image/user/');
                    $user->image = $image;
                } catch (\Exception $e) {
                    return makeResponse('error', __('response_message.image_save_error').': ' . $e, Response::HTTP_INTERNAL_SERVER_ERROR);
                }
            }
            $user->role_id = 2;

            if($request->password)
            {
                $user->password = Hash::make($request->password);
            }


            $user->fill($request->except(['image','password']));


            $user->save();

            DB::commit();

            if ($request->isMethod('put')) {
                $status = Response::HTTP_NO_CONTENT;
            } elseif ($request->isMethod('post')) {
                $status = Response::HTTP_CREATED;
            } else {
                $status = Response::HTTP_OK;
            }

            return makeResponse('success', trans('response_message.record_update'), $status, $user);

        }
        catch (\Exception $e)
        {
            DB::rollBack();
            return makeResponse('error',__('response_message.save_user_error').': '.$e,Response::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\User  $user
     * @return \Illuminate\Http\Response
     */
    public function destroy(User $user)
    {
        try{
            $user->delete();
            return makeResponse('success', __('response_message.record_delete_success'), Response::HTTP_NO_CONTENT);

        }
        catch (\Exception $e)
        {
            return makeResponse('error',__('response_message.delete_record_error').': '.$e,Response::HTTP_INTERNAL_SERVER_ERROR);

        }
    }
}
