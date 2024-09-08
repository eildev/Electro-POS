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
        $categories = [
            [
                'id' => 1,
                'name' => 'Mobile Phones',
                'slug' => 'mobile-phones',
                'status' =>1,
            ],
            [
                'id' => 2,
                'name' => 'Home Appliances',
                'slug' => 'home-appliances',
                'status' =>1,
            ],

        ];


        foreach ($categories as $productCategory) {
            Category::create($productCategory);
        }
    }
}
