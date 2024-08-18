<?php

namespace Database\Seeders;

use App\Models\Brand;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class BrandSeed extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $brands = [
            [
                'id' => 1,
                'name' => 'Philips',
                'slug' => 'philips',
            ],
            [
                'id' => 2,
                'name' => 'Havells',
                'slug' => 'havells',
            ],
            [
                'id' => 3,
                'name' => 'Panasonic',
                'slug' => 'panasonic',
            ],
            [
                'id' => 4,
                'name' => 'Belkin',
                'slug' => 'belkin',
            ],
            [
                'id' => 5,
                'name' => 'Siemens',
                'slug' => 'siemens',
            ],
            [
                'id' => 6,
                'name' => 'Exide',
                'slug' => 'exide',
            ],
            [
                'id' => 7,
                'name' => 'TP-Link',
                'slug' => 'tp-link',
            ],
            [
                'id' => 8,
                'name' => 'Bajaj',
                'slug' => 'bajaj',
            ],
            [
                'id' => 9,
                'name' => 'LG',
                'slug' => 'lg',
            ],
            [
                'id' => 10,
                'name' => 'Schneider',
                'slug' => 'schneider',
            ],
        ];

        foreach ($brands as $brands) {
            Brand::create($brands);
        }
    }
}
