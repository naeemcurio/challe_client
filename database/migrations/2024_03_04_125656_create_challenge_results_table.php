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
        Schema::create('challenge_results', function (Blueprint $table) {
            $table->id();


            $table->double('likes');
            $table->double('views');


            $table->foreignId('challenge_attempt_id')
                ->constrained('challenge_attempts')
                ->cascadeOnDelete();

            $table->foreignId('challenger_record_submission_id')
                ->constrained('challenger_record_submissions')
                ->cascadeOnDelete();

            $table->foreignId('challenger_id')
                ->constrained('users')
                ->cascadeOnDelete();

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
        Schema::dropIfExists('challenge_results');
    }
};
