<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserPayment extends Model
{
    use HasFactory;

    protected $guarded = [];

    public function price()
    {
        return $this->belongsTo(Price::class,'price_id');
    }
}
