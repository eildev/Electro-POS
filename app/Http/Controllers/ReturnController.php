<?php

namespace App\Http\Controllers;

use App\Models\AccountTransaction;
use App\Models\ActualPayment;
use App\Models\Customer;
use App\Models\Product;
use App\Models\ReturnItem;
use App\Models\Returns;
use Illuminate\Http\Request;
use App\Models\Sale;
use App\Models\SaleItem;
use App\Models\Transaction;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class ReturnController extends Controller
{
    public function Return($id)
    {
        $sale = Sale::findOrFail($id);
        return view('pos.return.return-invoice', compact('sale'));
    }
    public function ReturnItems($id)
    {
        $sales = SaleItem::findOrFail($id);
        $sales->load('product');
        // dd($sales);
        return response()->json([
            'status' => '200',
            'sale_items' => $sales
        ]);
    }

    public function store(Request $request)
    {
        // dd($request->all());
        $validator = Validator::make($request->all(), [
            'sale_id' => 'required',
            'customer_id' => 'required',
            'formattedReturnDate' => 'required',
            'refund_amount' => 'required',
        ]);
        if ($validator->passes()) {

            // $saleItem = SaleItem::Where('sale_id', $request->sale_id)->get();
            // dd($saleItems);

            $returns = new Returns;

            $returns->return_invoice_number = rand(123456, 99999);;
            $returns->sale_id = $request->sale_id;
            $returns->customer_id = $request->customer_id;
            $returns->return_date = $request->formattedReturnDate;
            $returns->refund_amount = $request->refund_amount;
            $returns->return_reason = $request->note ?? '';

            $returns->total_return_profit = 0;
            $returns->status = 1;
            $returns->processed_by = Auth::user()->id;
            // $returns->save();


            foreach ($request->products as $returnData) {
                // dd($returnData['product_id']);
                $returnItems = new ReturnItem;
                $returnItems->return_id = $returns->id;
                $returnItems->product_id = (Integer)$returnData['product_id'];
                $returnItems->quantity = (Integer)$returnData['quantity'];
                $returnItems->return_price = (Integer)$returnData['return_price'];
                $returnItems->product_total = (Integer)$returnData['total_price'];

                $saleItem = SaleItem::findOrFail($returnData['product_id']);
                $old_subtotal = $saleItem->sub_total;
                $old_quantity = $saleItem->qty;
                $avg_selling_price = $old_subtotal / $old_quantity;
                $actual_total_return_price = $avg_selling_price * $returnData['quantity'];
                $return_profit = $actual_total_return_price - $returnData['total_price'];
                // dd($return_profit);
                $returnItems->return_profit = $return_profit;
                // $returnItems->return_reason = $request->note;
                $returnItems->save();
            }



            return response()->json([
                'status' => '200',
                'message' => 'Peoduct Return successful',
            ]);
        }else {
            return response()->json([
                'status' => '500',
                'error' => $validator->messages(),
            ]);
        }
    }

    // public function findReturnedProducts($id)
    // {
    //     $product = Product::findOrFail($id);

    //     return response()->json([
    //         'status' => 200,
    //         'product' => $product
    //     ]);
    // }


    // public function storeReturnItem(Request $request)
    // {
    //     // dd($request->all());
    //     $productCost = 0;
    //     $productAll = $request->products;
    //     foreach ($productAll as $product) {
    //         $items = Product::findOrFail($product['product_id']);
    //         $productCost += $items->cost;
    //     }
    //     $saleItem = SaleItem::where('sale_id', $request->sale_id)->where('product_id', $request->id)->latest()->first();

    //     $return = Returns::where('sale_id', $request->sale_id)->first();

    //     if ($return) {
    //         // Record exists, update it
    //         $return->customer_id = $request->customer_id;
    //         $return->total = $request->total_amount;
    //         $return->discount_amount = $request->actual_discount;
    //         $return->grand_total = $request->change_amount;
    //         $return->created_at = Carbon::now();
    //     } else {
    //         // Record does not exist, create a new one
    //         $return = new Returns;
    //         $return->sale_id = $request->sale_id;
    //         $return->customer_id = $request->customer_id;
    //         $return->total = $request->total_amount;
    //         $return->discount_amount = $request->actual_discount;
    //         $return->grand_total = $request->change_amount;
    //         $return->created_at = Carbon::now();
    //     }

    //     $return->save();

    //     $returnItems = new ReturnItem;
    //     $returnItems->return_id = 0;
    //     // $returnItems->sale_item_id = $product['product_id'];
    //     $returnItems->product_id = $request->id;
    //     $returnItems->quantity = $saleItem->qty;
    //     $returnItems->unit_price = $saleItem->rate; // Access 'unit_price' as an array key
    //     $returnItems->discount_amount = $saleItem->discount;
    //     $returnItems->total = $saleItem->sub_total;
    //     $returnItems->save();

    //     $saleItem->delete();

    //     return response()->JSON([
    //         'status' => 200,
    //         'message' => 'Successfully returned product',
    //     ]);
    // }
    public function returnProductsList()
    {
        $returns = Returns::get();
        return view('pos.return.return-view', compact('returns'));
    }
    // public function returnProductsDelete($id)
    // {
    //     $return = Returns::findOrFail($id);
    //     $return->delete();
    //     return back()->with('message', "Return successfully Deleted");
    // }
    // public function returnProductsInvoice($id)
    // {
    //     $return = Returns::findOrFail($id);
    //     return view('pos.return.return-invoice', compact('return'));
    // }
}




