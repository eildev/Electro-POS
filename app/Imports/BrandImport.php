<?php

namespace App\Imports;

use Illuminate\Support\Collection;
use Maatwebsite\Excel\Concerns\ToCollection;
use App\Models\Brand;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class BrandImport implements ToCollection, WithHeadingRow
{

    /**
     * @param Collection $collection
     */
    public function collection(Collection  $rows)
    {
        foreach ($rows as $row) {
            if (isset($row['name'])) {
                $brand = Brand::where('name', $row['name'])->first();
                if ($brand) {
                    $brand->update([
                        // 'id' => $row['id'],
                        'name' => $row['name'],
                        'slug' => $row['slug'],
                    ]);
                } else {
                    Brand::create([
                        // 'id' => $row['id'],
                        'name' => $row['name'],
                        'slug' => $row['slug'],
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
