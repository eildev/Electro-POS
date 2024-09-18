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
        <td colspan="9">No Data Found</td>
    </tr>
@endif
