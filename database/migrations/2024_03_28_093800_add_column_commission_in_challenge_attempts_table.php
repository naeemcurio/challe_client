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
            $table->float('company_commission')->after('winning_amount')->default(0);
            $table->float('challenge_creator_commission')->after('company_commission')->default(0);
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
            $table->dropColumn('company_commission');
            $table->dropColumn('challenge_creator_commission');
        });
    }
};
