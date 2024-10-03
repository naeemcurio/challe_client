<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class PopularPackCreateNotification extends Notification  implements ShouldQueue
{
    use Queueable;

    public $pack;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($pack)
    {
        $this->pack =  $pack;
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
            'id' => $this->pack->id,
            'notification' => 'notification_message.new_category_challenge',
            'message1' => 'notification_message.new',
            'message2' => 'notification_message.available',
            'price' => $this->pack->price,
            'title' => $this->pack->title,
            'type' => 'pack_added',
        ];
    }
}
