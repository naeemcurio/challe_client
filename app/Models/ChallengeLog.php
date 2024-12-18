<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ChallengeLog extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function waitingLounge()
    {
        return $this->belongsTo(WaitingLounge::class,'waiting_lounge_id');
    }
}
