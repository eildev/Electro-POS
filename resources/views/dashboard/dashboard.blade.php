@extends('master')
@section('title', '| Dashboard')
@section('admin')

    {{-- ///// css style design //// --}}
    <style>
        @media (max-width: 768px) {
            .responsive-text {
                font-size: 1rem;
                /* Adjust as needed for medium screens */

            }

            .grid-margin {
                margin-bottom: .7rem;
                padding-right: 6px;
                padding-left: 6px;
            }

            .new-margin {
                padding-right: 0px !important;
            }

            .text-1 {
                font-size: 13px
            }

            .mar-1 {
                margin-bottom: 4px
            }

            .table {
                border-bottom-width: 0 !important;
            }
        }
    </style>
    @php
        use Carbon\Carbon;
        // --------------------///// Total summary ////----------------------------//
        $sales = App\Models\Sale::all();
        $purchase = App\Models\Purchase::all();
        $expanse = App\Models\Expense::all();
        $banks = App\Models\Bank::all();
        $bankLabels = [];
        $grandTotal = 0;
        foreach ($banks as $bank) {
            $transaction = App\Models\AccountTransaction::where('account_id', $bank->id)
                ->where('balance', '>', 0)
                ->latest()
                ->first();
            if ($transaction) {
                $bankData = [
                    'name' => $bank->name,
                    'amount' => number_format($transaction->balance, 2), // Accessing the balance attribute
                ];
                array_push($bankLabels, $bankData);
                $grandTotal += $transaction->balance;
            }
        }

        // dd($grandTotal);

    @endphp

    <div class="row">
        <div class="col-12 col-xl-12 stretch-card">
            <div class="row flex-grow-1">
                {{-- /////// ToTal Summary ////// --}}
                <div class="col-md-12 col-xl-6 col-12 new-margin grid-margin stretch-card">
                    <div class="card" style="">
                        <div class="card-body">
                            <h6 class="card-title">Total Summary</h6>
                            <table class="table border-none">
                                <thead>
                                    <tr>
                                        <th>Summary</th>
                                        <th>Total</th>
                                        <th>Paid</th>
                                        <th>Due</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Sales</td>
                                        <td>{{ $sales->sum('total') }}</td>
                                        <td>{{ $sales->sum('paid') }}</td>
                                        <td>{{ $sales->sum('due') }}</td>
                                    </tr>
                                    <tr>
                                        <td>Purchase</td>
                                        <td>{{ $purchase->sum('sub_total') }}</td>
                                        <td>{{ $purchase->sum('paid') }}</td>
                                        <td>{{ $purchase->sum('due') }}</td>
                                    </tr>
                                    <tr>
                                        <td>Exapnse</td>
                                        <td>{{ $expanse->sum('sub_total') }}</td>
                                        <td>00</td>
                                        <td>00</td>
                                    </tr>
                                    <tr>
                                        <td>Balance</td>
                                        <td>{{ $grandTotal }}</td>
                                        <td>00</td>
                                        <td>00</td>
                                    </tr>
                                    <tr>
                                        <td>Profit</td>
                                        <td>{{ $sales->sum('profit') }}</td>
                                        <td>00</td>
                                        <td>00</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                {{-- /////// End Total Summary ////// --}}


                @php
                    // --------------------///// Today summary Calculation ////----------------------------//
                    $todaySales = App\Models\Sale::whereDate('created_at', Carbon::now())->get();
                    $todayPurchase = App\Models\Purchase::whereDate('created_at', Carbon::now())->get();
                    $todayExpanse = App\Models\Expense::whereDate('created_at', Carbon::now())->get();
                    $dueCollection = App\Models\Transaction::where('particulars', 'SaleDue')
                        ->whereDate('created_at', Carbon::now())
                        ->get();
                    $otherCollection = App\Models\Transaction::where('particulars', 'OthersReceive')
                        ->whereDate('created_at', Carbon::now())
                        ->get();
                    $otherPaid = App\Models\Transaction::where('particulars', 'OthersPayment')
                        ->whereDate('created_at', Carbon::now())
                        ->get();
                    $parchaseDuePay = App\Models\Transaction::where('particulars', 'PurchaseDue')
                        ->whereDate('created_at', Carbon::now())
                        ->get();
                    $todayBalance = App\Models\AccountTransaction::whereDate('created_at', Carbon::now())
                        ->latest()
                        ->first();
                    $yesterdayBalance = 0;
                    foreach ($banks as $bank) {
                        $transaction = App\Models\AccountTransaction::whereDate('created_at', Carbon::yesterday())
                            ->where('account_id', $bank->id)
                            ->where('balance', '>', 0)
                            ->latest()
                            ->first();
                        if ($transaction) {
                            $yesterdayBalance += $transaction->balance;
                        }
                    }
                    $addBalance = App\Models\AccountTransaction::where('purpose', 'Add Bank Balance')
                        ->whereDate('created_at', Carbon::now())
                        ->get();
                    $todayEmployeeSalary = App\Models\EmployeeSalary::whereDate('created_at', Carbon::now())->get();
                    $todayReturnAmount = App\Models\Returns::whereDate('created_at', Carbon::now())->get();
                    $adjustDueCollectionDB = App\Models\Transaction::where('particulars', 'Adjust Due Collection')
                        ->where('payment_type', 'pay')
                        ->whereDate('created_at', Carbon::now())
                        ->get();
                    $adjustDueCollection =
                        $todayReturnAmount->sum('refund_amount') - $adjustDueCollectionDB->sum('debit');
                    // dd($todayReturnAmount->sum('refund_amount'));
                @endphp
                {{-- ///////Today Summary ////// --}}
                <div class="col-md-12 col-xl-6 col-12  grid-margin stretch-card">
                    <div class="card" style="">
                        <div class="card-body">
                            <h6 class="card-title">Today Summary</h6>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th colspan="2">Incomming</th>
                                        <th colspan="2">Outgoing</th>
                                    </tr>
                                    <tr>
                                        <th>Purpose</th>
                                        <th class="text-end">TK</th>
                                        <th>Purpose</th>
                                        <th class="text-end">TK</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Previous Day Balance</td>
                                        <td class="text-end">{{ $yesterdayBalance ?? 0 }}</td>
                                        <td>Salary</td>
                                        <td class="text-end">{{ $todayEmployeeSalary->sum('debit') }}</td>

                                    </tr>
                                    <tr>
                                        <td>Paid Sales</td>
                                        <td class="text-end">{{ $todaySales->sum('paid') }}</td>
                                        <td>Purchase</td>
                                        <td class="text-end">{{ $todayPurchase->sum('paid') }}</td>

                                    </tr>
                                    <tr>
                                        <td>Due Collection</td>
                                        <td class="text-end">{{ $dueCollection->sum('credit') }}</td>
                                        <td>Due Paid</td>
                                        <td class="text-end">{{ $parchaseDuePay->sum('debit') }}</td>
                                    </tr>
                                    <tr>
                                        <td>Other Deposit</td>
                                        <td class="text-end">{{ $otherCollection->sum('credit') }}</td>
                                        <td>Other Withdraw</td>
                                        <td class="text-end">{{ $otherPaid->sum('debit') }}</td>
                                    </tr>
                                    <tr>
                                        <td>Adjust Due Collcetion</td>
                                        <td class="text-end">
                                            {{ $adjustDueCollection }}
                                        </td>
                                        <td>Return</td>
                                        <td class="text-end">{{ $todayReturnAmount->sum('refund_amount') }}</td>
                                    </tr>
                                    <tr>
                                        <td>Add Balance</td>
                                        <td class="text-end">{{ $addBalance->sum('credit') }}</td>
                                        <td>Expanse</td>
                                        <td class="text-end">{{ $todayExpanse->sum('amount') }}</td>
                                    </tr>
                                    @php
                                        $totalIngoing =
                                            $yesterdayBalance +
                                            $todaySales->sum('paid') +
                                            $dueCollection->sum('credit') +
                                            $otherCollection->sum('credit') +
                                            $addBalance->sum('credit') +
                                            $adjustDueCollection;
                                        $totalOutgoing =
                                            $todayPurchase->sum('paid') +
                                            $todayExpanse->sum('amount') +
                                            $todayEmployeeSalary->sum('debit') +
                                            $todayReturnAmount->sum('refund_amount') +
                                            $parchaseDuePay->sum('debit') +
                                            $otherPaid->sum('debit');
                                    @endphp
                                    <tr>
                                        <td>Total</td>
                                        <td class="text-end">{{ $totalIngoing }}</td>
                                        <td>Total</td>
                                        <td class="text-end">{{ $totalOutgoing }}</td>
                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th colspan="3">Total Balance</th>
                                        <th class="text-end">{{ $totalIngoing - $totalOutgoing }}</th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
                {{-- ///////End Today Summary ////// --}}
            </div>
        </div>
    </div>

    {{-- //////Revenew Chart Start /////// --}}
    <div class="row">
        @php
            $salesByDay = [];
            $salesProfitByDay = [];
            $purchaseByDay = [];

            for ($i = 6; $i >= 0; $i--) {
                $date = now()->subDays($i)->toDateString();
                $dailySales = App\Models\Sale::whereDate('sale_date', $date)->sum('receivable');
                $dailyProfit = App\Models\Sale::whereDate('sale_date', $date)->sum('profit');
                $dailyPurchase = App\Models\Purchase::whereDate('purchse_date', $date)->sum('grand_total');

                $salesByDay[$date] = $dailySales;
                $salesProfitByDay[$date] = $dailyProfit;
                $purchaseByDay[$date] = $dailyPurchase;
            }
        @endphp
        <div class="col-xl-6 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h6 class="card-title">Daily Profit</h6>
                    <div id="apexLine1"></div>
                </div>
            </div>
        </div>

        <div class="col-xl-6 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h6 class="card-title">Banking Details</h6>
                    <div id="apexPie1"></div>
                    <div id="totalAmount" style="text-align: center; margin-top: 20px;">
                        <h5>Total: {{ number_format($grandTotal, 2) }}</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            var colors = {
                primary: "#6571ff",
                secondary: "#7987a1",
                success: "#05a34a",
                info: "#66d1d1",
                warning: "#fbbc06",
                danger: "#ff3366",
                light: "#e9ecef",
                dark: "#060c17",
                muted: "#7987a1",
                gridBorder: "rgba(77, 138, 240, .15)",
                bodyColor: "#b8c3d9",
                cardBg: "#0c1427"
            }

            var fontFamily = "'Roboto', Helvetica, sans-serif"

            var lineChartOptions = {
                chart: {
                    type: "line",
                    height: '320',
                    parentHeightOffset: 0,
                    foreColor: colors.bodyColor,
                    background: colors.cardBg,
                    toolbar: {
                        show: false
                    },
                },
                theme: {
                    mode: 'dark'
                },
                tooltip: {
                    theme: 'dark'
                },
                colors: [colors.primary, colors.danger, colors.warning],
                grid: {
                    padding: {
                        bottom: -4
                    },
                    borderColor: colors.gridBorder,
                    xaxis: {
                        lines: {
                            show: true
                        }
                    }
                },
                series: [{
                        name: "Weekly Sale",
                        data: [
                            @foreach ($salesByDay as $date => $dailySales)
                                {{ $dailySales }},
                            @endforeach
                        ]
                    },
                    {
                        name: "Weekly Profit",
                        data: [
                            @foreach ($salesProfitByDay as $date => $dailyProfit)
                                {{ $dailyProfit }},
                            @endforeach
                        ]
                    },
                    {
                        name: "Weekly Purchase",
                        data: [
                            @foreach ($purchaseByDay as $date => $dailyPurchase)
                                {{ $dailyPurchase }},
                            @endforeach
                        ]
                    }
                ],
                xaxis: {
                    type: "datetime",
                    categories: [
                        @foreach ($salesByDay as $date => $salesCount)
                            '{{ $date }}',
                        @endforeach
                    ],
                    lines: {
                        show: true
                    },
                    axisBorder: {
                        color: colors.gridBorder,
                    },
                    axisTicks: {
                        color: colors.gridBorder,
                    },
                },
                markers: {
                    size: 0,
                },
                legend: {
                    show: true,
                    position: "top",
                    horizontalAlign: 'center',
                    fontFamily: fontFamily,
                    itemMargin: {
                        horizontal: 8,
                        vertical: 0
                    },
                },
                stroke: {
                    width: 3,
                    curve: "smooth",
                    lineCap: "round"
                },
            };
            var apexLineChart = new ApexCharts(document.querySelector("#apexLine1"), lineChartOptions);
            apexLineChart.render();


            // pie chart 
            var options = {
                chart: {
                    height: 300,
                    type: "pie",
                    foreColor: colors.bodyColor,
                    background: colors.cardBg,
                    toolbar: {
                        show: false
                    },
                },
                theme: {
                    mode: 'dark'
                },
                tooltip: {
                    theme: 'dark'
                },
                colors: [colors.primary, colors.warning, colors.danger, colors.info, colors.success],
                legend: {
                    show: true,
                    position: "top",
                    horizontalAlign: 'center',
                    fontFamily: fontFamily,
                    itemMargin: {
                        horizontal: 8,
                        vertical: 0
                    },
                },
                stroke: {
                    colors: ['rgba(0,0,0,0)']
                },
                dataLabels: {
                    enabled: false
                },
                series: [
                    @foreach ($bankLabels as $element)
                        {{ $element['amount'] }},
                    @endforeach
                ],
                labels: [
                    @foreach ($bankLabels as $label)
                        {{ $label['name'] }},
                    @endforeach
                ],
            };

            var chart = new ApexCharts(document.querySelector("#apexPie1"), options);
            chart.render();
        });
    </script>
    {{-- /// pie chart end /// --}}
    <br>
    {{-- total chart  --}}
    @php
        $salesByMonth = [];
        $profitsByMonth = [];
        $purchasesByMonth = [];

        for ($i = 0; $i < 12; $i++) {
            $monthStart = now()->subMonths($i)->startOfMonth();
            $monthEnd = now()->subMonths($i)->endOfMonth();

            $monthlySales = App\Models\Sale::whereBetween('sale_date', [$monthStart, $monthEnd])->sum('receivable');
            $monthlyProfit = App\Models\Sale::whereBetween('sale_date', [$monthStart, $monthEnd])->sum('profit');
            $monthlyPurchase = App\Models\Purchase::whereBetween('purchse_date', [$monthStart, $monthEnd])->sum(
                'grand_total',
            );

            $salesByMonth[$monthStart->format('Y-m')] = $monthlySales;
            $profitsByMonth[$monthStart->format('Y-m')] = $monthlyProfit;
            $purchasesByMonth[$monthStart->format('Y-m')] = $monthlyPurchase;
        }

    @endphp
    <div class="row">
        <div class="col-xl-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h6 class="card-title">Monthly Profit</h6>
                    <div id="apexLine2"></div>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            var colors = {
                primary: "#6571ff",
                secondary: "#7987a1",
                success: "#05a34a",
                info: "#66d1d1",
                warning: "#fbbc06",
                danger: "#ff3366",
                light: "#e9ecef",
                dark: "#060c17",
                muted: "#7987a1",
                gridBorder: "rgba(77, 138, 240, .15)",
                bodyColor: "#b8c3d9",
                cardBg: "#0c1427"
            }

            var fontFamily = "'Roboto', Helvetica, sans-serif"

            var lineChartOptions = {
                chart: {
                    type: "line",
                    height: '320',
                    parentHeightOffset: 0,
                    foreColor: colors.bodyColor,
                    background: colors.cardBg,
                    toolbar: {
                        show: false
                    },
                },
                theme: {
                    mode: 'dark'
                },
                tooltip: {
                    theme: 'dark'
                },
                colors: [colors.success, colors.info, colors.primary],
                grid: {
                    padding: {
                        bottom: -4
                    },
                    borderColor: colors.gridBorder,
                    xaxis: {
                        lines: {
                            show: true
                        }
                    }
                },
                series: [{
                        name: "Monthly Sale",
                        data: [
                            @foreach ($salesByMonth as $month => $monthlySales)
                                {{ $monthlySales }},
                            @endforeach
                        ]
                    },
                    {
                        name: "Monthly Profit",
                        data: [
                            @foreach ($profitsByMonth as $month => $monthlyProfit)
                                {{ $monthlyProfit }},
                            @endforeach
                        ]
                    },
                    {
                        name: "Monthly Purchase",
                        data: [
                            @foreach ($purchasesByMonth as $month => $monthlyPurchase)
                                {{ $monthlyPurchase }},
                            @endforeach
                        ]
                    }
                ],
                xaxis: {
                    type: "datetime",
                    categories: [
                        @foreach ($salesByMonth as $month => $salesCount)
                            '{{ $month }}-01',
                        @endforeach
                    ],
                    lines: {
                        show: true
                    },
                    axisBorder: {
                        color: colors.gridBorder,
                    },
                    axisTicks: {
                        color: colors.gridBorder,
                    },
                },
                markers: {
                    size: 0,
                },
                legend: {
                    show: true,
                    position: "top",
                    horizontalAlign: 'center',
                    fontFamily: fontFamily,
                    itemMargin: {
                        horizontal: 8,
                        vertical: 0
                    },
                },
                stroke: {
                    width: 3,
                    curve: "smooth",
                    lineCap: "round"
                },
            };
            var apexLineChart = new ApexCharts(document.querySelector("#apexLine2"), lineChartOptions);
            apexLineChart.render();
        });
    </script>
@endsection
