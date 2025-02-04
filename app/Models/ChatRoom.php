<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ChatRoom extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function user1()
    {
        return $this->belongsTo(User::class,'user_1');
    }

    public function user2()
    {
        return $this->belongsTo(User::class,'user_2');
    }
}
