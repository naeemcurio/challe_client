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
        Schema::create('withdraw_history_cryptos', function (Blueprint $table) {
            $table->id();

            $table->foreignId('withdraw_history_id')
                ->constrained('withdraw_histories')
                ->cascadeOnDelete();
            $table->string('coin_type');
            $table->text('address');
            $table->text('network');

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
        Schema::dropIfExists('withdraw_history_cryptos');
    }
};
