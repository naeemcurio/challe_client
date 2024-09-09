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
            // Make the challenge_id column nullable
            $table->unsignedBigInteger('challenge_id')->nullable()->change();

            // Drop the existing foreign key constraint if it exists
            $table->dropForeign(['challenge_id']);

            // Add the new foreign key constraint with nullOnDelete
            $table->foreign('challenge_id')
                ->references('id')
                ->on('challenges')
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
            // Drop the modified foreign key constraint
            $table->dropForeign(['challenge_id']);

            // Revert the challenge_id column to NOT NULL
            $table->unsignedBigInteger('challenge_id')->nullable(false)->change();

            // Add the original foreign key constraint with cascadeOnDelete
            $table->foreign('challenge_id')
                ->references('id')
                ->on('challenges')
                ->cascadeOnDelete();
        });
    }
};
