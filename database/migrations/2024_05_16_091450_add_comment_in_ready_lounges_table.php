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
        Schema::table('ready_lounges', function (Blueprint $table) {
            $table->integer('user1_status')->default(0)
                ->comment('0=not_ready,1=ready,2=forfeit')->change();

            $table->integer('user2_status')->default(0)
                ->comment('0=not_ready,1=ready,2=forfeit')->change();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('ready_lounges', function (Blueprint $table) {
            $table->integer('user1_status')->default(0)
                ->comment('0=not_ready,1=ready')->change();

            $table->integer('user2_status')->default(0)
                ->comment('0=not_ready,1=ready')->change();
        });
    }
};
