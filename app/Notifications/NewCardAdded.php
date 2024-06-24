<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class NewCardAdded extends Notification
{
    use Queueable;

    private $cardRecord;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($cardRecord)
    {
        $this->cardRecord = $cardRecord;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param mixed $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['database'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param mixed $notifiable
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
     * @param mixed $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            'notification' => "notification_message.card_linked",
            'id' => $this->cardRecord->id,
            'message' => "notification_message.card_linked'",
            'card_id' => $this->cardRecord->card_id,
            'last_4_digit' => $this->cardRecord->last4,
            'redirect_url' => $this->cardRecord->redirect_url,
            'card_brand' => $this->cardRecord->brand,
            'type' => 'card_added'
        ];
    }
}
