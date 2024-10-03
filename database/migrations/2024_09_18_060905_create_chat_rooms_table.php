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
        Schema::create('chat_rooms', function (Blueprint $table) {
            $table->id();

            $table->foreignId('user_1')->constrained('users')
                ->cascadeOnDelete();
            $table->foreignId('user_2')->constrained('users')
                ->cascadeOnDelete();

            $table->string('room_name');
            $table->boolean('status')->default(0)->comment('0=start,1=close/end');

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
        Schema::dropIfExists('chat_rooms');
    }
};
