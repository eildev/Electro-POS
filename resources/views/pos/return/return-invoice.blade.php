@extends('master')
@section('admin')
    @php
        $branch = App\Models\Branch::findOrFail($sale->branch_id);
        $customer = App\Models\Customer::findOrFail($sale->customer_id);
        $sale_items = App\Models\SaleItem::where('sale_id', $sale->id)->get();

    @endphp

    <style>

    </style>
    <div class="row ">
        <div class="col-md-12 stretch-card">
            <div class="card">
                <div class="card-body">
                    <h6 class="card-title text-info">Add Return Product</h6>
                    @csrf
                    <div class="row">
                        <!-- Col -->
                        <div class="mb-3 col-md-6">

                            <label for="" class="form-label">Product <span class="text-danger">*</span></label>

                            <div class="d-flex g-3">

                                <select class="js-example-basic-single form-select product_select" data-width="100%">

                                    @if ($sale_items->count() > 0)
                                        <option selected disabled>Select Returned Product</option>
                                        @foreach ($sale_items as $product)
                                            <option value="{{ $product->id }}"
                                                {{ old('product_id') == $product->id ? 'selected' : '' }}>
                                                {{ $product->product->name }}
                                                ({{ $product->qty}})
                                            </option>
                                        @endforeach
                                    @else
                                        <option selected disabled>Please Add Product</option>
                                    @endif
                                </select>
                            </div>
                        </div>

                        <div class="col-sm-6">
                            <div class="mb-3 form-valid-groups">
                                <label class="form-label">Date<span class="text-danger">*</span></label>
                                <div class="input-group flatpickr me-2 mb-2 mb-md-0" id="dashboardDate">
                                    <span class="input-group-text input-group-addon bg-transparent border-primary"
                                        data-toggle><i data-feather="calendar" class="text-primary"></i></span>
                                    <input type="text" name="date"
                                        class="form-control bg-transparent border-primary return_date" value=""
                                        placeholder="Select date" data-input>
                                </div>
                                {{-- <input type="date"  class="form-control" placeholder="Enter Date"> --}}
                            </div>
                        </div><!-- Col -->
                        <div class="col-sm-6">
                            <div class="mb-3">
                                <label class="form-label">Note</label>
                                <textarea name="note" class="form-control return_purpose" value="{{ old('note') }}"
                                    placeholder="Write About Damages" rows="4" cols="50"></textarea>
                            </div>
                        </div><!-- Col -->
                    </div><!-- Row -->
                    <div>
                        <input type="submit" id="submit_btn" class="btn btn-primary submit" value="Save" disabled>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12 mb-1 grid-margin stretch-card">
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
                                    <th>Total</th>
                                    <th>
                                        Action
                                    </th>
                                </tr>
                            </thead>
                            <tbody class="showData">
                            </tbody>
                        </table>
                    </div>


                    <div class="col-md-6">
                        <div id="" class="table-responsive">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <td>Product Total</td>
                                        <td class="text-end">
                                            <span class="all_product_total"></span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="my-3">
                        <button class="btn btn-primary return_btn"><i class="fa-solid fa-money-check-dollar"></i>
                            Make Invoice</button>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <script>
        $(document).ready(function() {
            // show Product function
            function showAddProduct(sale_items) {
                let old_subtotal = sale_items.sub_total;
                let old_quantity = sale_items.qty;
                let max_return_price = parseFloat(old_subtotal / old_quantity);

                $('.showData').append(
                    `<tr class="data_row${sale_items.id}" product-id="${sale_items.id}">
                        <td>
                            ${sale_items.product.name}
                        </td>
                        <td>
                            <input type="number" product-id="${sale_items.id}" class="form-control return_price product_price${sale_items.id}" old_price="${max_return_price ?? 0}" id="product_price" name="return_price[]" value="${max_return_price ?? 0}" />
                        </td>
                        <td>
                            <input type="number" product-id="${sale_items.id}" maxLength="${sale_items.qty}" old_quantity="${sale_items.qty ?? 0}" class="form-control quantity productQuantity${sale_items.id}" name="quantity[]" value="1" />
                        </td>


                        <td><input type="number" class="form-control subTotal border-0 productTotal${sale_items.id}" old_subtotal="${sale_items.sub_total ?? 0}" name="total_price[]" id="productTotal" readonly value="${max_return_price ?? 0}" /></td>

                        <td style="padding-top: 20px;">
                            <a href="#" class="btn btn-sm btn-danger btn-icon purchase_delete" style="font-size: 8px; height: 25px; width: 25px;" data-id=${sale_items.id}>
                                <i class="fa-solid fa-trash-can" style="font-size: 0.8rem; margin-top: 2px;"></i>
                            </a>
                        </td>
                    </tr>`
                );

            }

            function calculateMaxReturnQuantity(productId, quantity) {
                let max_quantity = $(`.productQuantity${productId}`).attr('maxLength');
                let unitPrice = parseFloat($(`.product_price${productId}`).val());

                if (quantity > max_quantity) {
                    toastr.warning('Quantity should not exceed ' + max_quantity);
                    $(`.productQuantity${productId}`).val(max_quantity);
                    let subTotal = unitPrice * max_quantity;
                    $(`.productTotal${productId}`).val(subTotal);
                    calculateProductTotal();
                } else if (quantity < 1) {
                    toastr.warning('Quantity should not less than 1');
                    $(`.productQuantity${productId}`).val(1);
                    let subTotal = unitPrice * 1;
                    $(`.productTotal${productId}`).val(subTotal);
                    calculateProductTotal();
                } else {
                    let subTotal = unitPrice * quantity;
                    $(`.productTotal${productId}`).val(subTotal);
                    calculateProductTotal();
                }
            }

            // Function to calculate the subtotal for each product
            $(document).on('keyup', '.quantity', function() {
                let productId = $(this).attr('product-id');
                let quantity = parseInt($(this).val());
                calculateMaxReturnQuantity(productId, quantity);

            });

            $(document).on('click', '.quantity', function() {
                let productId = $(this).attr('product-id');
                let quantity = parseInt($(this).val());
                calculateMaxReturnQuantity(productId, quantity);
            });

            function calculateReturnPrice(productId, return_price) {

                let quantity = parseInt($(`.productQuantity${productId}`).val());
                let max_return_price = $(`.product_price${productId}`).attr('old_price');

                if (max_return_price < return_price) {
                    toastr.warning('Return Price should not exceed selling price. Your Selling Price is' +
                        max_return_price);
                    $(`.product_price${productId}`).val(max_return_price);

                    let subTotal = max_return_price * quantity;
                    $(`.productTotal${productId}`).val(subTotal);
                    calculateProductTotal();
                } else {
                    let subTotal = return_price * quantity;
                    $(`.productTotal${productId}`).val(subTotal);
                    calculateProductTotal();
                }
            }

            $(document).on('keyup', '.return_price', function() {
                // alert('Return price');
                let productId = $(this).attr('product-id');
                let return_price = parseFloat($(this).val());
                calculateReturnPrice(productId, return_price);
            });

            $(document).on('click', '.return_price', function() {
                let productId = $(this).attr('product-id');
                let return_price = parseFloat($(this).val());
                calculateReturnPrice(productId, return_price);
            });

            // Select product
            $(document).on('change', '.product_select', function() {
                let id = $(this).val();
                if ($(`.data_row${id}`).length === 0 && id) {
                    $.ajax({
                        url: '/return/find/' + id,
                        type: 'GET',
                        dataType: 'JSON',
                        success: function(res) {
                            showAddProduct(res.sale_items);
                            calculateProductTotal();
                        }
                    });
                }
            });

            // Purchase delete
            $(document).on('click', '.purchase_delete', function(e) {
                let id = $(this).attr('data-id');
                let dataRow = $('.data_row' + id);
                dataRow.remove();
                calculateProductTotal();
            });

            // Function to calculate the grand total from all products
            function calculateProductTotal() {
                let allProductTotal = document.querySelectorAll('#productTotal');
                let allTotal = 0;
                allProductTotal.forEach(product => {
                    let productValue = parseFloat(product.value);
                    if (!isNaN(productValue)) {
                        allTotal += productValue;
                    }
                });

                $('.all_product_total').text(allTotal.toFixed(2));
            }
            calculateProductTotal();

            function returnInvoice() {

                let sale_id = '{{ $sale->id }}';
                let customer_id = '{{ $customer->id }}';
                let return_date = $('.return_date').val();
                let formattedReturnDate = moment(return_date, 'DD-MMM-YYYY').format('YYYY-MM-DD HH:mm:ss');

                let refund_amount = parseFloat($('.all_product_total').text());
                let note = $('.return_purpose').val();

                let sale_items = [];

                $('tr[class^="data_row"]').each(function() {
                    let row = $(this);
                    // Get values from the current row's elements

                    let product_id = parseInt($(this).attr('product-id'));
                    let quantity = row.find('input[name="quantity[]"]').val();
                    let return_price = row.find('input[name="return_price[]"]').val();

                    let total_price = row.find('input[name="total_price[]"]').val();
                    // console.log(productDiscount);

                    let product = {
                        product_id,
                        quantity,
                        return_price,
                        total_price
                    };

                    // Push the object into the products array
                    sale_items.push(product);
                });
                // console.log(products);

                let allData = {
                    sale_id,
                    customer_id,
                    formattedReturnDate,
                    refund_amount,
                    note,
                    sale_items
                }

                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });

                $.ajax({
                    url: '/return/store',
                    type: 'POST',
                    data: allData,
                    success: function(res) {
                        if (res.status == 200) {
                            toastr.success(res.message);
                            window.location.href = '/return/products/list';
                        } else {
                            // console.log(res);
                            toastr.warning("Something Went Wrong");
                        }
                    }
                });
            }

            // order btn
            $('.return_btn').click(function(e) {
                e.preventDefault();
                returnInvoice();
            })
        })
    </script>
    <style>
        .table> :not(caption)>*>* {
            padding: 0px 10px !important;
        }

        .margin_left_m_14 {
            margin-left: -14px;
        }

        .w_40 {
            width: 250px !important;
            text-wrap: wrap;
        }

        @if ($sale->due <= 0)
            .stamp-image {
                position: absolute !important;
                top: 50% !important;
                left: 50% !important;
                transform: translate(-50%, -50%);
                height: 220px !important;
                opacity: 0.3 !important;
                display: block;
            }
        @else
            .stamp-image {
                display: none !important;
                opacity: 0 !important;
            }
        @endif

        @if ($sale->due <= 0)
            .stamp-image {
                position: absolute !important;
                top: 20px;
                left: 50%;
                transform: translateX(-50%);
                height: 220px !important;
                opacity: 0.5 !important;
                display: block;
            }
        @else
            .stamp-image {
                display: none !important;
                opacity: 0 !important;
            }
        @endif

        @media print {
            @if ($invoice_type == 'a4')
                @page {
                    size: A4;
                }
            @elseif($invoice_type == 'a5')
                @page {
                    size: A5;
                }
            @endif
            nav,
            .footer {
                display: none !important;
            }

            .page-content {
                margin-top: 0 !important;
                padding-top: 0 !important;
                min-height: 740px !important;
                /* background-color: #eec6a1 !important; */
                /* background-color: #cce9fa !important; */
                background-color: #ffffff !important;
                /* border: 1px solid #29ADF9; */
            }

            .btn_group {
                display: none !important;
            }

            .total_calculation {
                float: right !important;
                /* margin-right: -40px; */
                width: 50%;
                color: #000
            }

            .card-body {
                padding: 0px !important;
                margin-left: 0px !important;
            }

            .card {
                /* padding: 0px !important; */
                /* margin: 0px !important; */
            }

            .main-wrapper .page-wrapper .page-content {
                /* margin-left: -10px !important; */
                padding: 0px;

            }

            .margin_left_m_14 {
                margin-left: -14px;
            }

            .w_40 {
                width: 240px !important;
            }

            /*.table> :not(caption)>*>* {*/
            /*    padding: 0px 10px !important;*/
            /*}*/

            .invoice_bg {
                background-color: #ffffff !important;
                /* background-color: #cce9fa !important; */
                /* background-color: #eec6a1 !important; */
                color: #000 !important;
                height: 740px;
            }

            .invoice_table_bg {
                /* background-color: rgb(241, 204, 204) !important; */
                color: #000000 !important;
                border-color: #29ADF9;
            }

            .invoice_table_th_bg {
                background-color: #29ADF9 !important;
                color: #000000 !important;
            }

            .invoice_table_th_bg th {

                color: #000000 !important;
            }

            .total_calculation_bg {
                color: #000 !important;
            }

            .print_bg_white {
                background-color: transparent !important;
            }
        }
    </style>

    <script>
        function setPaperSize('$invoice_type') {
            let styleElement = document.getElementById('print-style');

            if (!styleElement) {
                styleElement = document.createElement('style');
                styleElement.id = 'print-style';
                document.head.appendChild(styleElement);
            }

            let sizeCss;

            switch (size) {
                case 'a4':
                    sizeCss = '@page { size: A4; }';
                    break;
                case 'a5':
                    sizeCss = '@page { size: A5; }';
                    break;
                case 'letter':
                    sizeCss = '@page { size: letter; }';
                    break;
                case 'custom':
                    sizeCss = '@page { size: 210mm 297mm; }'; // Example for A4 size in custom dimensions
                    break;
                default:
                    sizeCss = '@page { size: auto; }'; // Default
            }

            styleElement.innerHTML = `
                @media print {
                    ${sizeCss}
                }
            `;
        }
    </script>
@endsection
