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
                'name' => 'Consumer Electronics',
                'slug' => 'consumer-electronics',
                'status' =>1,
            ],
            [
                'id' => 2,
                'name' => 'Home Appliances',
                'slug' => 'home-appliances',
                'status' =>1,
            ],
            [
                'id' => 3,
                'name' => 'Computing Devices',
                'slug' => 'computing-devices',
                'status' =>1,
            ],
            [
                'id' => 4,
                'name' => 'Audio/Video Equipment',
                'slug' => 'audio-video-equipment',
                'status' =>1,
            ],
            [
                'id' => 5,
                'name' => 'Wearable Technology',
                'slug' => 'wearable-technology',
                'status' =>1,
            ],
            [
                'id' => 6,
                'name' => 'Networking Devices',
                'slug' => 'networking-devices',
                'status' =>1,
            ],
            [
                'id' => 7,
                'name' => 'Gaming',
                'slug' => 'gaming',
                'status' =>1,
            ],
            [
                'id' => 8,
                'name' => 'Medical Electronics',
                'slug' => 'medical-electronics',
                'status' =>1,
            ],
            [
                'id' => 9,
                'name' => 'Industrial Electronics',
                'slug' => 'industrial-electronics',
                'status' =>1,
            ],
        ];


        foreach ($categories as $productCategory) {
            Category::create($productCategory);
        }
    }
}
