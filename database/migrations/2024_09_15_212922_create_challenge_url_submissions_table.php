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
        Schema::create('challenge_url_submissions', function (Blueprint $table) {
            $table->id();

            $table->foreignId('record_submission_id')
                ->constrained('challenger_record_submissions')
                ->cascadeOnDelete();

            $table->string('video_url');

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
        Schema::dropIfExists('challenge_url_submissions');
    }
};
