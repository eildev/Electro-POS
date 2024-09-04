@extends('master')
@section('title', '| Product Excel Import')
@section('admin')
    <div class="conatiner">
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10  mt-2">
                <div class="card">
                    <div class="card-header">
                        <h3>Import Category Excel Data into Database </h3>
                    </div>
                    <div class="card-body">
                        <form action="{{ url('/category/imports/all') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="input-group">
                                <input type="file" class="form-control" name="category-import_file">
                                <button type="submit" class="btn btn-sm btn-primary">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <br><br>
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10  mt-2">
                <div class="card">
                    <div class="card-header">
                        <h3>Import Subcategory Excel Data into Database </h3>
                    </div>
                    <div class="card-body">
                        <form action="{{ url('/subcategory/imports/all') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="input-group">
                                <input type="file" class="form-control" name="subcategory-import_file">
                                <button type="submit" class="btn btn-sm btn-primary">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <br><br>
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10  mt-2">
                <div class="card">
                    <div class="card-header">
                        <h3>Import Brand Excel Data into Database </h3>
                    </div>
                    <div class="card-body">
                        <form action="{{ url('/brand/imports/all') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="input-group">
                                <input type="file" class="form-control" name="brand-import_file">
                                <button type="submit" class="btn btn-sm btn-primary">Submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <br><br>
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10  mt-2">
                <div class="card">
                    <div class="card-header">
                        <h2>Import Excel Data into Database </h2>
                    </div>
                    <div class="card-body">
                        <form action="{{ url('/products/imports/all') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="input-group">
                                <input type="file" class="form-control" name="import_file">
                                <button type="submit" class="btn btn-sm btn-primary">Submit</button>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
