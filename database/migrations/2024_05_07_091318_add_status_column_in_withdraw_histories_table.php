<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('withdraw_histories', function (Blueprint $table) {
            $table->boolean('status')->comment('0=pending,1=approved')
                ->after('card_id')->nullable();
            $table->string('stripe_transfer_id')->after('card_id')
                ->nullable();

            $table->dropColumn('rapyd_transaction_id');
            $table->dropColumn('beneficiary_id');
            $table->dropColumn('card_id');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('withdraw_histories', function (Blueprint $table) {
            $table->dropColumn('status');
            $table->dropColumn('stripe_transfer_id');

            $table->string('rapyd_transaction_id')->nullable()->after('amount');
            $table->string('beneficiary_id')->nullable()->after('rapyd_transaction_id');
            $table->string('card_id')->nullable()->after('beneficiary_id');
        });
    }
};
