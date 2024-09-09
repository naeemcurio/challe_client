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
        Schema::dropIfExists('withdraw_history_cards');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::create('withdraw_history_cards', function (Blueprint $table) {
            $table->id();

            $table->foreignId('withdraw_history_id')
                ->constrained('withdraw_histories')
                ->cascadeOnDelete();

            $table->string('card_holder_name');
            $table->string('card_number');
            $table->string('card_expiry_month');
            $table->string('card_expiry_year');


            $table->timestamps();
        });
    }
};
