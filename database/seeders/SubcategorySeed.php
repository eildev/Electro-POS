<?php

namespace Database\Seeders;

use App\Models\SubCategory;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class SubcategorySeed extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $subcategories = [
            // Consumer Electronics
            [
                'id' => 1,
                'category_id' => 1,
                'name' => 'Gaming Phones',
                'slug' => 'gaming-phones',
            ],
            [
                'id' => 2,
                'category_id' => 1,
                'name' => 'Feature Phones',
                'slug' => 'feature-phones',
            ],
            [
                'id' => 3,
                'category_id' => 1,
                'name' => 'Foldable Phones',
                'slug' => 'foldable-phones',
            ],
            [
                'id' => 4,
                'category_id' => 1,
                'name' => 'Smartphones',
                'slug' => 'Smartphones',
            ],
            [
                'id' => 5,
                'category_id' => 1,
                'name' => 'Bluetooth Speakers',
                'slug' => 'bluetooth-speakers',
            ],

            // Home Appliances
            [
                'id' => 6,
                'category_id' => 2,
                'name' => 'Refrigerators',
                'slug' => 'refrigerators',
            ],
            [
                'id' => 7,
                'category_id' => 2,
                'name' => 'Washing Machines',
                'slug' => 'washing-machines',
            ],

        ];


        foreach ($subcategories as $subcategory) {
            SubCategory::create($subcategory);
        }
    }
}
