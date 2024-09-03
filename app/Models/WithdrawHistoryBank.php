<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class WithdrawHistoryBank extends Model
{
    use HasFactory;

    protected $guarded = [];

    protected $table = 'withdraw_history_banks';

}
