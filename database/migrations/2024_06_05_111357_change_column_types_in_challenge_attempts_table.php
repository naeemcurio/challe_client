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
            $table->double('company_commission',8,5)->nullable()->change();
            $table->double('challenge_creator_commission',8,5)->nullable()->change();
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
            $table->double('company_commission',8,2)->nullable()->change();
            $table->double('challenge_creator_commission',8,2)->nullable()->change();
        });
    }
};
