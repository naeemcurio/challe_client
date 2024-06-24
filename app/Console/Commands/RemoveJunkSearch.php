<?php

namespace App\Console\Commands;

use App\Models\Price;
use App\Models\User;
use App\Models\WaitingLounge;
use Carbon\Carbon;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Auth;

class RemoveJunkSearch extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'remove:junk';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Remove Junk From Waiting Lounge in case of someone delete app or stop app';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        $waitingLounges = WaitingLounge::where('status',0)
            ->where('created_at','<=',Carbon::now()->format('Y-m-d'))
            ->get();

        foreach($waitingLounges as $waitingLounge)
        {
            $price = Price::find($waitingLounge->price_id);

            $waitingLounge->delete();

            $user = User::find($waitingLounge->user_id);

            if($user)
            {
                $user->deposit('wallet_1', $price->price);

            }


        }
    }
}
