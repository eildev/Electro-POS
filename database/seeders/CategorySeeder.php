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
            ],
            [
                'id' => 2,
                'name' => 'Home Appliances',
                'slug' => 'home-appliances',
            ],
            [
                'id' => 3,
                'name' => 'Computing Devices',
                'slug' => 'computing-devices',
            ],
            [
                'id' => 4,
                'name' => 'Audio/Video Equipment',
                'slug' => 'audio-video-equipment',
            ],
            [
                'id' => 5,
                'name' => 'Wearable Technology',
                'slug' => 'wearable-technology',
            ],
            [
                'id' => 6,
                'name' => 'Networking Devices',
                'slug' => 'networking-devices',
            ],
            [
                'id' => 7,
                'name' => 'Gaming',
                'slug' => 'gaming',
            ],
            [
                'id' => 8,
                'name' => 'Medical Electronics',
                'slug' => 'medical-electronics',
            ],
            [
                'id' => 9,
                'name' => 'Industrial Electronics',
                'slug' => 'industrial-electronics',
            ],
        ];


        foreach ($categories as $productCategory) {
            Category::create($productCategory);
        }
    }
}
