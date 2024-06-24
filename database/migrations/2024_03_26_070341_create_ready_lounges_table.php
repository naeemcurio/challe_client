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
        Schema::create('ready_lounges', function (Blueprint $table) {
            $table->id();

            $table->foreignId('waiting_lounge_id')
                ->constrained('waiting_lounges')
                ->cascadeOnDelete();

            $table->foreignId('user_1')
                ->constrained('users')->cascadeOnDelete();

            $table->foreignId('user_2')
                ->constrained('users')->cascadeOnDelete();

            $table->integer('user1_status')->default(0)
                ->comment('0=not_ready,1=ready');

            $table->integer('user2_status')->default(0)
                ->comment('0=not_ready,1=ready');


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
        Schema::dropIfExists('ready_lounges');
    }
};
