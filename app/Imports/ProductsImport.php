<?php

namespace App\Imports;

use App\Models\Product;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class ProductsImport implements ToCollection, WithHeadingRow
{
    /**
     * @param Collection $collection
     */
    public function collection(Collection $rows)
    {

        foreach ($rows as $row) {
            $product = Product::where('name', $row['name'])->first();
            if ($product) {
                $product->update([
                    // 'id' => $row['id'],
                    'name' => $row['name'],
                    'branch_id' => $row['branch_id'],
                    'barcode' => $row['barcode'],
                    'category_id' => $row['category_id'],
                    'subcategory_id' => $row['subcategory_id'],
                    'brand_id' => $row['brand_id'],
                    'cost' => $row['cost'],
                    'price' => $row['price'],
                    'details' => $row['details'],
                    'image' => $row['image'],
                    'stock' => $row['stock'],
                    'main_unit_stock' => $row['main_unit_stock'],
                    'total_sold' => $row['total_sold'],
                    'color' => $row['color'],
                    'size_id' => $row['size_id'],
                    'unit_id' => $row['unit_id'],
                ]);
            } else {
                product::create([
                    // 'id' => $row['id'],
                    'name' => $row['name'],
                    'branch_id' => $row['branch_id'],
                    'barcode' => $row['barcode'],
                    'category_id' => $row['category_id'],
                    'subcategory_id' => $row['subcategory_id'],
                    'brand_id' => $row['brand_id'],
                    'cost' => $row['cost'],
                    'price' => $row['price'],
                    'details' => $row['details'],
                    'image' => $row['image'],
                    'stock' => $row['stock'],
                    'main_unit_stock' => $row['main_unit_stock'],
                    'total_sold' => $row['total_sold'],
                    'color' => $row['color'],
                    'size_id' => $row['size_id'],
                    'unit_id' => $row['unit_id'],
                ]);
            }
        }
    }
}