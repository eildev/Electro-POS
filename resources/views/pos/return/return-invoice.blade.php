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
                                                ({{ $product->stock }} {{ $product->unit->name ?? '' }})
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
                                    <input type="text" name="date" class="form-control bg-transparent border-primary return_date"
                                        value="" placeholder="Select date" data-input>
                                </div>
                                {{-- <input type="date"  class="form-control" placeholder="Enter Date"> --}}
                            </div>
                        </div><!-- Col -->
                        <div class="col-sm-6">
                            <div class="mb-3">
                                <label class="form-label">Note</label>
                                <textarea name="note" class="form-control return_purpose" value="{{ old('note') }}" placeholder="Write About Damages"
                                    rows="4" cols="50"></textarea>
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


                    <div class="col-md-6" >
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
        <div class="col-md-12 ">
            <div class="card border-0 shadow-none invoice_bg">
                <div class="card-body ">
                    <div class="container-fluid d-flex justify-content-between">
                        <div class="col-lg-3 ps-0">
                            @if (!empty($invoice_logo_type))
                                @if ($invoice_logo_type == 'Name')
                                    <a href="#" class="noble-ui-logo logo-light d-block mt-3">{{ $siteTitle }}</a>
                                @elseif($invoice_logo_type == 'Logo')
                                    @if (!empty($logo))
                                        <img class="margin_left_m_14" height="90" width="150"
                                            src="{{ url($logo) }}" alt="logo">
                                    @else
                                        <p class="mt-1 mb-1 show_branch_name"><b>{{ $siteTitle }}</b></p>
                                    @endif
                                @elseif($invoice_logo_type == 'Both')
                                    @if (!empty($logo))
                                        <img class="margin_left_m_14" height="90" width="150"
                                            src="{{ url($logo) }}" alt="logo">
                                    @endif
                                    <p class="mt-1 mb-1 show_branch_name"><b>{{ $siteTitle }}</b></p>
                                @endif
                            @else
                                <a href="#" class="noble-ui-logo logo-light d-block mt-3">EIL<span>POS</span></a>
                            @endif
                            <p class="show_branch_address w_40">{{ $address ?? 'Banasree' }}</p>
                            <p class="show_branch_address">{{ $phone ?? '' }}, 01708008705, 01720389177</p>
                            <p class="show_branch_address">{{ $email ?? '' }}</p>



                            <!--<hr>-->


                            <p class="mt-2 mb-1 show_supplier_name"><span>Customer Name:</span>
                                <b>{{ $customer->name ?? '' }}</b>
                            </p>
                            @if ($customer->address)
                                <p class="show_supplier_address"><span>Address:</span> {{ $customer->address ?? '' }}</p>
                            @endif
                            @if ($customer->email)
                                <p class="show_supplier_email"><span>Email:</span> {{ $customer->email ?? '' }}</p>
                            @endif
                            <p class="show_supplier_phone"><span>Phone:</span> {{ $customer->phone ?? '' }}</p>

                        </div>
                        <div class="col-lg-3 pe-0 text-end">
                            <h4 class="fw-bolder text-uppercase text-end mt-4 mb-2">invoice</h4>
                            <h6 class="text-end mb-5 pb-4"># INV-{{ $sale->invoice_number ?? 0 }}</h6>
                            @if ($sale->due > 0)
                                <p class="text-end mb-1 mt-5">Due</p>
                                <h4 class="text-end fw-normal text-danger">৳ {{ $sale->due ?? 00.0 }}</h4>
                            @else
                                <p class="text-end mb-1 mt-5">Total Paid</p>
                                <h4 class="text-end fw-normal text-success">৳ {{ $sale->paid ?? 00.0 }}</h4>
                            @endif
                            <h6 class="mb-0 mt-2 text-end fw-normal"><span class="text-muted show_purchase_date">Invoice
                                    Date :</span> {{ $sale->sale_date ?? '' }}</h6>
                        </div>
                    </div>
                    <img src="{{ asset('assets/images/stamp.png') }}" class="img-fluid stamp-image" alt="">
                    <div class="container-fluid mt-2 d-flex justify-content-center w-100">
                        <div class="w-100">
                            {{-- @dd($products); --}}

                            <table class="table table-bordered invoice_table_bg">
                                <thead>
                                    <tr class="invoice_table_th_bg">
                                        <th>#</th>
                                        <th>Product Name</th>
                                        <th class="text-end">Warranty</th>
                                        <th class="text-end">Unit cost</th>
                                        <th class="text-end">Quantity</th>
                                        <th class="text-end">Discount</th>
                                        <th class="text-end">Total</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @if ($sale_items->count() > 0)
                                        @php $lastIndex = 0; @endphp
                                        @foreach ($sale_items as $index => $sale_item)
                                            <tr class="text-end">
                                                <td class="text-start">{{ $index + 1 }}</td>
                                                <td class="text-start">{{ $sale_item->product->name ?? '' }}</td>
                                                <td>{{ $sale_item->wa_duration ?? 0 }}</td>
                                                <td>{{ $sale_item->rate ?? 0 }}</td>
                                                <td>{{ $sale_item->qty ?? 0 }}</td>
                                                <td>{{ $sale_item->discount ?? 0 }}</td>
                                                <td>{{ $sale_item->sub_total ?? 0 }}</td>
                                            </tr>
                                            @php $lastIndex = $index + 1; @endphp
                                        @endforeach
                                        @for ($i = $lastIndex + 1; $i < 16; $i++)
                                            <tr class="text-end">
                                                <td class="text-start">{{ $i }}</td>
                                                <td class="text-start"></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                            </tr>
                                        @endfor
                                    @else
                                        <tr class="text-center">
                                            <td>Data Not Found</td>
                                        </tr>
                                    @endif
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="container-fluid mt-2">
                        <div class="row">
                            <div class="col-md-6 ms-auto total_calculation">
                                <div class="table-responsive">
                                    <table class="table">
                                        <tbody class="total_calculation_bg">
                                            <tr>
                                                @php
                                                    $productTotal = number_format($sale->total, 2);
                                                @endphp
                                                <td>Product Total</td>
                                                <td class="text-end">৳ {{ $productTotal }}</td>
                                            </tr>
                                            @php
                                                $subTotal = floatval($sale->total - $sale->actual_discount);
                                            @endphp
                                            @if ($sale->actual_discount > 0)
                                                @php
                                                    $subTotalFormatted = number_format($subTotal, 2);
                                                    $discount = number_format($sale->actual_discount, 2);
                                                @endphp
                                                <tr>
                                                    <td>Discount</td>
                                                    <td class="text-end">৳ {{ $discount }}</td>
                                                </tr>
                                                <tr>
                                                    <td class="text-bold-800">Sub Total</td>
                                                    <td class="text-bold-800 text-end">৳
                                                        {{ $subTotalFormatted }} </td>
                                                </tr>
                                            @endif

                                            @if ($sale->tax != null)
                                                <tr>
                                                    <td>TAX ({{ $sale->tax }}%)</td>
                                                    <td class="text-end">৳ {{ number_format($sale->receivable, 2) }} </td>
                                                </tr>
                                            @endif
                                            @if ($sale->receivable > $subTotal)
                                                @php
                                                    $previousDue = floatval($sale->receivable - $subTotal);
                                                    $previousDueFormatted = number_format($previousDue, 2);
                                                @endphp
                                                <tr>
                                                    <td class="text-bold-800">Previous Due</td>
                                                    <td class="text-bold-800 text-end">৳
                                                        {{ $previousDueFormatted }} </td>
                                                </tr>
                                            @endif

                                            <tr>
                                                <td class="text-bold-800">Grand Total</td>
                                                <td class="text-bold-800 text-end">৳
                                                    {{ number_format($sale->receivable, 2) }}
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>Paid</td>
                                                <td class="text-success text-end">৳ {{ number_format($sale->paid, 2) }}
                                                </td>
                                            </tr>

                                            @php
                                                $mode = App\models\PosSetting::all()->first();
                                            @endphp
                                            @if ($mode->dark_mode == 1)
                                                @if ($sale->due >= 0)
                                                    <tr class="">
                                                        <td class="text-bold-800 text-danger">Due</td>
                                                        <td class="text-bold-800 text-end text-danger ">৳
                                                            {{ number_format($sale->due, 2) }} </td>
                                                    </tr>
                                                @else
                                                    <tr class="">
                                                        <td class="text-bold-800">Return</td>
                                                        <td class="text-bold-800 text-end">৳
                                                            {{ number_format($sale->due, 2) }} </td>
                                                    </tr>
                                                @endif
                                            @else
                                                @if ($sale->due >= 0)
                                                    <tr class="bg-dark print_bg_white">
                                                        <td class="text-bold-800">Due</td>
                                                        <td class="text-bold-800 text-end text-danger">৳
                                                            {{ number_format($sale->due, 2) }} </td>
                                                    </tr>
                                                @else
                                                    <tr class="bg-dark print_bg_white">
                                                        <td class="text-bold-800">Return</td>
                                                        <td class="text-bold-800 text-end">৳
                                                            {{ number_format($sale->due, 2) }} </td>
                                                    </tr>
                                                @endif
                                            @endif

                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="container-fluid w-100 btn_group">
                        @if ($invoice_type == 'a4')
                            <a href="#" class="btn btn-outline-primary float-end mt-4 me-3"
                                onclick="window.print();"><i data-feather="printer" class="me-2 icon-md"></i>Print
                                Invoice</a>
                        @elseif($invoice_type == 'a5')
                            <a href="#" class="btn btn-outline-primary float-end mt-4" onclick="window.print();"><i
                                    data-feather="printer" class="me-2 icon-md"></i>Print Invoice</a>
                        @else
                            <a target="" href="{{ route('sale.print', $sale->id) }}"
                                class="btn btn-outline-primary float-end mt-4 "><i data-feather="printer"
                                    class="me-2 icon-md"></i>Print Invoice</a>
                        @endif
                    </div>

                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="w-100 mx-auto btn_group">
                <a href="{{ route('sale.view') }}" class="btn btn-primary  mt-4 ms-2"><i
                        class="fa-solid fa-arrow-rotate-left me-2"></i>Manage Sale</a>
                <a href="{{ route('sale') }}" class="btn btn-outline-primary mt-4"><i data-feather="plus-circle"
                        class="me-2 icon-md"></i>Sale</a>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {

            // show Product function
            function showAddProduct(product) {
                $('.showData').append(
                    `<tr class="data_row${product.id}" product-id="${product.id}">
                        <td>
                            ${product.product.name}
                        </td>
                        <td>
                            <input type="number" product-id="${product.id}" class="form-control return_price product_price${product.id}" old_price="${product.rate ?? 0}" id="product_price" name="return_price[]" value="${product.rate ?? 0}" />
                        </td>
                        <td>
                            <input type="number" product-id="${product.id}" maxLength="${product.qty}" old_quantity="${product.qty ?? 0}" class="form-control quantity productQuantity${product.id}" name="quantity[]" value="1" />
                        </td>


                        <td><input type="number" class="form-control subTotal border-0 productTotal${product.id}" old_subtotal="${product.sub_total ?? 0}" name="total_price[]" id="productTotal" readonly value="${product.rate ?? 0}" /></td>

                        <td style="padding-top: 20px;">
                            <a href="#" class="btn btn-sm btn-danger btn-icon purchase_delete" style="font-size: 8px; height: 25px; width: 25px;" data-id=${product.id}>
                                <i class="fa-solid fa-trash-can" style="font-size: 0.8rem; margin-top: 2px;"></i>
                            </a>
                        </td>
                    </tr>`
                );

            }

            // Function to calculate the subtotal for each product
            $(document).on('keyup', '.quantity', function() {
                let productId = $(this).attr('product-id');
                let unitPrice = parseFloat($(`.product_price${productId}`).val());
                let quantity = parseInt($(this).val());
                let max_quantity = $(this).attr('maxLength');

                if (quantity > max_quantity) {
                    toastr.warning('Quantity should not exceed ' + max_quantity);
                    $(this).val(max_quantity);
                    let subTotal = unitPrice * max_quantity;
                    $(`.productTotal${productId}`).val(subTotal);
                    calculateProductTotal();
                } else if (quantity < 1) {
                    toastr.warning('Quantity should not less than 1');
                    $(this).val(1);
                    let subTotal = unitPrice * 1;
                    $(`.productTotal${productId}`).val(subTotal);
                    calculateProductTotal();
                } else {
                    let subTotal = unitPrice * quantity;
                    $(`.productTotal${productId}`).val(subTotal);
                    calculateProductTotal();
                }

            });

            $(document).on('click', '.quantity', function() {
                let productId = $(this).attr('product-id');
                let unitPrice = parseFloat($(`.product_price${productId}`).val());
                let quantity = parseInt($(this).val());
                let max_quantity = $(this).attr('maxLength');

                if (quantity > max_quantity) {
                    toastr.warning('Quantity should not exceed ' + max_quantity);
                    $(this).val(max_quantity);
                    let subTotal = unitPrice * max_quantity;
                    $(`.productTotal${productId}`).val(subTotal);
                    calculateProductTotal();
                } else if (quantity < 1) {
                    toastr.warning('Quantity should not less than 1');
                    $(this).val(1);
                    let subTotal = unitPrice * 1;
                    $(`.productTotal${productId}`).val(subTotal);
                    calculateProductTotal();
                } else {
                    let subTotal = unitPrice * quantity;
                    $(`.productTotal${productId}`).val(subTotal);
                    calculateProductTotal();
                }
            });

            $(document).on('keyup', '.return_price', function() {
                let productId = $(this).attr('product-id');
                let return_price = parseFloat($(this).val());
                let quantity = parseInt($(`.productQuantity${productId}`).val());

                let old_subtotal = parseInt($(`.productTotal${productId}`).attr('old_subtotal'));
                let old_quantity = parseInt($(`.productQuantity${productId}`).attr('old_quantity'));
                let max_return_price = parseInt(old_subtotal) / parseInt(old_quantity);

                if (max_return_price < return_price) {

                    toastr.warning('Return Price should not exceed selling price. Your Selling Price is' + max_return_price);
                    $(this).val(max_return_price);

                    let subTotal = max_return_price * quantity;
                    $(`.productTotal${productId}`).val(subTotal);
                    calculateProductTotal();

                }else{
                    let subTotal = return_price * quantity;
                    $(`.productTotal${productId}`).val(subTotal);
                    calculateProductTotal();
                }
            });
            $(document).on('click', '.return_price', function() {
                let productId = $(this).attr('product-id');
                let return_price = parseFloat($(this).val());
                let quantity = parseInt($(`.productQuantity${productId}`).val());

                let old_subtotal = parseInt($(`.productTotal${productId}`).attr('old_subtotal'));
                let old_quantity = parseInt($(`.productQuantity${productId}`).attr('old_quantity'));
                let max_return_price = parseInt(old_subtotal) / parseInt(old_quantity);

                if (max_return_price < return_price) {

                    toastr.warning('Return Price should not exceed selling price. Your Selling Price is' + max_return_price);
                    $(this).val(max_return_price);

                    let subTotal = max_return_price * quantity;
                    $(`.productTotal${productId}`).val(subTotal);
                    calculateProductTotal();

                }else{
                    let subTotal = return_price * quantity;
                    $(`.productTotal${productId}`).val(subTotal);
                    calculateProductTotal();
                }
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
                            const product = res.sale_items;
                            showAddProduct(product);
                            calculateProductTotal();
                            // updateGrandTotal();
                            // calculateCustomerDue();
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
                // updateGrandTotal();
                // updateTotalQuantity();
                // calculateCustomerDue();
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
                // console.log(allTotal);

                $('.all_product_total').text(allTotal.toFixed(2));
            }
            calculateProductTotal();

            function returnInvoice() {

                let sale_id = '{{$sale->id}}';
                let customer_id = '{{$customer->id}}';
                let return_date = $('.return_date').val();
                let formattedReturnDate = moment(return_date, 'DD-MMM-YYYY').format('YYYY-MM-DD HH:mm:ss');

                let refund_amount = parseFloat($('.all_product_total').text());
                let note = $('.return_purpose').val();

                let products = [];

                $('tr[class^="data_row"]').each(function() {
                    let row = $(this);
                    // Get values from the current row's elements

                    let product_id =  parseInt($(this).attr('product-id'));
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
                    products.push(product);
                });
                // console.log(products);

                let allData = {
                    // for purchase table
                    sale_id,
                    customer_id,
                    formattedReturnDate,
                    refund_amount,
                    note,
                    products
                }

                // console.log(allData);

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
                        }else {
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
