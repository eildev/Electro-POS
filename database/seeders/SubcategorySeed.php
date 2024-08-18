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
        $productSubcategory = [
            [
                'id' => 1,
                'category_id' => 1,
                'name' => 'LED Bulbs',
                'slug' => 'led-bulbs',
            ],
            [
                'id' => 2,
                'category_id' => 2,
                'name' => 'Ceiling Fans',
                'slug' => 'ceiling-fans',
            ],
            [
                'id' => 3,
                'category_id' => 3,
                'name' => 'Kettles',
                'slug' => 'kettles',
            ],
            [
                'id' => 4,
                'category_id' => 4,
                'name' => 'Power Strips',
                'slug' => 'power-strips',
            ],
            [
                'id' => 5,
                'category_id' => 5,
                'name' => '3-Phase Motors',
                'slug' => '3-phase-motors',
            ],
            [
                'id' => 6,
                'category_id' => 6,
                'name' => 'Batteries',
                'slug' => 'batteries',
            ],
            [
                'id' => 7,
                'category_id' => 7,
                'name' => 'Smart Plugs',
                'slug' => 'smart-plugs',
            ],
            [
                'id' => 8,
                'category_id' => 8,
                'name' => 'Irons',
                'slug' => 'irons',
            ],
            [
                'id' => 9,
                'category_id' => 9,
                'name' => 'Split AC',
                'slug' => 'split-ac',
            ],
            [
                'id' => 10,
                'category_id' => 10,
                'name' => 'Circuit Breakers',
                'slug' => 'circuit-breakers',
            ],
        ];

        foreach ($productSubcategory as $subcategory) {
            SubCategory::create($subcategory);
        }
    }
}
