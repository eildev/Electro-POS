<?php

namespace App\Http\Controllers;

use App\Imports\BrandImport;
use App\Imports\CategoryImport;
use App\Models\PosSetting;
use App\Models\Product;
use App\Models\PromotionDetails;
// use Validator;
use Illuminate\Support\Facades\Validator;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;
use Maatwebsite\Excel\Facades\Excel;
use App\Imports\ProductsImport;
use App\Imports\SubcategoryImport;
use App\Jobs\ImportExcelDataJob;
use DataTables;

class ProductsController extends Controller
{
    public function index()
    {
        return view('pos.products.product.product');
    }
    public function store(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'name' => 'required|max:255',
            'category_id' => 'required|integer',
            'brand_id' => 'required|integer',
            'price' => 'required|max:7',
            'unit_id' => 'required|max:11',
            'barcode' => [
                'required',
                Rule::unique('products', 'barcode')->where(function ($query) use ($request) {
                    return $query->where('barcode', $request->barcode);
                }),
            ],
        ]);

        if ($validator->passes()) {
            $product = new Product;
            $product->name =  $request->name;
            $product->branch_id =  Auth::user()->branch_id;
            $product->barcode =  $request->barcode;
            $product->category_id =  $request->category_id;
            $product->subcategory_id =  $request->subcategory_id;
            if ($request->subcategory_id != 'Please add Subcategory') {
                // dd($request->subcategory_id);
                $product->subcategory_id  =  $request->subcategory_id;
            } else {
                $product->subcategory_id  =  null;
            }
            $product->brand_id  =  $request->brand_id;
            $product->cost  =  $request->cost;
            $product->price  =  $request->price;
            $product->details =  $request->details;
            $product->color  =  $request->color;
            $product->unit_id  =  $request->unit_id;
            if ($request->size_id !== 'Please add Size') {
                $product->size_id  =  $request->size_id;
            }
            if ($request->main_unit_stock) {
                $product->main_unit_stock  =  $request->main_unit_stock;
            }
            if ($request->image) {
                $imageName = rand() . '.' . $request->image->extension();
                $request->image->move(public_path('uploads/product/'), $imageName);
                $product->image = $imageName;
            }
            $product->save();
            return response()->json([
                'status' => 200,
                'message' => 'Product Save Successfully',
            ]);
        } else {
            return response()->json([
                'status' => '500',
                'error' => $validator->messages()
            ]);
        }
    }
    public function view()
    {
        return view('pos.products.product.product-show');
    }

    public function getData(Request $request)
    {

        // Check if the user is an admin (user id == 1)
        if (Auth::user()->id == 1) {
            // Fetch all products with stock quantity sum and relationships
            $products = Product::with(['category', 'brand', 'unit', 'subcategory', 'size'])
                ->withSum('stockQuantity', 'stock_quantity')
                ->latest();
        } else {
            // Fetch only products for the logged-in user's branch with relationships
            $products = Product::where('branch_id', Auth::user()->branch_id)
                ->with(['category', 'brand', 'unit', 'subcategory', 'size'])
                ->withSum('stockQuantity', 'stock_quantity')
                ->latest();
        }

        // Check if the request is an AJAX call (DataTables request)
        if ($request->ajax()) {
            return DataTables::of($products)

                ->addColumn('category_name', function ($product) {
                    return $product->category->name ?? 'N/A'; // Show category name
                })
                ->addColumn('image', function ($product) {
                    return '<img src="'.asset('uploads/product/' . $product->image).'" alt="Product Image" style="width: 50px; height: auto;">';
                })
                ->addColumn('brand_name', function ($product) {
                    return $product->brand->name ?? 'N/A'; // Show brand name
                })
                ->addColumn('subcategory_name', function ($product) {
                    return $product->subcategory->name ?? 'N/A'; // Add subcategory name
                })
                ->addColumn('size_name', function ($product) {
                    return $product->size->name ?? 'N/A'; // Show unit name
                })
                ->addColumn('unit_name', function ($product) {
                    return $product->unit->name ?? 'N/A'; // Show unit name
                })
                ->addColumn('action', function ($product) {
                    $viewBtn = '<a href="'.route('product.find', $product->id).'" class="btn btn-sm btn-success">View</a>';
                    $editBtn = '';
                    if (Auth::user()->can('products.edit')) {
                        $editBtn = '<a href="'.route('product.edit', $product->id).'" class="btn btn-sm btn-primary">Edit</a>';
                    }
                    $deleteBtn = '';
                    if (Auth::user()->can('products.delete')) {
                        $deleteBtn = '<a href="'.route('product.destroy', $product->id).'" class="btn btn-sm btn-danger" onclick="return confirm(\'Are you sure?\')">Delete</a>';
                    }

                    return $viewBtn . ' ' . $editBtn . ' ' . $deleteBtn; // Concatenating the buttons
                })
                ->rawColumns(['image', 'action']) // Allow HTML in 'image' and 'action' columns
                ->make(true);
        }

        return view('pos.products.product.product-show');
    }



    public function edit($id)
    {
        $product = Product::findOrFail($id);
        return view('pos.products.product.product-edit', compact('product'));
    }
    public function update(Request $request, $id)
    {
        // dd($request->all());
        $validator = Validator::make($request->all(), [
            'name' => 'required|max:255',
            'category_id' => 'required|integer',
            'brand_id' => 'required|integer',
            'price' => 'required|max:7',
            'unit_id' => 'required|max:11',
        ]);
        if ($validator->passes()) {
            $product = Product::findOrFail($id);
            $product->name =  $request->name;
            $product->branch_id =  Auth::user()->branch_id;
            $product->barcode =  $request->barcode;
            $product->category_id =  $request->category_id;
            if ($request->subcategory_id != 'Please add Subcategory') {
                // dd($request->subcategory_id);
                $product->subcategory_id  =  $request->subcategory_id;
            } else {
                $product->subcategory_id  =  null;
            }
            $product->brand_id  =  $request->brand_id;
            $product->cost  =  $request->cost;
            $product->price  =  $request->price;
            $product->details  =  $request->details;
            $product->color  =  $request->color;
            $product->size_id  =  $request->size_id;
            $product->unit_id  =  $request->unit_id;
            if ($request->main_unit_stock) {
                $product->main_unit_stock  =  $request->main_unit_stock;
            }
            if ($request->image) {
                $imageName = rand() . '.' . $request->image->extension();
                $request->image->move(public_path('uploads/product/'), $imageName);
                $product->image = $imageName;
            }
            $product->save();
            return response()->json([
                'status' => 200,
                'message' => 'Product Update Successfully',
            ]);
        } else {
            return response()->json([
                'status' => '500',
                'error' => $validator->messages()
            ]);
        }
    }
    public function destroy($id)
    {
        $product = Product::findOrFail($id);
        if ($product->image) {
            $previousImagePath = public_path('uploads/product/') . $product->image;
            if (file_exists($previousImagePath)) {
                unlink($previousImagePath);
            }
        }
        $product->delete();
        return back()->with('message', "Product deleted successfully");
    }
    public function find($id)
    {
        $status = 'active';
        $product = Product::findOrFail($id);
        $promotionDetails = PromotionDetails::whereHas('promotion', function ($query) use ($status) {
            return $query->where('status', '=', $status);
        })->where('promotion_type', 'products')->where('logic', 'like', '%' . $id . "%")->latest()->first();
        // dd($promotionDetails->promotion);
        $discountCheck = PosSetting::where('discount', '=', 1)->first();

        if ($promotionDetails) {
            if ($discountCheck) {
                return response()->json([
                    'status' => '200',
                    'data' => $product,
                ]);
            } else {
                return response()->json([
                    'status' => '200',
                    'data' => $product,
                    'promotion' => $promotionDetails->promotion,
                ]);
            }
        } else {
            return response()->json([
                'status' => '200',
                'data' => $product
            ]);
        }
    }
    //
    public function ProductBarcode($id)
    {
        $product = Product::findOrFail($id);
        return view('pos.products.product.product-barcode', compact('product'));
    }
    public function globalSearch($search_value)
    {
        $product = Product::where('search_value');

        if (Auth::user()->id == 1) {
            $products = Product::withSum('stockQuantity', 'stock_quantity')->where('name', 'LIKE', '%' . $search_value . '%')
                ->orWhere('details', 'LIKE', '%' . $search_value . '%')
                ->orWhere('price', 'LIKE', '%' . $search_value . '%')
                ->orWhereHas('category', function ($query) use ($search_value) {
                    $query->where('name', 'LIKE', '%' . $search_value . '%');
                })
                ->orWhereHas('subcategory', function ($query) use ($search_value) {
                    $query->where('name', 'LIKE', '%' . $search_value . '%');
                })
                ->orWhereHas('brand', function ($query) use ($search_value) {
                    $query->where('name', 'LIKE', '%' . $search_value . '%');
                })

                ->get();
        } else {
            $products = Product::where('branch_id', Auth::user()->branch_id)
                ->withSum('stockQuantity', 'stock_quantity')
                ->where('name', 'LIKE', '%' . $search_value . '%')
                ->orWhere('details', 'LIKE', '%' . $search_value . '%')
                ->orWhere('price', 'LIKE', '%' . $search_value . '%')
                ->orWhereHas('category', function ($query) use ($search_value) {
                    $query->where('name', 'LIKE', '%' . $search_value . '%');
                })
                ->orWhereHas('subcategory', function ($query) use ($search_value) {
                    $query->where('name', 'LIKE', '%' . $search_value . '%');
                })
                ->orWhereHas('brand', function ($query) use ($search_value) {
                    $query->where('name', 'LIKE', '%' . $search_value . '%');
                })

                ->get();
        }

        return response()->json([
            'products' => $products,
            'status' => 200
        ]);
    }
    public function importProduct()
    {
        return view('pos.products.product.product-import');
    }

    /////////////////////// Products Import Data //////////////////////

    public function ImportExcelData(Request $request)
    {
        $request->validate([
            'import_file' => [
                'required',
                'file'
            ]
        ]);

        try {
            // Attempt to import the Excel file
            Excel::import(new ProductsImport, $request->file('import_file'));

            // Success notification
            $notification = array(
                'message' => 'Products imported successfully.',
                'alert-type' => 'info'
            );
        } catch (\Exception $e) {
            // Handle any errors that occurred during the import
            $notification = array(
                'warning' => 'Error importing products: ' . $e->getMessage(),
                'alert-type' => 'info'
            );
        }

        return redirect()->back()->with($notification);
    }

    /////////////////////// Category Import Data //////////////////////

    public function importCategoryExcelData(Request $request)
    {
        // dd($request->all());
        Excel::import(new CategoryImport, $request->file('category-import_file'));
        $notification = array(
            'message' => 'Category imported successfully.',
            'alert-type' => 'info'
        );
        return redirect()->back()->with($notification);
    }

    /////////////////////// Category Import Data //////////////////////

    public function importSubcategoryExcelData(Request $request)
    {
        Excel::import(new SubcategoryImport, $request->file('subcategory-import_file'));
        $notification = array(
            'message' => 'Category imported successfully.',
            'alert-type' => 'info'
        );
        return redirect()->back()->with($notification);
    }

    ///////////////////////Brand Import Data //////////////////////

    public function importBrandExcelData(Request $request)
    {
        $request->validate([
            'brand-import_file' => [
                'required',
                'file'
            ]
        ]);

        Excel::import(new BrandImport, $request->file('brand-import_file'));
        $notification = array(
            'message' => 'Brand imported successfully.',
            'alert-type' => 'info'
        );
        return redirect()->back()->with($notification);
    }
}
