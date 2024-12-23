<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ChallengeRecordSubmission extends Model
{
    use HasFactory;

    protected $guarded = [];

    protected $table = 'challenger_record_submissions';

    public function challenger()
    {
        return $this->belongsTo(User::class,'challenger_id');
    }

    public function challengeResult()
    {
        return $this->hasOne(ChallengeResult::class,'challenger_record_submission_id');
    }

    public function challengeURL()
    {
        return $this->hasMany(ChallengeURLSubmission::class,'record_submission_id');
    }

    public function challengeAttempt()
    {
        return $this->belongsTo(ChallengeAttempt::class,'challenge_attempt_id');
    }

    protected $casts = [
        'created_at' => 'datetime:Y-m-d H:i:s.u',
    ];
}
