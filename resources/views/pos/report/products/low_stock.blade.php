@extends('master')
@section('title', '| Low Stock Report')
@section('admin')
    <nav class="page-breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
            <li class="breadcrumb-item active" aria-current="page">Low Stock Report</li>
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
                            <h6 class="card-title">Low Stock Table</h6>
                        @foreach ($bracnhes as $branch)
                            <a href="{{ route('branch.low.stock', ['branch' => $branch->id]) }}"  class="btn" style="background-color: #0d6efd">{{$branch->name}}</a>
                        @endforeach
                        </div>
                    </div>
                </div>
        @else
        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h6 class="card-title">Low Stock Table</h6>
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
                            {{-- @dd($products) --}}
                            <tbody id="showData">
                                @include('pos.report.products.stock_table')
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        @endif
    </div>
@endsection
