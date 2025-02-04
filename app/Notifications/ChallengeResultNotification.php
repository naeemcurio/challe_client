<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class ChallengeResultNotification extends Notification
{
    use Queueable;

    private $challengeAttemptID;
    private $title;
    private $message;
    private $type;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($challengeAttemptID,$title,$message,$type)
    {
        $this->challengeAttemptID = $challengeAttemptID;
        $this->title = $title;
        $this->message = $message;
        $this->type = $type;

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
            'notification' => $this->title,
            'attempt_id' => $this->challengeAttemptID,
            'message' => $this->message,
            'type' => $this->type
        ];
    }
}
