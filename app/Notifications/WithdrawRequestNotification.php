<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class WithdrawRequestNotification extends Notification
{
    use Queueable;

    private $withDrawalRecord;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($withDrawalRecord)
    {
        $this->withDrawalRecord = $withDrawalRecord;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['database'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)
                    ->line('The introduction to the notification.')
                    ->action('Notification Action', url('/'))
                    ->line('Thank you for using our application!');
    }

    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            'notification' => "title.withdraw_request",
            'id' => $this->withDrawalRecord->id,
            'message' => "notification_message.withdraw_request",
            'amount' => $this->withDrawalRecord->amount,
            'user_id' => $this->withDrawalRecord->user_id,
            'type' => 'withdraw_request'
        ];
    }
}
