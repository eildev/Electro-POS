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
        Schema::create('return_items', function (Blueprint $table) {
            $table->id();
            $table->integer('return_id');
            $table->integer('sale_item_id');
            $table->integer('product_id');
            $table->integer('quantity');
            $table->integer('unit_price');
            $table->integer('discount_amount');
            $table->integer('total');

            $table->unsignedBigInteger('return_id');
            $table->unsignedBigInteger('product_id');
            $table->integer('quantity');
            $table->decimal('refund_amount', 10, 2)->nullable();
            $table->unsignedBigInteger('new_product_id')->nullable();
            $table->decimal('additional_payment', 10, 2)->nullable();
            $table->foreign('return_id')->references('id')->on('returns');
            $table->foreign('product_id')->references('id')->on('products');
            $table->foreign('new_product_id')->references('id')->on('products');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('return_items');
    }
};
