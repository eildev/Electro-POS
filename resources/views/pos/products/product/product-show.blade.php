@extends('master')
@section('title', '| Product List')
@section('admin')

    <nav class="page-breadcrumb">
        <ol class="breadcrumb">
            <li class="breadcrumb-item"><a href="{{ route('dashboard') }}">Dashboard</a></li>
            <li class="breadcrumb-item active" aria-current="page">View Products</li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-md-12 grid-margin stretch-card">
            <div class="card">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h6 class="card-title">Product Table</h6>
                        @if (Auth::user()->can('products.add'))
                        <a href="{{ route('product') }}" class="btn btn-primary"><i class="fa-solid fa-plus"></i> Add
                            Product</a>
                        @endif
                    </div>
                    <div class="table-responsive">
                        <table id="products-table" class="display table table-striped table-bordered" style="width:100%">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Image</th>
                                    <th>Price</th>
                                    <th>Barcode</th>
                                    <th>Category</th>
                                    <th>Subcategory</th>
                                    <th>Brand</th>
                                    <th>Cost</th>
                                    <th>Total Sold</th>
                                    <th>Color</th>
                                    <th>Size</th>
                                    <th>Unit</th>
                                    <th>Action</th> <!-- This should be sufficient for your actions -->
                                </tr>
                            </thead>

                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        function printModalContent(modalId) {
            var modalBodyContent = document.getElementById(modalId).getElementsByClassName('modal-body')[0].innerHTML;
            var printWindow = window.open('', '_blank');
            printWindow.document.write(
                '<html><head><title>Print</title><link rel="stylesheet" type="text/css" href="print.css" /></head><body>' +
                modalBodyContent + '</body></html>');
            printWindow.document.close();
            printWindow.print();

        }
    </script>
    <style>
        .barcode-container {
            text-align: center;
            border: 1px solid #e9ecef;
            padding: 10px;
        }

        .dblock {
            display: inline-block;
        }
    </style>
    <script type="text/javascript">
        $(document).ready(function() {
            $('#products-table').DataTable({
                processing: true,
                serverSide: true,
                ajax: '{{ route('product.view') }}', // Your route to get the products data
                columns: [
                    { data: 'id', name: 'id' },
                    { data: 'name', name: 'name' },
                    { data: 'image', name: 'image', orderable: false, searchable: false },
                    { data: 'price', name: 'price' },
                    { data: 'barcode', name: 'quantity' },
                    { data: 'category_name', name: 'category_name' },
                    { data: 'subcategory_name', name: 'subcategory_name' },
                    { data: 'brand_name', name: 'brand_name' },
                    { data: 'cost', name: 'cost' },
                    { data: 'total_sold', name: 'total_sold' },
                    { data: 'color', name: 'color' },
                    { data: 'size_name', name: 'size_name' },
                    { data: 'unit_name', name: 'unit_name' },
                    { data: 'action', name: 'action', orderable: false, searchable: false } // Action buttons
                ]
            });
        });
    </script>
@endsection
