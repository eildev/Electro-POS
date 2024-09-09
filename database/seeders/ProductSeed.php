<?php

namespace Database\Seeders;

use App\Models\Product;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class ProductSeed extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $products = [
            [
                'id' => 1,
                'name' => 'OnePlus Foldable Phones Model 974',
                'branch_id' => 1,
                'barcode' => '000000000001',
                'category_id' => 1, // Consumer Electronics
                'subcategory_id' => 1, // Smartphones
                'brand_id' => 1, // Apple
                'cost' => 240,
                'price' => 300,
                'details' => 'OnePlus Foldable Phones Model 974 features a sleek design, powerful A15 Bionic chip, and advanced camera system.',
                'image' => null,
                'stock' => 0,
                'main_unit_stock' => 0,
                'total_sold' => 0,
                'color' => null,
                'size_id' => null,
                'unit_id' => 1,
            ],
            [
                'id' => 2,
                'name' => 'Samsung Galaxy S23',
                'branch_id' => 1,
                'barcode' => '000000000002',
                'category_id' => 1, // Consumer Electronics
                'subcategory_id' => 1, // Smartphones
                'brand_id' => 2, // Samsung
                'cost' => 250,
                'price' => 320,
                'details' => 'Samsung Galaxy S23 offers an incredible display, powerful performance, and a versatile camera setup.',
                'image' => null,
                'stock' => 0,
                'main_unit_stock' => 0,
                'total_sold' => 0,
                'color' => null,
                'size_id' => null,
                'unit_id' => 1,
            ],
            [
                'id' => 3,
                'name' => 'Sony PlayStation 5',
                'branch_id' => 1,
                'barcode' => '000000000003',
                'category_id' => 1, // Gaming
                'subcategory_id' => 1, // Gaming Consoles
                'brand_id' => 3, // Sony
                'cost' => 500,
                'price' => 600,
                'details' => 'Sony PlayStation 5 offers cutting-edge graphics, fast load times, and an immersive gaming experience.',
                'image' => null,
                'stock' => 0,
                'main_unit_stock' => 0,
                'total_sold' => 0,
                'color' => null,
                'size_id' => null,
                'unit_id' => 1,
            ],
            [
                'id' => 4,
                'name' => 'LG OLED TV C1',
                'branch_id' => 1,
                'barcode' => '000000000004',
                'category_id' => 1, // Audio/Video Equipment
                'subcategory_id' => 1, // Home Theater Systems
                'brand_id' => 4, // LG
                'cost' => 1200,
                'price' => 1500,
                'details' => 'LG OLED TV C1 provides stunning picture quality with deep blacks and vibrant colors for an exceptional viewing experience.',
                'image' => null,
                'stock' => 0,
                'main_unit_stock' => 0,
                'total_sold' => 0,
                'color' => null,
                'size_id' => null,
                'unit_id' => 1,
            ],
            [
                'id' => 5,
                'name' => 'Dell XPS 13',
                'branch_id' => 1,
                'barcode' => '000000000005',
                'category_id' => 1, // Computing Devices
                'subcategory_id' => 2, // Laptops
                'brand_id' => 5, // Dell
                'cost' => 900,
                'price' => 1100,
                'details' => 'Dell XPS 13 is a compact and powerful laptop with a sleek design and high-performance components.',
                'image' => null,
                'stock' => 0,
                'main_unit_stock' => 0,
                'total_sold' => 0,
                'color' => null,
                'size_id' => null,
                'unit_id' => 1,
            ],
            [
                'id' => 6,
                'name' => 'HP Spectre x360',
                'branch_id' => 1,
                'barcode' => '000000000006',
                'category_id' => 1, // Computing Devices
                'subcategory_id' => 2, // Laptops
                'brand_id' => 6, // HP
                'cost' => 950,
                'price' => 1200,
                'details' => 'HP Spectre x360 offers versatility with a convertible design and powerful performance for all computing needs.',
                'image' => null,
                'stock' => 0,
                'main_unit_stock' => 0,
                'total_sold' => 0,
                'color' => null,
                'size_id' => null,
                'unit_id' => 1,
            ],
            [
                'id' => 7,
                'name' => 'Lenovo ThinkPad X1 Carbon',
                'branch_id' => 1,
                'barcode' => '000000000007',
                'category_id' => 1, // Computing Devices
                'subcategory_id' => 2, // Laptops
                'brand_id' => 7, // Lenovo
                'cost' => 1000,
                'price' => 1300,
                'details' => 'Lenovo ThinkPad X1 Carbon is known for its durability, high-performance, and excellent keyboard for professionals.',
                'image' => null,
                'stock' => 0,
                'main_unit_stock' => 0,
                'total_sold' => 0,
                'color' => null,
                'size_id' => null,
                'unit_id' => 1,
            ],
            [
                'id' => 8,
                'name' => 'Microsoft Surface Pro 9',
                'branch_id' => 1,
                'barcode' => '000000000008',
                'category_id' => 1, // Computing Devices
                'subcategory_id' => 2, // Laptops
                'brand_id' => 8, // Microsoft
                'cost' => 1100,
                'price' => 1400,
                'details' => 'Microsoft Surface Pro 9 offers the versatility of a tablet with the power of a laptop and a stunning high-resolution screen.',
                'image' => null,
                'stock' => 0,
                'main_unit_stock' => 0,
                'total_sold' => 0,
                'color' => null,
                'size_id' => null,
                'unit_id' => 1,
            ],
            [
                'id' => 9,
                'name' => 'NVIDIA GeForce RTX 4090',
                'branch_id' => 1,
                'barcode' => '000000000009',
                'category_id' => 1, // Computing Devices
                'subcategory_id' => 3, // Graphics Cards
                'brand_id' => 9, // NVIDIA
                'cost' => 1500,
                'price' => 1800,
                'details' => 'NVIDIA GeForce RTX 4090 offers top-tier graphics performance for gaming and professional applications.',
                'image' => null,
                'stock' => 0,
                'main_unit_stock' => 0,
                'total_sold' => 0,
                'color' => null,
                'size_id' => null,
                'unit_id' => 1,
            ],
            [
                'id' => 10,
                'name' => 'Intel Core i9-13900K',
                'branch_id' => 1,
                'barcode' => '000000000010',
                'category_id' => 1, // Computing Devices
                'subcategory_id' => 4, // Processors
                'brand_id' => 10, // Intel
                'cost' => 600,
                'price' => 750,
                'details' => 'Intel Core i9-13900K delivers outstanding performance with its latest architecture and high core count.',
                'image' => null,
                'stock' => 0,
                'main_unit_stock' => 0,
                'total_sold' => 0,
                'color' => null,
                'size_id' => null,
                'unit_id' => 1,
            ],
            [
                'id' => 11,
                'name' => 'Asus ROG Strix Scar 16',
                'branch_id' => 1,
                'barcode' => '000000000011',
                'category_id' => 1, // Computing Devices
                'subcategory_id' => 2, // Laptops
                'brand_id' => 11, // Asus
                'cost' => 1400,
                'price' => 1800,
                'details' => 'Asus ROG Strix Scar 16 is designed for gaming with high-end graphics, fast refresh rates, and customizable lighting.',
                'image' => null,
                'stock' => 0,
                'main_unit_stock' => 0,
                'total_sold' => 0,
                'color' => null,
                'size_id' => null,
                'unit_id' => 1,
            ],
            [
                'id' => 12,
                'name' => 'Acer Predator Helios 300',
                'branch_id' => 1,
                'barcode' => '000000000012',
                'category_id' => 1, // Computing Devices
                'subcategory_id' => 2, // Laptops
                'brand_id' => 12, // Acer
                'cost' => 1300,
                'price' => 1600,
                'details' => 'Acer Predator Helios 300 offers powerful gaming performance with a high refresh rate display and advanced cooling.',
                'image' => null,
                'stock' => 0,
                'main_unit_stock' => 0,
                'total_sold' => 0,
                'color' => null,
                'size_id' => null,
                'unit_id' => 1,
            ],
            [
                'id' => 13,
                'name' => 'Panasonic Lumix GH6',
                'branch_id' => 1,
                'barcode' => '000000000013',
                'category_id' => 1, // Cameras
                'subcategory_id' => 1, // Digital Cameras
                'brand_id' => 13, // Panasonic
                'cost' => 1700,
                'price' => 2200,
                'details' => 'Panasonic Lumix GH6 is a high-performance camera with advanced video recording features and high resolution.',
                'image' => null,
                'stock' => 0,
                'main_unit_stock' => 0,
                'total_sold' => 0,
                'color' => null,
                'size_id' => null,
                'unit_id' => 1,
            ],
            [
                'id' => 14,
                'name' => 'Canon EOS R6',
                'branch_id' => 1,
                'barcode' => '000000000014',
                'category_id' => 1, // Cameras
                'subcategory_id' => 1, // Digital Cameras
                'brand_id' => 14, // Canon
                'cost' => 2500,
                'price' => 3000,
                'details' => 'Canon EOS R6 offers superior autofocus, high-speed continuous shooting, and excellent low-light performance.',
                'image' => null,
                'stock' => 0,
                'main_unit_stock' => 0,
                'total_sold' => 0,
                'color' => null,
                'size_id' => null,
                'unit_id' => 1,
            ],
            [
                'id' => 15,
                'name' => 'Nikon Z9',
                'branch_id' => 1,
                'barcode' => '000000000015',
                'category_id' => 1, // Cameras
                'subcategory_id' => 1, // Digital Cameras
                'brand_id' => 15, // Nikon
                'cost' => 5500,
                'price' => 6500,
                'details' => 'Nikon Z9 provides outstanding image quality, fast performance, and robust build for professional photographers.',
                'image' => null,
                'stock' => 0,
                'main_unit_stock' => 0,
                'total_sold' => 0,
                'color' => null,
                'size_id' => null,
                'unit_id' => 1,
            ],
            [
                'id' => 16,
                'name' => 'GoPro HERO11 Black',
                'branch_id' => 1,
                'barcode' => '000000000016',
                'category_id' => 1, // Cameras
                'subcategory_id' => 2, // Action Cameras
                'brand_id' => 16, // GoPro
                'cost' => 400,
                'price' => 500,
                'details' => 'GoPro HERO11 Black captures stunning 5.3K video and features improved stabilization and rugged design.',
                'image' => null,
                'stock' => 0,
                'main_unit_stock' => 0,
                'total_sold' => 0,
                'color' => null,
                'size_id' => null,
                'unit_id' => 1,
            ],
            [
                'id' => 17,
                'name' => 'Bose QuietComfort 45',
                'branch_id' => 1,
                'barcode' => '000000000017',
                'category_id' => 1, // Audio Equipment
                'subcategory_id' => 1, // Noise-Canceling Headphones
                'brand_id' => 17, // Bose
                'cost' => 300,
                'price' => 350,
                'details' => 'Bose QuietComfort 45 offers industry-leading noise cancellation and exceptional audio quality for all-day comfort.',
                'image' => null,
                'stock' => 0,
                'main_unit_stock' => 0,
                'total_sold' => 0,
                'color' => null,
                'size_id' => null,
                'unit_id' => 1,
            ],
            [
                'id' => 18,
                'name' => 'Beats Studio3 Wireless',
                'branch_id' => 1,
                'barcode' => '000000000018',
                'category_id' => 1, // Audio Equipment
                'subcategory_id' => 1, // Noise-Canceling Headphones
                'brand_id' => 18, // Beats by Dre
                'cost' => 250,
                'price' => 300,
                'details' => 'Beats Studio3 Wireless combines stylish design with Pure Adaptive Noise Cancelling (Pure ANC) technology.',
                'image' => null,
                'stock' => 0,
                'main_unit_stock' => 0,
                'total_sold' => 0,
                'color' => null,
                'size_id' => null,
                'unit_id' => 1,
            ],
            [
                'id' => 19,
                'name' => 'JBL Charge 5',
                'branch_id' => 1,
                'barcode' => '000000000019',
                'category_id' => 1, // Audio Equipment
                'subcategory_id' => 2, // Portable Speakers
                'brand_id' => 19, // JBL
                'cost' => 150,
                'price' => 200,
                'details' => 'JBL Charge 5 offers powerful sound with deep bass and the ability to charge your devices on the go.',
                'image' => null,
                'stock' => 0,
                'main_unit_stock' => 0,
                'total_sold' => 0,
                'color' => null,
                'size_id' => null,
                'unit_id' => 1,
            ],
            [
                'id' => 20,
                'name' => 'Philips Hue Smart Bulbs',
                'branch_id' => 1,
                'barcode' => '000000000020',
                'category_id' => 1, // Home Automation
                'subcategory_id' => 1, // Smart Lighting
                'brand_id' => 20, // Philips
                'cost' => 60,
                'price' => 80,
                'details' => 'Philips Hue Smart Bulbs allow you to control your lighting with a mobile app or voice commands for a smart home experience.',
                'image' => null,
                'stock' => 0,
                'main_unit_stock' => 0,
                'total_sold' => 0,
                'color' => null,
                'size_id' => null,
                'unit_id' => 1,
            ],
            [
                'id' => 21,
                'name' => 'Xiaomi Mi 11 Ultra',
                'branch_id' => 1,
                'barcode' => '000000000021',
                'category_id' => 1, // Consumer Electronics
                'subcategory_id' => 1, // Smartphones
                'brand_id' => 21, // Xiaomi
                'cost' => 500,
                'price' => 650,
                'details' => 'Xiaomi Mi 11 Ultra offers top-notch performance with its powerful camera system and vibrant display.',
                'image' => null,
                'stock' => 0,
                'main_unit_stock' => 0,
                'total_sold' => 0,
                'color' => null,
                'size_id' => null,
                'unit_id' => 1,
            ],
        ];

        foreach ($products as $product) {
            Product::create($product);
        }
    }
}
