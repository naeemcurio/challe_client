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
        Schema::create('challenger_record_submissions', function (Blueprint $table) {
            $table->id();

            $table->foreignId('challenge_attempt_id')
                ->constrained('challenge_attempts')
                ->cascadeOnDelete();

            $table->foreignId('challenger_id')
                ->constrained('users')
                ->cascadeOnDelete();

            $table->string('video_url');

            $table->text('comments');

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
        Schema::dropIfExists('challenger_record_submissions');
    }
};
