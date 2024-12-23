<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WithdrawHistory extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function user()
    {
        return $this->belongsTo(User::class,'user_id');
    }

    public function bankDetail()
    {
        return $this->hasOne(WithdrawHistoryBank::class,'withdraw_history_id');
    }


    public function cryptoDetail()
    {
        return $this->hasOne(WithdrawHistoryCrypto::class,'withdraw_history_id');
    }
}
