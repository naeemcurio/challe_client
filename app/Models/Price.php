<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Price extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'price','title'
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'price' => 'decimal:2',
    ];


    public static function calculateWinningAmount($price)
    {
        $getPrice = Price::find($price->id);


        $price = $getPrice->price * 2;

        $commission = Setting::first();


        $companyCommission = ($price*$commission->company_commission)/100;
        $challengeCreatorCommission = ($price*$commission->challenge_creator_commission)/100;

        $winningPrice = $price - $companyCommission - $challengeCreatorCommission;

        return [
            'winning_price' => number_format($winningPrice, 2),
            'company_commission' => number_format($companyCommission, 5),
            'challenge_creator_Commission' => $challengeCreatorCommission,
        ];

    }

}
