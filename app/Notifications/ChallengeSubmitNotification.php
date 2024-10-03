<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class ChallengeSubmitNotification extends Notification
{
    use Queueable;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    private $challengeAttempt;
    private $currentUserId;
    public function __construct($challengeAttempt,$currentUserId)
    {
        $this->challengeAttempt = $challengeAttempt;
        $this->currentUserId = $currentUserId;
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
            'notification' => "title.challenge_record_submit",
            'id' => $this->challengeAttempt->id,
            'message' => "notification_message.challenge_record_submit_message",
            'challenge_id' => $this->challengeAttempt->challenge_id,
            'user_id' => $this->currentUserId,
            'type' => 'challenge_record_submit'
        ];
    }
}
