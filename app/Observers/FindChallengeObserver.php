<?php

namespace App\Observers;

use App\Models\Challenge;
use App\Models\ChallengeAttempt;
use App\Models\ReadyLounge;
use App\Services\Api\ChallengeService;
use Illuminate\Http\Response;

class FindChallengeObserver
{
    /**
     * Handle the ReadyLounge "created" event.
     *
     * @param  \App\Models\ReadyLounge  $readyLounge
     * @return void
     */
    public function created(ReadyLounge $readyLounge)
    {

        $challengeAttempt = ChallengeAttempt::where('ready_lounge_id', $readyLounge->id)->first();

        if (!$challengeAttempt) {
            $challenge = Challenge::where('price_id', $readyLounge->waitingLounge->price_id)
                ->where('status', 1)
                ->inRandomOrder()->first();

            $challengeService =  new ChallengeService();

            $challengeAttempt = $challengeService->saveRecordInChallengeAttempt($challenge, $readyLounge);
        }

    }

    /**
     * Handle the ReadyLounge "updated" event.
     *
     * @param  \App\Models\ReadyLounge  $readyLounge
     * @return void
     */
    public function updated(ReadyLounge $readyLounge)
    {
        //
    }

    /**
     * Handle the ReadyLounge "deleted" event.
     *
     * @param  \App\Models\ReadyLounge  $readyLounge
     * @return void
     */
    public function deleted(ReadyLounge $readyLounge)
    {
        //
    }

    /**
     * Handle the ReadyLounge "restored" event.
     *
     * @param  \App\Models\ReadyLounge  $readyLounge
     * @return void
     */
    public function restored(ReadyLounge $readyLounge)
    {
        //
    }

    /**
     * Handle the ReadyLounge "force deleted" event.
     *
     * @param  \App\Models\ReadyLounge  $readyLounge
     * @return void
     */
    public function forceDeleted(ReadyLounge $readyLounge)
    {
        //
    }
}
