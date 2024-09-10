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
            <td>{{ $data->price ?? 0 }}</td>
            {{-- purchase --}}
            @php
                $purchaseItems = App\Models\PurchaseItem::where('product_id', $data->id)->get();
                $totalPurchase = $purchaseItems->sum('quantity');

                $saleItems = App\Models\SaleItem::where('product_id', $data->id)->get();
                $totalSalePrice = $saleItems->sum('sub_total');
                $totalsaleQuantity = $saleItems->sum('qty');
                $totalCost = $data->cost * $totalsaleQuantity;
                $totalProfit = $totalSalePrice - $totalCost;

                $totalDamage = $data->damage->sum('qty');
            @endphp
            <td>
                {{ $totalPurchase ?? 0 }} {{ $data->unit->name }}
            </td>

            {{-- sold  --}}
            <td>
                {{ $data->total_sold ?? 0 }} {{ $data->unit->name }}
            </td>

            {{-- damage  --}}
            <td>
                {{ $totalDamage ?? 0 }} {{ $data->unit->name }}
            </td>
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
                ৳ {{ $totalProfit ?? 0 }}
            </td>

        </tr>
    @endforeach
@else
    <tr>
        <td colspan="9"> No Data Found</td>
    </tr>
@endif
