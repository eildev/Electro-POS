<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Category;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $productCategorys = [
            [
                'id' => 1,
                'name' => 'Lighting',
                'slug' => 'lighting',
            ],
            [
                'id' => 2,
                'name' => 'Fans',
                'slug' => 'fans',
            ],
            [
                'id' => 3,
                'name' => 'Kitchen Appliances',
                'slug' => 'kitchen-appliances',
            ],
            [
                'id' => 4,
                'name' => 'Accessories',
                'slug' => 'accessories',
            ],
            [
                'id' => 5,
                'name' => 'Motors',
                'slug' => 'motors',
            ],
            [
                'id' => 6,
                'name' => 'Power Solutions',
                'slug' => 'power-solutions',
            ],
            [
                'id' => 7,
                'name' => 'Smart Devices',
                'slug' => 'smart-devices',
            ],
            [
                'id' => 8,
                'name' => 'Home Appliances',
                'slug' => 'home-appliances',
            ],
            [
                'id' => 9,
                'name' => 'Air Conditioning',
                'slug' => 'air-conditioning',
            ],
            [
                'id' => 10,
                'name' => 'Electrical Components',
                'slug' => 'electrical-components',
            ],
        ];

        foreach ($productCategorys as $productCategory) {
            Category::create($productCategory);
        }
    }
}
