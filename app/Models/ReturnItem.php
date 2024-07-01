<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReturnItem extends Model
{
    use HasFactory;
    protected $guarded = [];
    function product()
    {
        return $this->belongsTo(Product::class, 'product_id', 'id');
    }

    protected $fillable = [
        'return_id', 'product_id', 'quantity', 'refund_amount', 'new_product_id', 'additional_payment'
    ];

    public function return()
    {
        return $this->belongsTo(Returns::class);
    }
}
