<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\RepositoryInterfaces\DamageInterface;
use Illuminate\Support\Str;
use App\Models\Damage;
use App\Models\Product;
use App\Models\AccountTransaction;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
// use Validator;
use Illuminate\Support\Facades\Validator;
use League\CommonMark\Reference\Reference;

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
        // dd($request->all());
        $validator = Validator::make($request->all(), [

            'product_id' => 'required|max:255',
            'pc' => 'required|max:255',
            'date' => 'required|max:50',
        ]);

        if ($validator->passes()) {
            $data = $request->all();

            // $this->damage_repo->create($data);
            // @dd($data);
            $product_qty = Product::findOrFail($request->product_id);
            $stock = $product_qty->stock;
            $damage = new Damage;
            $damage->product_id = $request->product_id;
            $damage->qty = $request->pc;
            $damage->branch_id = Auth::user()->branch_id;
            $formattedDate = date('Y-m-d H:i:s', strtotime($request->date));
            $damage->date = $formattedDate;
            $damage->note = $request->note;
            $damage->save();
            $product_qty->stock = $product_qty->stock - $request->pc;
            $product_qty->save();

            $accountTransaction = new AccountTransaction;
            $accountTransaction->branch_id = Auth::user()->branch_id;
            $accountTransaction->reference_id = $damage->id;
            $accountTransaction->purpose = 'Damage';
            // $accountTransaction->account_id = '';
            // Calculate product price
            $product_price = $product_qty->price * $request->pc;
            $accountTransaction->debit = $product_price; // $request->Amount
            // Get the latest balance
            $oldBalance = AccountTransaction::latest('created_at')->first();
            if ($oldBalance) {
                $accountTransaction->balance = $oldBalance->balance - $product_price;
            } else {
                $accountTransaction->balance = -$product_price; // assuming initial balance is 0
            }
            $accountTransaction->created_at = Carbon::now();
            $accountTransaction->save();
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
        if(Auth::user()->id == 1){
            $damages = Damage::all();
        }else{
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
        // @dd($show_qty);
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

            'product_id' => 'required|max:255',
            'pc' => 'required|max:255',
            'date' => 'required|max:50',
        ]);

        if ($validator->passes()) {
            $data = $request->all();

            // $this->damage_repo->create($data);
            // @dd($data);

            $product_qty = Product::findOrFail($request->product_id);
            $stock = $product_qty->stock;
            $damage = Damage::findOrFail($id);
            $damage->product_id = $request->product_id;
            $damage->qty = $request->pc;
            $damage->branch_id = Auth::user()->branch_id;
            $formattedDate = date('Y-m-d H:i:s', strtotime($request->date));
            $damage->date = $formattedDate;
            $damage->note = $request->note;
            $damage->update();
            $product_qty->stock = $product_qty->stock - $request->pc;
            $product_qty->save();

            //Update
            $existingTransaction  = AccountTransaction::where('reference_id',$id)->firstOrFail();
            $oldProductPrice = $existingTransaction->debit;
            $product_price = $product_qty->price * $request->pc;
            $priceDifference = $product_price - $oldProductPrice;
            $existingTransaction->branch_id = Auth::user()->branch_id;
            $existingTransaction->purpose = 'Damage';
            $existingTransaction->debit = $product_price;
            // $accountTransaction->account_id = '';
            // Get the latest balance
            $oldBalance = AccountTransaction::latest('created_at')->first();
            if ($oldBalance) {
                $existingTransaction->balance = $oldBalance->balance - $priceDifference;
            } else {
                $existingTransaction->balance = -$priceDifference;
            }
            $existingTransaction->created_at = Carbon::now();
            $existingTransaction->save();
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
