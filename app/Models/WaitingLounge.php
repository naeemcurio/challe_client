<?php

namespace App\Models;

use App\Observers\WaitingLoungeObserver;
use Illuminate\Database\Eloquent\Attributes\ObservedBy;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

//#[ObservedBy([WaitingLoungeObserver::class])]
class WaitingLounge extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function readyLounge()
    {
        return $this->hasOne(ReadyLounge::class,'waiting_lounge_id');
    }

    public function price()
    {
        return $this->belongsTo(Price::class,'price_id');
    }
}
