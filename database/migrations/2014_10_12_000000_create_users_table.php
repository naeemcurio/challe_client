<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->string('full_name')->nullable();
            $table->string('nick_name')->nullable();
            $table->string('date_of_birth')->nullable();
            $table->string('email')->unique();
            $table->string('password');
            $table->string('phone_number')->unique()->nullable();
            $table->string('gender')->nullable();
            $table->string('fcm_token')->nullable();
            $table->string('provider')->comment('GMAIL,APPLE')->nullable();
            $table->string('provider_id')->nullable();
            $table->string('image')->nullable();
            $table->string('default_language')->comment("en,ka")->default('en')->nullable();
            $table->string('stripe_connected_account_id')->nullable();
            $table->string('stripe_customer_id')->nullable();
            $table->boolean('is_profile_complelte')->comment('0=no,1=yes')->default(0);



            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
