@extends('master')
@section('title', '| Low Stock Report')
@section('admin')
<nav class="page-breadcrumb d-flex justify-content-between align-items-center">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
        <li class="breadcrumb-item active" aria-current="page">Low Stock Report</li>
    </ol>
    <!-- Button at the end of the breadcrumb -->
    <a href="{{route('report.low.stock')}}" class="btn btn-primary">Back</a>
</nav>

    <div class="row">
        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <h6 class="card-title">Branch : {{$branch->name }} Low Stock Table</h6>
                    <div class="table-responsive">
                        <table id="example" class="table">
                            <thead>
                                <tr>
                                    <th class="id">#</th>
                                    <th>Image</th>
                                    <th>Product</th>
                                    <th>Category</th>
                                    <th>Price</th>
                                    <th>Purchased</th>
                                    <th>Sold</th>
                                    <th>Damaged</th>
                                    <th>Returned</th>
                                    <th>Available Stock</th>
                                    <th>Sell Value</th>
                                    <th>Profit</th>
                                    <th class="id">Action</th>
                                </tr>
                            </thead>

                            <tbody id="showData">
                                @if ($products->count() > 0)
                                @foreach ($products as $index => $data)
                                    {{-- @dd($data->damage); --}}
                                    <tr>
                                        <td class="id">{{ $index + 1 }}</td>
                                        <td>
                                            @if ($data->image > 0)
                                                <img src="{{ asset('uploads/product/' . $data->image) }}" alt="product Image">
                                            @else
                                                <img src="{{ asset('dummy/image.jpg') }}" alt="product Image">
                                            @endif

                                        </td>
                                        <td>{{ $data->name ?? '' }}</td>
                                        <td>
                                            {{ $data->category->name ?? '' }}
                                        </td>
                                        {{-- purchase --}}
                                        @php

                                            $branchId = Auth::user()->branch_id;
                                            $totalPurchase = App\Models\PurchaseItem::whereHas('Purchas', function ($query) use ($branchId) {
                                                $query->where('branch_id', $branchId);
                                            })->where('product_id', $data->id)
                                            ->sum('quantity');
                                            $saleItems = App\Models\SaleItem::where('product_id', $data->id)->get();
                                            $totalSalePrice = $saleItems->sum('sub_total');
                                            $totalsaleQuantity = $saleItems->sum('qty');
                                            $totalCost = $data->cost * $totalsaleQuantity;
                                            $totalProfit = $totalSalePrice - $totalCost;
                                            $totalDamage = $data->damage->sum('qty');
                                          @endphp
                                        <td>
                                            {{ $totalPurchase  }} {{ $data->unit->name }}
                                        </td>

                                        {{-- sold  --}}
                                        <td>
                                            {{ $data->total_sold ?? 0 }} {{ $data->unit->name }}
                                        </td>

                                        {{-- damage  --}}
                                        <td>
                                            {{ $totalDamage ?? 0 }} {{ $data->unit->name }}
                                        </td>
                                        <td>{{ $data->cost ?? 0 }}</td>
                                        <td>
                                            ৳ {{ $data->price ?? 0 }}
                                        </td>
                                        <td>
                                            @if ($data->stock_quantity_sum <= 10)
                                                <span class="text-danger">
                                                    {{ $data->stock_quantity_sum ?? 0 }} {{ $data->unit->name }}
                                                </span>
                                            @else
                                                {{ $data->stock_quantity_sum ?? 0 }} {{ $data->unit->name }}
                                            @endif
                                        </td>
                                        <td>
                                            ৳ {{ $totalSalePrice ?? 0 }}
                                        </td>
                                        <td>
                                            <span>৳</span> {{ $data->total_stock_value}}
                                        </td>
                                        <td>
                                            ৳ {{ $totalProfit ?? 0 }}
                                        </td>

                                    </tr>

                                @endforeach
                            @else
                                <tr>
                                    <td colspan="">No Data Found</td>
                                </tr>
                            @endif

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>
@endsection
