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
        Schema::create('forfeit_challenges', function (Blueprint $table) {
            $table->id();

            $table->foreignId('challenger_1')->nullable()
                ->constrained('users')
                ->nullOnDelete();

            $table->foreignId('challenger_2')->nullable()
                ->constrained('users')
                ->nullOnDelete();

            $table->foreignId('challenge_id')->nullable()
                ->constrained('challenges')
                ->cascadeOnDelete();

            $table->text('challenger_1_status')->nullable();
            $table->text('challenger_2_status')->nullable();


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
        Schema::dropIfExists('forfeit_challenges');
    }
};
