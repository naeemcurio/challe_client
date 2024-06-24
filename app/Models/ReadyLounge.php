<?php

namespace App\Models;

use App\Observers\FindChallengeObserver;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Attributes\ObservedBy;

#[ObservedBy([FindChallengeObserver::class])]
class ReadyLounge extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function waitingLounge()
    {
        return $this->belongsTo(WaitingLounge::class,'waiting_lounge_id');
    }

    public function user1()
    {
        return $this->belongsTo(User::class,'user_1');
    }

    public function user2()
    {
        return $this->belongsTo(User::class,'user_2');
    }



}
