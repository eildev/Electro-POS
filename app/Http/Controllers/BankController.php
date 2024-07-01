<?php

namespace App\Http\Controllers;

use App\Models\AccountTransaction;
use App\Models\Bank;
use App\Models\Transaction;
use App\Repositories\RepositoryInterfaces\BankInterface;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
// use Validator;
use Illuminate\Support\Facades\Validator;

use function Laravel\Prompts\alert;

class BankController extends Controller
{
    private $bankrepo;
    public function __construct(BankInterface $bankInterface)
    {
        $this->bankrepo = $bankInterface;
    }
    public function index()
    {

        return view('pos.bank.bank');
    }
    public function store(Request $request)
    {
        // dd($request->all());
        $validator = Validator::make($request->all(), [
            'name' => 'required|max:99',
            'opening_balance' => 'required',
        ]);

        if ($validator->passes()) {
            $bank = new Bank;
            $bank->name =  $request->name;
            $bank->branch_name = $request->branch_name;
            $bank->manager_name = $request->manager_name;
            $bank->phone_number = $request->phone_number;
            $bank->account = $request->account;
            $bank->email = $request->email;
            $bank->opening_balance = $request->opening_balance;
            $bank->save();

            $accountTransaction = new AccountTransaction;
            $accountTransaction->branch_id =  Auth::user()->branch_id;
            $accountTransaction->purpose =  'Bank';
            $accountTransaction->account_id =  $bank->id;
            $accountTransaction->credit = $request->opening_balance;
            $accountTransaction->balance = $accountTransaction->balance + $request->opening_balance;
            $accountTransaction->save();

            return response()->json([
                'status' => 200,
                'message' => 'Bank Save Successfully',
            ]);
        } else {
            return response()->json([
                'status' => '500',
                'error' => $validator->messages()
            ]);
        }
    }
    public function view()
    {
        // $banks = Bank::get();
        $banks = $this->bankrepo->getAllBank();
        $banks->load('accountTransaction');

        // dd($banks);

        return response()->json([
            "status" => 200,
            "data" => $banks
        ]);
    }
    public function edit($id)
    {
        $bank = $this->bankrepo->editBank($id);
        if ($bank) {
            return response()->json([
                'status' => 200,
                'bank' => $bank
            ]);
        } else {
            return response()->json([
                'status' => 500,
                'message' => "Data Not Found"
            ]);
        }
    }
    public function update(Request $request, $id)
    {
        // dd($request->all());
        $validator = Validator::make($request->all(), [
            'name' => 'required|max:99',
            'branch_name' => 'required|max:149',
            'phone_number' => 'required|max:19',
            'account' => 'required',
            // 'opening_balance' => 'required',
        ]);
        if ($validator->passes()) {
            $bank = Bank::findOrFail($id);
            $bank->name =  $request->name;
            $bank->branch_name = $request->branch_name;
            $bank->manager_name = $request->manager_name;
            $bank->phone_number = $request->phone_number;
            $bank->account = $request->account;
            $bank->email = $request->email;
            // $bank->opening_balance = $request->opening_balance;
            $bank->save();

            // $accountTransaction = AccountTransaction::where('account_id', $id)->first();
            // $oldBalance = AccountTransaction::latest()->first();
            // $accountTransaction->balance = (($oldBalance->balance - $accountTransaction->credit) + $request->opening_balance);
            // $accountTransaction->credit = $request->opening_balance;
            // $accountTransaction->save();

            return response()->json([
                'status' => 200,
                'message' => 'Bank Update Successfully',
            ]);
        } else {
            return response()->json([
                'status' => '500',
                'error' => $validator->messages()
            ]);
        }
    }
    public function destroy($id)
    {
        $bank = Bank::findOrFail($id);
        $bank->delete();
        return response()->json([
            'status' => 200,
            'message' => 'Bank Deleted Successfully',
        ]);
    }
    //Bank balance Add
    public function BankBalaneAdd(Request $request, $id)
    {
        // dd($request->all());
        $validator = Validator::make($request->all(), [
            'update_balance' => 'required',
        ]);

        if ($validator->passes()) {
            $bank = Bank::findOrFail($id);
            $bank->opening_balance = $bank->opening_balance + $request->update_balance;
            $bank->update_balance =  $request->update_balance;
            $bank->purpose = $request->purpose;
            $bank->save();

            $accountTransaction = new AccountTransaction;
            $accountTransaction->branch_id =  Auth::user()->branch_id;
            $accountTransaction->purpose =  'Add Bank Balance';
            $accountTransaction->account_id =  $bank->id;
            $accountTransaction->credit = $request->update_balance;
            $oldBalance = AccountTransaction::where('account_id', $id)->latest('created_at')->first();
            $accountTransaction->balance = $oldBalance->balance + $request->update_balance;
            $accountTransaction->save();

            return response()->json([
                'status' => 200,
                'message' => 'Add Money Successfully',
            ]);
        } else {
            return response()->json([
                'status' => '500',
                'error' => $validator->messages()
            ]);
        }
    }
}
