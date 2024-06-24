<?php

namespace App\Services\Admin;


use App\Helper\ImageUploadHelper;
use App\Models\Challenge;
use App\Models\Price;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;

ini_set('post_max_size', '2000M');
ini_set('upload_max_filesize', '2000M');

class ChallengeService
{


    public function saveRecordInDB($request, $challenge)
    {
        if ($request->image) {
            try {
                $image = ImageUploadHelper::uploadImage($request->image, 'upload/image/challenge/');
                $challenge->image = $image;
            } catch (\Exception $e) {
                return makeResponse('error', 'Error in User Profile Image: ' . $e, Response::HTTP_INTERNAL_SERVER_ERROR);
            }
        }

        $getPrice = Price::find($request->price);
        if (!$request->createdBy) {
            $challenge->created_by = Auth::user()->id;
        } else {
            $challenge->created_by = $request->createdBy;
        }

        if ($request->video) {
            $file = $request->file('video');
            if (!empty($file) && $file != null) {
                $path = $request->file('video')->move(
                    public_path('uploads/videos'), // Absolute path to the public directory
                    $request->file('video')->getClientOriginalName() // Original file name
                );

                $challenge->video = 'uploads/videos/' . $request->file('video')->getClientOriginalName(); // Store relative path for public access
            }
        }



        $challenge->price_id = $request->price;
        $challenge->price = $getPrice->price;
        if($request->status)
        {
            $challenge->status = $request->status;
        }
        $saveRecord = $challenge->fill(collect($request->validated())->except('image', 'createdBy', 'video_url', 'price','video')->all());
        $saveRecord->save();

        return $saveRecord;
    }
}
