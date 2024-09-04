<?php

namespace App\Imports;

use App\Models\SubCategory;
use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class SubcategoryImport implements ToCollection, WithHeadingRow
{

    /**
     * @param Collection $collection
     */
    public function collection(Collection  $rows)
    {
        foreach ($rows as $row) {
            if (isset($row['name'])) {
                $subcategory = SubCategory::where('name', $row['name'])->first();
                if ($subcategory) {
                    $subcategory->update([
                        // 'id' => $row['id'],
                        'category_id' => $row['category_id'],
                        'name' => $row['name'],
                    ]);
                } else {
                    SubCategory::create([
                        // 'id' => $row['id'],
                        'category_id' => $row['category_id'],
                        'name' => $row['name'],
                    ]);
                }
            } else {
                $notification = array(
                    'warning' => 'Not Inserted',
                    'alert-type' => 'info'
                );
                return redirect()->back()->with($notification);
            }
        }
    }
}
