<?php


function makeResponse($result, $message, $code = 200, $data = null, $token = null)
{
    if ($token) {
        return response()->json([
            'result' => $result,
            'message' => $message,
            'data' => $data,
            'token' => $token
        ], $code);
    } else {
        return response()->json([
            'result' => $result,
            'message' => $message,
            'data' => $data
        ], $code);
    }

}

function paginateResponse($data)
{
    return[
        'last_page' => $data->lastPage(),
        'current_page' => $data->currentPage(),
        'total_matching_record' => $data->total()
    ];

}




