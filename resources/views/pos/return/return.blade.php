@extends('master')
@section('title', '| Return')
@section('admin')
    @php
        $customer = App\Models\Customer::findOrFail($sale->customer_id);
        $saleItems = App\Models\SaleItem::where('sale_id', $sale->id)->get();
    @endphp
    <div class="row mt-0">
        <div class="col-lg-4 grid-margin stretch-card mb-3">
            <div class="card">
                <div class="card-body px-4 py-2">
                    <div class="row">
                        <div class="col-md-12">
                            <h6 class="card-title">Basic Details</h6>
                            <div class="row">
                                <label for="exampleInputUsername2" class="col-sm-6 col-form-label">Order Id </label>
                                <div class="col-sm-6">
                                    <label for="exampleInputUsername2" class="col-form-label"><b>:
                                        </b>{{ $sale->invoice_number ?? 00 }}</label>
                                </div>
                            </div>
                            <div class="row">
                                <label for="exampleInputEmail2" class="col-sm-6 col-form-label">Customer Name</label>
                                <div class="col-sm-6">
                                    <label for="exampleInputUsername2" class="col-form-label"><b>:
                                        </b>{{ $sale->customer->name ?? '' }}</label>
                                </div>
                            </div>
                            <div class="row">
                                <label for="exampleInputMobile" class="col-sm-6 col-form-label">Product Price</label>
                                <div class="col-sm-6">
                                    <label for="exampleInputUsername2" class="col-form-label"><b>:
                                        </b>{{ $sale->total ?? 0 }}</label>
                                </div>
                            </div>
                            <div class="row">
                                <label for="exampleInputUsername2" class="col-sm-6 col-form-label">Discount </label>
                                <div class="col-sm-6">
                                    <label for="exampleInputUsername2" class="col-form-label"><b>:
                                            {{ $sale->actual_discount ?? 0 }}</b></label>
                                </div>
                            </div>
                            <div class="row">
                                <label for="exampleInputEmail2" class="col-sm-6 col-form-label">Total Receivable:</label>
                                <div class="col-sm-6">
                                    <label for="exampleInputUsername2" class="col-form-label"><b>:
                                            {{ $sale->receivable ?? 0 }}</b></label>
                                </div>
                            </div>
                            <div class="row">
                                <label for="exampleInputMobile" class="col-sm-6 col-form-label">Total Paid:</label>
                                <div class="col-sm-6">
                                    <label for="exampleInputUsername2" class="col-form-label"><b>:
                                            {{ $sale->paid ?? 0 }}</b></label>
                                </div>
                            </div>
                            <div class="row">
                                <label for="exampleInputMobile" class="col-sm-6 col-form-label">Due</label>
                                <div class="col-sm-6">
                                    <label for="exampleInputUsername2" class="col-form-label"><b>:
                                            {{ $sale->due > 0 ? $sale->due : 0 }}</b></label>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="exampleInputMobile" class="col-sm-6 col-form-label">Returned Product
                                    Value</label>
                                <div class="col-sm-6">
                                    <label for="exampleInputUsername2" class="col-form-label"><b>:
                                            00</b></label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-7 grid-margin stretch-card">
            <div class="card">
                <div class="card-body px-4 py-2">
                    <div class="mb-3">
                        <h6 class="card-title">Items</h6>
                    </div>

                    <div id="" class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Product</th>
                                    <th>Price</th>
                                    <th>Qty</th>
                                    <th>Discount</th>
                                    <th>Sub Total</th>
                                    <th>
                                        Action
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                @if ($saleItems->count() > 0)
                                    @foreach ($saleItems as $saleItem)
                                        <tr>
                                            <td>{{ $saleItem->product['name'] }}</td>
                                            <td>{{ $saleItem->rate }}</td>
                                            <td>{{ $saleItem->qty }}</td>
                                            <td>{{ $saleItem->discount }}</td>
                                            <td>{{ $saleItem->sub_total }}</td>
                                            <td>
                                                <a href="#" class="btn btn-sm btn-danger no_return_btn">
                                                    No Return
                                                </a>
                                            </td>
                                        </tr>
                                    @endforeach
                                @else
                                    <tr>
                                        <td colspan="6">No Product to Return</td>
                                    </tr>
                                @endif
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="5" class="text-end">
                                        Total
                                        <br>
                                        Discount
                                        <br>
                                        Total Due
                                        <br>
                                        Grand Total
                                        <br>
                                        <br>
                                        <br>
                                        <br>
                                    <td colspan="1" class="text-end">
                                        {{ $sale->total ?? 0 }} <br>
                                        {{ $sale->actual_discount ?? 0 }} <br>
                                        {{ $sale->due > 0 ? $sale->due : 0 }} <br>
                                        {{ $sale->final_receivable ?? 0 }} <br>
                                        <br>
                                        <button class="btn btn-primary">
                                            Return Products
                                        </button>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        #printFrame {
            display: none;
        }
    </style>
    <iframe id="printFrame" src="" width="0" height="0"></iframe>

    <script>
        $(document).ready(function() {

            $(document).on('click', '.no_return_btn', function(e) {
                e.preventDefault();
                $(this).closest('tr').hide();
            });


            $(document).on('click', '.return_product', function(e) {
                e.preventDefault();
                let id = $(this).attr('data-id');
                // alert(id);

                let saleId = '{{ $sale->id }}';
                let customer_id = $('.select-customer').val();
                let sale_date = $('.purchase_date').val();
                let formattedSaleDate = moment(sale_date, 'DD-MMM-YYYY').format('YYYY-MM-DD HH:mm:ss');
                let quantity = totalQuantity;
                let total_amount = parseFloat($('.total').val());
                let discount = $('.discount_field').val();
                let total = parseFloat($('.grand_total').val());
                let tax = $('.tax').val();
                let change_amount = parseFloat($('.grandTotal').val());
                let actual_discount = change_amount - total;
                let paid = $('.total_payable').val();
                let due = $('.total_due').val();
                let note = $('.note').val();
                let payment_method = $('.payment_method').val();
                let product_id = $('.product_id').val();
                let newPay = $('.newPay').val();
                // console.log(saleId, quantity, total_amount, discount, total, change_amount, actual_discount,
                //     paid, due, payment_method, product_id);


                let products = [];

                $('tr[class^="data_row"]').each(function() {
                    let row = $(this);
                    // Get values from the current row's elements
                    let product_id = row.find('.product_id').val();
                    let quantity = row.find('input[name="quantity[]"]').val();
                    let unit_price = row.find('input[name="unit_price[]"]').val();
                    let discount_amount = row.find(`span[class='discount_amount${product_id}']`)
                        .text() || 0;
                    let discount_percentage = (row.find(
                        `span[class='discount_percentage${product_id}']`).text()) || 0;
                    let total_price = row.find('input[name="total_price[]"]').val();

                    // Create an object with the gathered data
                    let product = {
                        product_id,
                        quantity,
                        unit_price,
                        discount: discount_amount == 0 ? discount_percentage : 0,
                        total_price
                    };

                    // Push the object into the products array
                    products.push(product);
                });

                let sale_id = '{{ $sale->id }}'

                let allData = {
                    // for purchase table
                    sale_id,
                    customer_id,
                    sale_date: formattedSaleDate,
                    quantity,
                    total_amount,
                    discount,
                    actual_discount,
                    total,
                    change_amount,
                    tax,
                    paid,
                    due,
                    note,
                    payment_method,
                    products,
                    id,
                    newPay
                }
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                $.ajax({
                    url: '/return/item/store',
                    type: 'POST',
                    data: allData,
                    success: function(res) {
                        if (res.status == 200) {
                            let dataRow = $('.data_row' + id);
                            dataRow.remove();
                            // Recalculate grand total
                            updateGrandTotal();
                            updateTotalQuantity();
                            newPaidAmount();
                            toastr.success(res.message);
                        } else {
                            let dataRow = $('.data_row' + id);
                            dataRow.remove();

                            updateGrandTotal();
                            updateTotalQuantity();
                            newPaidAmount();
                            toastr.success(res.message);
                        }

                    }
                })
            })
        });
    </script>


@endsection
