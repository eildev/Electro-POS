<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\RepositoryInterfaces\DamageInterface;
use App\Models\Damage;
use App\Models\Product;
use App\Models\Stock;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class DamageController extends Controller
{

    private $damage_repo;
    public function __construct(DamageInterface $damage_interface)
    {
        $this->damage_repo = $damage_interface;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        return view('pos.damage.index');
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [

            'product_id' => 'required|max:255',
            'pc' => 'required|max:255',
            'date' => 'required|max:50',
        ]);

        if ($validator->passes()) {
            $data = $request->all();

            $product = Product::findOrFail($request->product_id);
            $damage = new Damage;
            $damage->product_id = $request->product_id;
            $damage->qty = $request->pc;
            $product_price = $product->cost * $request->pc;
            $damage->damage_cost = $product_price;
            $damage->branch_id = Auth::user()->branch_id;
            $formattedDate = date('Y-m-d H:i:s', strtotime($request->date));
            $damage->date = $formattedDate;
            $damage->note = $request->note;
            $damage->save();

            $stock = Stock::where('product_id', $request->product_id)->first();
            $stock->stock_quantity -= $request->pc;
            $stock->save();
        }
        $notification = array(
            'message' => 'Damage Add Successfully',
            'alert-type' => 'info'
        );
        return redirect()->route('damage.view')->with($notification);
    }


    /**
     * Display the specified resource.
     */
    public function view()
    {
        if (Auth::user()->id == 1) {
            $damages = Damage::all();
        } else {
            $damages = Damage::where('branch_id', Auth::user()->branch_id)->latest()->get();;
        }
        return view('pos.damage.view_damage', compact('damages'));
    }
    /**
     * Show the form for editing the specified resource.
     */
    public function ShowQuantity($id)
    {
        $show_qty = Product::with('unit')->findOrFail($id);
        return response()->json([

            'all_data' => $show_qty,
            'unit' => $show_qty->unit
        ]);
    }
    public function edit($id)
    {
        $damage_info = Damage::findOrFail($id);

        return view('pos.damage.edit', compact('damage_info'));
    }
    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'product_id' => 'required',
            'pc' => 'required',
            'date' => 'required',
        ]);
        if ($validator->passes()) {
            $data = $request->all();

            $product_qty = Product::findOrFail($request->product_id);
            // dd($request->all());

            $damage = Damage::findOrFail($id);

            $damage->product_id = $request->product_id;
            $stock = Stock::where('product_id', $request->product_id)->first();
            // dd($damage->qty, $request->pc);
            if ($damage->qty > $request->pc) {
                $updatedValue = $damage->qty - $request->pc;
                $stock->stock_quantity += $updatedValue;
            } elseif ( $damage->qty <  $request->pc) {
                $updatedValue2 = $request->pc - $damage->qty;
                $stock->stock_quantity -= $updatedValue2;
            }else{
                $stock->stock_quantity = $stock->stock_quantity;
            }
            $stock->save();
            $damage->qty = $request->pc;
            $product_price = $product_qty->cost * $request->pc;
            $damage->damage_cost = $product_price;
            $damage->branch_id = Auth::user()->branch_id;
            $formattedDate = date('Y-m-d H:i:s', strtotime($request->date));
            $damage->date = $formattedDate;
            $damage->note = $request->note;
           $damage->update();
           }

        $notification = array(
            'message' => 'Damage Update Successfully',
            'alert-type' => 'info'
        );
        return redirect()->route('damage.view')->with($notification);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        $damage_info = Damage::findOrFail($id);
        $damage_info->delete();
        $notification = array(
            'message' => 'Damage Deleted successfully',
            'alert-type' => 'info'
        );
        return back()->with($notification);
    }
}
