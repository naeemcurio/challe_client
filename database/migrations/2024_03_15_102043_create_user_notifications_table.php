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
        Schema::create('user_notifications', function (Blueprint $table) {
            $table->id();


            $table->foreignId('user_id')
                ->constrained('users')
                ->cascadeOnDelete();

            $table->boolean('special_offers')->default(0);
            $table->boolean('sound')->default(0);
            $table->boolean('general_notification')->default(0);
            $table->boolean('payment_option')->default(0);
            $table->boolean('app_update')->default(0);
            $table->boolean('new_service_available')->default(0);
            $table->boolean('new_tips_available')->default(0);

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
        Schema::dropIfExists('user_notifications');
    }
};
