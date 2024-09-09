<?php

namespace App\Observers;

use App\Models\Challenge;
use App\Models\ChallengeAttempt;
use App\Models\ReadyLounge;
use App\Models\WaitingLounge;
use App\Services\Api\ChallengeService;
use App\Traits\SocketEventTrigger;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;

class FindChallengeObserver
{
    use SocketEventTrigger;
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
    public function deleting(ReadyLounge $readyLounge)
    {

        $wait = WaitingLounge::where('id',$readyLounge->waiting_lounge_id)->first();

        $attempt =  ChallengeAttempt::where('ready_lounge_id',$readyLounge->id)->delete();

        if(Auth::user()->id == $readyLounge->user_1)
        {
            $title = __('response_message.unexpected_reset_title');
            $message = __('response_message.unexpected_reset_body');

            $sendEvent = $this->eventEmitForSearch( $readyLounge->user_2,$title,$message,$waitingLoungeID);

            $wait = WaitingLounge::create([
                'latitude' => null,
                'longitude' => null,
                'user_id' => $readyLounge->user_2,
                'city' => null,
                'price_id' => $wait->price_id
            ]);

        }
        elseif(Auth::user()->id == $readyLounge->user_2){
            $title = __('response_message.unexpected_reset_title');
            $message = __('response_message.unexpected_reset_body');

            $sendEvent = $this->eventEmitForSearch( $readyLounge->user_1,$title,$message,$waitingLoungeID);

            $wait = WaitingLounge::create([
                'latitude' => null,
                'longitude' => null,
                'user_id' => $readyLounge->user_2,
                'city' => null,
                'price_id' => $wait->price_id
            ]);
        }




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
