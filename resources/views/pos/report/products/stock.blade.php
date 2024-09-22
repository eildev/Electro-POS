@extends('master')
@section('title', '| Stock Report')
@section('admin')
    <nav class="page-breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
            <li class="breadcrumb-item active" aria-current="page">Stock Report</li>
        </ol>
    </nav>

    <div class="row">

        @if(Auth::user()->id == 1)

        @php
            $bracnhes = App\Models\Branch::all();
        @endphp
        <div class="col-md-12 grid-margin stretch-card">
                    <div class="card">
                        <div class="card-body">
                            <h6 class="card-title">Stock Table</h6>
                        @foreach ($bracnhes as $branch)
                            <a href="{{ route('branch.stock', ['branch' => $branch->id]) }}"  class="btn" style="background-color: #0d6efd">{{$branch->name}}</a>
                        @endforeach
                        </div>
                    </div>
                </div>
        @else
        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h6 class="card-title">Stock Table</h6>
                    <div class="table-responsive">
                        <table id="example" class="table">
                            <thead>
                                <tr>
                                    <th class="id">#</th>
                                    <th>Image</th>
                                    <th>Product</th>
                                    <th>Category</th>
                                    <th>Purchased</th>
                                    <th>Sold</th>
                                    <th>Damaged</th>
                                    <th>Cost Price</th>
                                    <th>Sell Price</th>
                                    <th>Available Stock</th>
                                    <th>Sell Value</th>
                                    <th>Stock Value</th>
                                    <th>Profit</th>
                                </tr>
                            </thead>
                            <tbody id="showData">
                                @include('pos.report.products.stock_table')
                            </tbody>
                            <tfoot>
                                <td colspan="10"></td> <!-- Empty cells for alignment -->
                                <td class="text-right"><strong>Total Stock Value:</strong></td> <!-- Label in second last column -->
                                <td colspan="11"> <strong>৳ {{ $totalStockValueSum }}  </strong></td> <!-- Total value in last column -->
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        @endif

    </div>
@endsection
