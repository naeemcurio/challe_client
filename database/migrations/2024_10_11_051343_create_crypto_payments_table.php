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
        Schema::create('crypto_payments', function (Blueprint $table) {
            $table->id();

            $table->string('payment_id');
            $table->string('payment_url');
            $table->string('token');
            $table->string('transaction_id')->nullable();

            $table->integer('status')->comment('0=PENDING,1=IN_PROGRESS,2=RECEIVE_TRANSACTION,3=CONFIRMED,4=CANCELED');


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
        Schema::dropIfExists('crypto_payments');
    }
};
