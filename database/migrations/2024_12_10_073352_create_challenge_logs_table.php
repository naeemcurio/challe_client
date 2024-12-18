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
        Schema::create('challenge_logs', function (Blueprint $table) {
            $table->id();

            $table->foreignId('waiting_lounge_id')->nullable()
                ->constrained('waiting_lounges')->nullOnDelete();
            $table->foreignId('ready_lounge_id')->nullable()
                ->constrained('ready_lounges')->nullOnDelete();

            $table->string('price')->nullable();
            $table->string('challenge_name')->nullable();




            $table->string('waiting_date')->nullable();
            $table->string('waiting_cancel_date')->nullable();
            $table->string('ready_date')->nullable();
            $table->string('ready_cancel_date')->nullable();

            $table->string('search_user_name')->nullable();
            $table->string('matched_user_name')->nullable();

            $table->string('status')->comment('0=in_search,1=matched');


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
        Schema::dropIfExists('challenge_logs');
    }
};
