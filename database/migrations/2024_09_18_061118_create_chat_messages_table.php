<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('chat_messages', function (Blueprint $table) {
            $table->id();

            $table->foreignId('chat_room_id')
                ->constrained('chat_rooms')->cascadeOnDelete();

            $table->foreignId('sender_id')->constrained('users')
                ->cascadeOnDelete();
            $table->foreignId('receiver_id')->constrained('users')
                ->cascadeOnDelete();

            $table->string('message');

            $table->boolean('is_read')
                ->comment('0=unread,1=read')
                ->default(0);

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('chat_messages');
    }
};
