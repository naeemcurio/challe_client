<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Challenge extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
//        'title',
        'description',
        'price',
        'image',
        'video',
        'created_by',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'id' => 'integer',
        'price' => 'double',
        'created_by' => 'integer',
    ];

    public function user(): BelongsTo
    {
        return $this->belongsTo(User::class,'created_by');
    }

    public function challengeAttempt()
    {
        return $this->hasMany(ChallengeAttempt::class,'challenge_id');
    }

    public static function calculateWinningAmount($challenge)
    {
        $getPrice = Price::find($challenge->price_id);

        if(!$getPrice)
        {
            $price = $challenge->price * 2;
        }
        else{
            $price = $getPrice->price * 2;
        }

        $commission = Setting::first();
//        $sumOfCommission = 0;
//        if($commission)
//        {
//            $sumOfCommission = $commission->company_commission + $commission->challenge_creator_commission;
//        }
//
//        $calculateAmount = ($price*$sumOfCommission)/100;
//
//        $winningPrice = $price - $calculateAmount;
//
//        return number_format($winningPrice, 2);

        $companyCommission = ($price*$commission->company_commission)/100;
        $challengeCreatorCommission = ($price*$commission->challenge_creator_commission)/100;

        $winningPrice = $price - $companyCommission - $challengeCreatorCommission;

        return [
            'winning_price' => number_format($winningPrice, 2, '.', ''),
            'company_commission' => number_format($companyCommission, 5),
            'challenge_creator_Commission' => $challengeCreatorCommission,
        ];

    }

    public function priceRecord()
    {
        return $this->belongsTo(Price::class,'price_id');
    }


    public function completedChallengeAttempt()
    {
        return $this->hasMany(ChallengeAttempt::class,'challenge_id')
            ->whereNotNull('winner_id');
    }


}
