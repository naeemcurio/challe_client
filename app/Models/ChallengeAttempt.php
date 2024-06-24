<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ChallengeAttempt extends Model
{
    use HasFactory;

    protected $guarded = [];


    public function challenge()
    {
        return $this->belongsTo(Challenge::class,'challenge_id');
    }

    public function challenger1()
    {
        return $this->belongsTo(User::class,'challenger_1');
    }

    public function challenger2()
    {
        return $this->belongsTo(User::class,'challenger_2');
    }

    public function challengeRecords()
    {
        return $this->hasMany(ChallengeRecordSubmission::class,'challenge_attempt_id');
    }

    public function challengeResults()
    {
        return $this->hasMany(ChallengeResult::class,'challenge_attempt_id');
    }


    public function winner()
    {
        return $this->belongsTo(User::class,'winner_id');
    }

    public function ratings()
    {
        return $this->hasMany(ChallengeRating::class,'challenge_attempt_id');
    }


    public function readyLounge()
    {
        return $this->belongsTo(ReadyLounge::class,'ready_lounge_id');
    }

}
