@extends('master')
@section('admin')
    <nav class="page-breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
            <li class="breadcrumb-item active" aria-current="page">Monthly Report</li>
        </ol>
    </nav>

    <div class="row">
        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h6 class="card-title">Monthly Report</h6>
                    <div class="table-responsive">
                        <table id="example" class="table">
                            <thead>
                                <tr>
                                    <th class="id">#</th>
                                    <th>Date</th>
                                    <th>Purchase</th>
                                    <th>Sale</th>
                                    <th>Profit</th>
                                    <th>Expanse</th>
                                    <th>Salary</th>
                                    <th>Due Collection</th>
                                    <th>Other Collection</th>
                                    <th>Adjust Due Collection</th>
                                    <th>Add Balance</th>
                                    <th>Via Sale</th>
                                    <th>Net Profit</th>
                                    {{-- <th class="id">Action</th> --}}
                                </tr>
                            </thead>
                            {{-- @dd($monthlyReports) --}}
                            <tbody id="showData">
                                @php
                                    $key = 1;
                                @endphp
                                @foreach ($dailyReports as $report)
                                    <tr>
                                        <td>{{ $key }}</td>
                                        @php
                                            $key++;
                                        @endphp
                                        <td>{{ $report['date'] }}</td>
                                        <td> {{ number_format($report['totalPurchaseCost'], 2) }}</td>
                                        <td> {{ number_format($report['totalSale'], 2) }}</td>
                                        <td> {{ number_format($report['totalProfit'], 2) }}</td>
                                        <td> {{ number_format($report['totalExpense'], 2) }}</td>
                                        <td> {{ number_format($report['totalSalary'], 2) }}</td>
                                        <td> {{ number_format($report['dueCollection'], 2) }}</td>
                                        <td> {{ number_format($report['otherCollection'], 2) }}</td>
                                        <td> {{ number_format($report['adjustDueCollection'], 2) }}</td>
                                        <td> {{ number_format($report['addBalance'], 2) }}</td>
                                        <td> {{ number_format($report['viaSale'], 2) }}</td>
                                        <td> {{ number_format($report['finalProfit'], 2) }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
