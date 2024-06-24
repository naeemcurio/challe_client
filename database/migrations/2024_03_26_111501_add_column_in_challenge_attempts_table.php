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
        Schema::table('challenge_attempts', function (Blueprint $table) {
            $table->foreignId('ready_lounge_id')
                ->after('id')
                ->nullable()
                ->constrained('ready_lounges')
                ->nullOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('challenge_attempts', function (Blueprint $table) {
            $table->dropForeign(['ready_lounge_id']);
            $table->dropColumn('ready_lounge_id');
        });
    }
};
