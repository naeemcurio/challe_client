<?php

namespace App\Console\Commands;

use App\Models\ReadyLounge;
use App\Models\User;
use App\Models\WaitingLounge;
use Carbon\Carbon;
use Illuminate\Console\Command;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use PHPSocketIO\SocketIO;
use Workerman\Worker;

class SocketConfiguration extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'start';


    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Start the socket server';

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        try {
            $io = new SocketIO('8081');

            $io->on('connection', function ($socket) use ($io) {
                Log::info('new user connect');
                $socket->on('statusEvent', function ($data) use ($io) {
                    Log::info($data);
                    Log::info("user_id is: " . $data['user_id']);

                    $channelName = null;
                    if ($data['notification_type'] == 0) {
                        $channelName = $data['user_id'] . '-wait-channel';
                    } elseif ($data['notification_type'] == 1) {
                        $channelName = $data['user_id'] . '-ready-channel';
                    } elseif ($data['notification_type'] == 2) {
                        $channelName = $data['user_id'] . '-other-user-is-ready-channel';
                    } elseif ($data['notification_type'] == 4) {
                        $channelName = $data['user_id'] . '-record-submit-channel';
                    }

                    Log::info('at end');

                    $io->emit($channelName, [
                        'title' => $data['title'],
                        'message' => $data['message'],
                        'data' => $data['data']
                    ]);


                    Log::info('done');
                });

//                $socket->on('wait-event', function ($data) use ($io) {
//
//                    if (!isset($data['waiting_lounge_id'])) {
//                        $io->emit($data['user_id'] . '-error', [
//                            'result' => 'error',
//                            'message' => 'Waiting Lounge ID Not Found',
//                            'data' => null
//                        ]);
//                    }
//
//                    Auth::loginUsingId($data['user_id']);
//
//                    $findRecord = WaitingLounge::where('id', $data->waiting_lounge_id)
//                        ->where('user_id', Auth::user()->id)->first();
//
//                    if ($findRecord) {
//                        if ($findRecord->status == 1) {
//                            $readyLounge = ReadyLounge::where(function (Builder $query) {
//                                $query->where('user_1', Auth::user()->id)
//                                    ->where('user1_status', 0);
//                            })
//                                ->orWhere(function (Builder $query) {
//                                    $query->where('user_2', Auth::user()->id)
//                                        ->where('user2_status', 0);
//                                })
//                                ->first();
//
//                            if ($readyLounge) {
//
//                                if ($readyLounge->user_1 == Auth::user()->id) {
//                                    $otherUser = User::find($readyLounge->user_2);
//                                } elseif ($readyLounge->user_2 == Auth::user()->id) {
//                                    $otherUser = User::find($readyLounge->user_1);
//                                }
//
//                                $otherUserData = [
//                                    'id' => $otherUser->id,
//                                    'image' => $otherUser->image,
//                                    'full_name' => $otherUser->full_name,
//                                    'nick_name' => $otherUser->nick_name,
//                                    'phone_number' => $otherUser->phone_number,
//                                    'email' => $otherUser->email
//                                ];
//
//                                $createdAt = Carbon::parse($readyLounge->created_at);
//                                $waitingTime = $readyLounge->waiting_time; // in seconds
//
//                                // Calculate the expiration time
//                                $expirationTime = $createdAt->copy()->addSeconds($waitingTime);
//
//                                // Get the current time
//                                $currentTime = Carbon::now();
//
//                                // Calculate the remaining time in seconds
//                                if ($currentTime->greaterThanOrEqualTo($expirationTime)) {
//                                    // If the current time is past the expiration time, set timeLeft to 0
//                                    $timeLeft = 0;
//                                } else {
//                                    // Otherwise, calculate the remaining time
//                                    $timeLeft = $currentTime->diffInSeconds($expirationTime, false);
//                                }
//
//                                $response =
//                                    [
//                                        'status' => 1,
//                                        'ready_lounge_id' => $readyLounge->id,
//                                        'otherUserData' => $otherUserData,
//                                        'price' => $readyLounge->waitingLounge->price,
//                                        'waiting_time' => $readyLounge->waiting_time,
//                                        'created_at' => $createdAt->format('Y-m-d H:i:s'),
//                                        'time_left' => $timeLeft < 0 ? 0:$timeLeft
//                                    ];
//
//                                $io->emit($data['user_id'] . '-wait-response',
//                                    $response
//                                );
//
//                                $io->emit($otherUserData->id . '-wait-response',
//                                    $response
//                                );
//
//                            }
//                        }
//                    } else {
//
//                        $io->emit($data['user_id'] . '-wait-response',
//                            [
//                                'status' => 0,
//                                'waiting_lounge_id' => $findRecord->id,
//                                'price' => $findRecord->price
//                            ]
//                        );
//
//                    }
//
//                });
            });

            Worker::runAll();

        } catch (\Exception $e) {
            Log::emergency($e->getMessage());
        }
    }
}
