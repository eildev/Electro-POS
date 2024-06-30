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
        Schema::create('returns', function (Blueprint $table) {
            $table->id();
            $table->integer('sale_id');
            $table->integer('customer_id');
            $table->unsignedBigInteger('invoice_id');
            $table->dateTime('return_date');
            $table->string('return_reason');
            $table->string('return_type');
            $table->unsignedBigInteger('processed_by');

            $table->integer('total');
            $table->integer('discount_amount');
            $table->integer('grand_total');
            $table->tinyInteger('status')->default(0);


            $table->foreign('invoice_id')->references('id')->on('sales');
            $table->foreign('processed_by')->nullable()->references('sale_by')->on('sales');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('returns');
    }
};
