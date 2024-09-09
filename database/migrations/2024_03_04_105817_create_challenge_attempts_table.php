<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('challenge_attempts', function (Blueprint $table) {
            $table->id();




            $table->foreignId('challenge_id')
                ->constrained('challenges')
                ->cascadeOnDelete();

            $table->foreignId('challenger_1')
                ->constrained('users')
                ->cascadeOnDelete();

            $table->foreignId('challenger_2')
                ->constrained('users')
                ->cascadeOnDelete();

            $table->boolean('is_completed')->default('0')
                ->comment('0=pending,1=complete');

            $table->foreignId('winner_id')
                ->nullable()
                ->constrained('users')
                ->cascadeOnDelete();

            $table->double('winning_amount')->nullable()->default(0);


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
        Schema::dropIfExists('challenge_attempts');
    }
};