// namespace App\Http\Controllers;

// use Illuminate\Http\Request;
// use App\Models\Return;
// use App\Models\ReturnDetail;
// use App\Models\Invoice;
// use App\Models\Product;
// use Illuminate\Support\Facades\DB;

// class ReturnController extends Controller
// {
//     public function initiateReturn(Request $request)
//     {
//         $validated = $request->validate([
//             'invoice_id' => 'required|exists:invoices,id',
//             'products' => 'required|array',
//             'products.*.product_id' => 'required|exists:products,id',
//             'products.*.quantity' => 'required|integer|min:1',
//             'return_reason' => 'required|string',
//             'return_type' => 'required|string|in:refund,exchange',
//             'new_product_id' => 'nullable|exists:products,id',
//             'additional_payment' => 'nullable|numeric|min:0',
//         ]);

//         DB::beginTransaction();
//         try {
//             $return = Return::create([
//                 'invoice_id' => $request->invoice_id,
//                 'return_date' => now(),
//                 'return_reason' => $request->return_reason,
//                 'return_type' => $request->return_type,
//                 'processed_by' => auth()->id(),
//             ]);

//             foreach ($request->products as $product) {
//                 $refundAmount = $this->calculateRefund($request->invoice_id, $product['product_id'], $product['quantity']);
//                 ReturnDetail::create([
//                     'return_id' => $return->id,
//                     'product_id' => $product['product_id'],
//                     'quantity' => $product['quantity'],
//                     'refund_amount' => $refundAmount,
//                     'new_product_id' => $request->new_product_id,
//                     'additional_payment' => $request->additional_payment,
//                 ]);

//                 // Process return based on type
//                 if ($request->return_type == 'refund') {
//                     $this->processRefund($product['product_id'], $product['quantity'], $refundAmount);
//                 } elseif ($request->return_type == 'exchange') {
//                     $this->processExchange($product['product_id'], $product['quantity'], $request->new_product_id, $refundAmount, $request->additional_payment);
//                 }
//             }

//             DB::commit();
//             return response()->json(['status' => 'Return processed successfully']);
//         } catch (\Exception $e) {
//             DB::rollBack();
//             return response()->json(['error' => 'Error processing return: ' . $e->getMessage()], 500);
//         }
//     }

//     protected function calculateRefund($invoiceId, $productId, $quantity)
//     {
//         // Logic to calculate the refund amount based on the product and quantity
//         $product = Product::find($productId);
//         return $product->price * $quantity;
//     }

//     protected function processRefund($productId, $quantity, $refundAmount)
//     {
//         // Logic to process the refund, update inventory, and financial records
//         $product = Product::find($productId);
//         $product->stock += $quantity;
//         $product->save();
//     }

//     protected function processExchange($productId, $quantity, $newProductId, $refundAmount, $additionalPayment)
//     {
//         // Logic to process the exchange, update inventory, and financial records
//         $product = Product::find($productId);
//         $product->stock += $quantity;
//         $product->save();

//         $newProduct = Product::find($newProductId);
//         $newProduct->stock -= $quantity;
//         $newProduct->save();
//     }
// }
