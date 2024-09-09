<?php

namespace App\Observers;

use App\Models\ReadyLounge;
use App\Models\WaitingLounge;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Log;

class WaitingLoungeObserver
{
    /**
     * Handle the WaitingLounge "created" event.
     *
     * @param  \App\Models\WaitingLounge  $waitingLounge
     * @return void
     */
    public function created(WaitingLounge $waitingLounge)
    {
        //
    }

    /**
     * Handle the WaitingLounge "updated" event.
     *
     * @param  \App\Models\WaitingLounge  $waitingLounge
     * @return void
     */
    public function updated(WaitingLounge $waitingLounge)
    {
        //
    }

    /**
     * Handle the WaitingLounge "deleted" event.
     *
     * @param  \App\Models\WaitingLounge  $waitingLounge
     * @return void
     */
    public function deleted(WaitingLounge $waitingLounge)
    {
        //
    }

    /**
     * Handle the WaitingLounge "restored" event.
     *
     * @param  \App\Models\WaitingLounge  $waitingLounge
     * @return void
     */
    public function restored(WaitingLounge $waitingLounge)
    {
        //
    }

    /**
     * Handle the WaitingLounge "force deleted" event.
     *
     * @param  \App\Models\WaitingLounge  $waitingLounge
     * @return void
     */
    public function forceDeleted(WaitingLounge $waitingLounge)
    {
        //
    }

    public function deleting(WaitingLounge $waitingLounge)
    {
//        Log::info('in deleting observer');
        sleep(2);

        // Check if the ReadyLounge exists for this WaitingLounge
        $readyLounge = ReadyLounge::where('waiting_lounge_id', $waitingLounge->id)->first();

        // If a ReadyLounge record exists, prevent the deletion
        if ($readyLounge) {
            return makeResponse('error', __('response_message.cancel_already_matched'), Response::HTTP_ALREADY_REPORTED);
        }

        if($waitingLounge->status == 1)
        {
            return makeResponse('error', __('response_message.cancel_already_matched'), Response::HTTP_ALREADY_REPORTED);
        }






        // Optionally handle other logic before allowing deletion
        // e.g., refunds, event emissions, etc.

        // If no ReadyLounge exists, the deletion will proceed.
    }
}
