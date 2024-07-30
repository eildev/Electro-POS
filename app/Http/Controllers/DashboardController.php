<?php

namespace App\Http\Controllers;

use App\Models\AccountTransaction;
use App\Models\Bank;
use App\Models\EmployeeSalary;
use App\Models\Expense;
use App\Models\Purchase;
use App\Models\Returns;
use App\Models\Sale;
use App\Models\Transaction;
use App\Models\Branch;
use App\Models\ViaSale;
use Carbon\Carbon;
use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        // today summary
        $banks = Bank::all();
        $branches = Branch::all();
        foreach ($branches as $branch) {
        $viaSale = ViaSale::where('branch_id', $branch->id)
        ->whereDate('created_at', Carbon::now())->get();
        $todaySalesData = Sale::where('branch_id', $branch->id)
        ->whereDate('created_at', Carbon::now())->get();
        $todaySales = $todaySalesData->sum('paid') - $viaSale->sum('sub_total');

        $todayPurchase = Purchase::where('branch_id', $branch->id)
        ->whereDate('created_at', Carbon::now())->get();
        $todayExpanse = Expense::where('branch_id', $branch->id)
        ->whereDate('created_at', Carbon::now())->get();
        $dueCollection = Transaction::where('branch_id', $branch->id)
        ->where('particulars', 'SaleDue')
            ->whereDate('created_at', Carbon::now())
            ->get();
        $otherCollection = Transaction::where('branch_id', $branch->id)
        ->where('particulars', 'OthersReceive')
            ->whereDate('created_at', Carbon::now())
            ->get();
        $otherPaid = Transaction::where('branch_id', $branch->id)
        ->where('particulars', 'OthersPayment')
        ->whereDate('created_at', Carbon::now())
        ->get();
        $purchaseDuePay = Transaction::where('branch_id', $branch->id)
        ->where('particulars', 'PurchaseDue')
            ->whereDate('created_at', Carbon::now())
            ->get();
        $todayBalance = AccountTransaction::where('branch_id', $branch->id)
        ->whereDate('created_at', Carbon::now())
            ->latest()
            ->first();
        $previousDayBalance = 0;
        $currentDate = Carbon::now()->toDateString();
        // Get the last transaction date before today
        $lastTransactionDate = AccountTransaction::where('branch_id', $branch->id)
        ->whereDate('created_at', '<', $currentDate)
            ->latest('created_at')
            ->first();
        if ($lastTransactionDate) {
            $lastTransactionDate = $lastTransactionDate->created_at->toDateString();

            foreach ($banks as $bank) {
                $transaction = AccountTransaction::where('branch_id', $branch->id)
                ->where('account_id', $bank->id)
                    ->whereDate('created_at', $lastTransactionDate)
                    ->latest('created_at')
                    ->first();

                if ($transaction) {
                    $previousDayBalance += $transaction->balance;
                }
            }
        }
        $addBalance = AccountTransaction::where('branch_id', $branch->id)
        ->where('purpose', 'Add Bank Balance')
            ->whereDate('created_at', Carbon::now())
            ->get();
        $todayEmployeeSalary = EmployeeSalary::where('branch_id', $branch->id)
        ->whereDate('created_at', Carbon::now())->get();

        $return = Returns::where('branch_id', $branch->id)
        ->whereDate('created_at', Carbon::now())->get();
        $adjustDueCollectionDB = Transaction::where('branch_id', $branch->id)
        ->where('particulars', 'Adjust Due Collection')
            ->where('payment_type', 'pay')
            ->whereDate('created_at', Carbon::now())
            ->get();
        $adjustDueCollection =
            $return->sum('refund_amount') - $adjustDueCollectionDB->sum('debit');
        $viaPayment = AccountTransaction::where('branch_id', $branch->id)
        ->where('purpose', 'Via Payment')
            ->whereDate('created_at', Carbon::now())
            ->get();
        $todayReturnAmount = $return->sum('refund_amount') - $adjustDueCollection;

        $totalIngoing =
            $previousDayBalance +
            $todaySales +
            $dueCollection->sum('credit') +
            $otherCollection->sum('credit') +
            $addBalance->sum('credit') +
            $adjustDueCollection +
            $viaSale->sum('sub_total');
        $totalOutgoing =
            $todayPurchase->sum('paid') +
            $todayExpanse->sum('amount') +
            $todayEmployeeSalary->sum('debit') +
            $todayReturnAmount +
            $purchaseDuePay->sum('debit') +
            $otherPaid->sum('debit') +
            $viaPayment->sum('debit');
    }



        // Total Summary
        $sales = Sale::all();
        $purchase = Purchase::all();
        $expanse = Expense::all();
        $bankLabels = [];
        $grandTotal = 0;
        foreach ($banks as $bank) {
            $transaction = AccountTransaction::where('account_id', $bank->id)
                ->latest('created_at')
                ->first();
            // dd($transaction);
            if ($transaction) {
                $bankData = [
                    'name' => $bank->name,
                    'amount' => number_format($transaction->balance, 2), // Accessing the balance attribute
                ];
                array_push($bankLabels, $bankData);
                $grandTotal += $transaction->balance;
            }
        }

        $totalCustomerDue = $sales->sum('change_amount') - $sales->sum('paid');
        $totalSupplierDue = $sales->sum('change_amount') - $sales->sum('paid');


        // weekly update Chart
        $salesByDay = [];
        $salesProfitByDay = [];
        $purchaseByDay = [];

        for ($i = 6; $i >= 0; $i--) {
            $date = now()->subDays($i)->toDateString();
            $dailySales = Sale::whereDate('sale_date', $date)->sum('receivable');
            $dailyProfit = Sale::whereDate('sale_date', $date)->sum('profit');
            $dailyPurchase = Purchase::whereDate('purchase_date', $date)->sum('grand_total');

            $salesByDay[$date] = $dailySales;
            $salesProfitByDay[$date] = $dailyProfit;
            $purchaseByDay[$date] = $dailyPurchase;
        }


        // monthly update chart
        $salesByMonth = [];
        $profitsByMonth = [];
        $purchasesByMonth = [];

        for ($i = 0; $i < 12; $i++) {
            $monthStart = now()->subMonths($i)->startOfMonth();
            $monthEnd = now()->subMonths($i)->endOfMonth();

            $monthlySales = Sale::whereBetween('sale_date', [$monthStart, $monthEnd])->sum('receivable');
            $monthlyProfit = Sale::whereBetween('sale_date', [$monthStart, $monthEnd])->sum('profit');
            $monthlyPurchase = Purchase::whereBetween('purchase_date', [$monthStart, $monthEnd])->sum(
                'grand_total',
            );

            $salesByMonth[$monthStart->format('Y-m')] = $monthlySales;
            $profitsByMonth[$monthStart->format('Y-m')] = $monthlyProfit;
            $purchasesByMonth[$monthStart->format('Y-m')] = $monthlyPurchase;
        }

        return view('dashboard.dashboard', compact(
            'previousDayBalance',
            'todayEmployeeSalary',
            'todaySales',
            'todayPurchase',
            'dueCollection',
            'purchaseDuePay',
            'otherCollection',
            'otherPaid',
            'adjustDueCollection',
            'todayReturnAmount',
            'addBalance',
            'todayExpanse',
            'viaPayment',
            'totalIngoing',
            'totalOutgoing',
            'sales',
            'totalCustomerDue',
            'purchase',
            'totalSupplierDue',
            'expanse',
            'grandTotal',
            'salesByDay',
            'salesProfitByDay',
            'purchaseByDay',
            'bankLabels',
            'salesByMonth',
            'profitsByMonth',
            'purchasesByMonth',
            'viaSale',
        ));
    }
}
