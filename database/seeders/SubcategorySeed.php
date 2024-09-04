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
                'name' => 'Smartphones',
                'slug' => 'smartphones',
            ],
            [
                'id' => 2,
                'category_id' => 1,
                'name' => 'Tablets',
                'slug' => 'tablets',
            ],
            [
                'id' => 3,
                'category_id' => 1,
                'name' => 'Smart TVs',
                'slug' => 'smart-tvs',
            ],
            [
                'id' => 4,
                'category_id' => 1,
                'name' => 'Digital Cameras',
                'slug' => 'digital-cameras',
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
            [
                'id' => 8,
                'category_id' => 2,
                'name' => 'Microwaves',
                'slug' => 'microwaves',
            ],
            [
                'id' => 9,
                'category_id' => 2,
                'name' => 'Dishwashers',
                'slug' => 'dishwashers',
            ],
            [
                'id' => 10,
                'category_id' => 2,
                'name' => 'Air Conditioners',
                'slug' => 'air-conditioners',
            ],

            // Computing Devices
            [
                'id' => 11,
                'category_id' => 3,
                'name' => 'Desktop Computers',
                'slug' => 'desktop-computers',
            ],
            [
                'id' => 12,
                'category_id' => 3,
                'name' => 'Laptops',
                'slug' => 'laptops',
            ],
            [
                'id' => 13,
                'category_id' => 3,
                'name' => 'Monitors',
                'slug' => 'monitors',
            ],
            [
                'id' => 14,
                'category_id' => 3,
                'name' => 'Keyboards',
                'slug' => 'keyboards',
            ],
            [
                'id' => 15,
                'category_id' => 3,
                'name' => 'Printers',
                'slug' => 'printers',
            ],

            // Audio/Video Equipment
            [
                'id' => 16,
                'category_id' => 4,
                'name' => 'Home Theater Systems',
                'slug' => 'home-theater-systems',
            ],
            [
                'id' => 17,
                'category_id' => 4,
                'name' => 'Blu-ray Players',
                'slug' => 'blu-ray-players',
            ],
            [
                'id' => 18,
                'category_id' => 4,
                'name' => 'Soundbars',
                'slug' => 'soundbars',
            ],
            [
                'id' => 19,
                'category_id' => 4,
                'name' => 'Action Cameras',
                'slug' => 'action-cameras',
            ],
            [
                'id' => 20,
                'category_id' => 4,
                'name' => 'Headphones',
                'slug' => 'headphones',
            ],

            // Wearable Technology
            [
                'id' => 21,
                'category_id' => 5,
                'name' => 'Smartwatches',
                'slug' => 'smartwatches',
            ],
            [
                'id' => 22,
                'category_id' => 5,
                'name' => 'Fitness Trackers',
                'slug' => 'fitness-trackers',
            ],
            [
                'id' => 23,
                'category_id' => 5,
                'name' => 'VR Headsets',
                'slug' => 'vr-headsets',
            ],
            [
                'id' => 24,
                'category_id' => 5,
                'name' => 'Smart Glasses',
                'slug' => 'smart-glasses',
            ],
            [
                'id' => 25,
                'category_id' => 5,
                'name' => 'Health Monitors',
                'slug' => 'health-monitors',
            ],

            // Networking Devices
            [
                'id' => 26,
                'category_id' => 6,
                'name' => 'Routers',
                'slug' => 'routers',
            ],
            [
                'id' => 27,
                'category_id' => 6,
                'name' => 'Modems',
                'slug' => 'modems',
            ],
            [
                'id' => 28,
                'category_id' => 6,
                'name' => 'Network Switches',
                'slug' => 'network-switches',
            ],
            [
                'id' => 29,
                'category_id' => 6,
                'name' => 'Wireless Access Points',
                'slug' => 'wireless-access-points',
            ],
            [
                'id' => 30,
                'category_id' => 6,
                'name' => 'Network Attached Storage (NAS)',
                'slug' => 'network-attached-storage',
            ],

            // Gaming
            [
                'id' => 31,
                'category_id' => 7,
                'name' => 'Gaming Consoles',
                'slug' => 'gaming-consoles',
            ],
            [
                'id' => 32,
                'category_id' => 7,
                'name' => 'Gaming PCs',
                'slug' => 'gaming-pcs',
            ],
            [
                'id' => 33,
                'category_id' => 7,
                'name' => 'Gaming Headsets',
                'slug' => 'gaming-headsets',
            ],
            [
                'id' => 34,
                'category_id' => 7,
                'name' => 'Game Controllers',
                'slug' => 'game-controllers',
            ],
            [
                'id' => 35,
                'category_id' => 7,
                'name' => 'VR Gaming Systems',
                'slug' => 'vr-gaming-systems',
            ],

            // Medical Electronics
            [
                'id' => 36,
                'category_id' => 8,
                'name' => 'Digital Thermometers',
                'slug' => 'digital-thermometers',
            ],
            [
                'id' => 37,
                'category_id' => 8,
                'name' => 'Blood Glucose Meters',
                'slug' => 'blood-glucose-meters',
            ],
            [
                'id' => 38,
                'category_id' => 8,
                'name' => 'Heart Rate Monitors',
                'slug' => 'heart-rate-monitors',
            ],
            [
                'id' => 39,
                'category_id' => 8,
                'name' => 'Pulse Oximeters',
                'slug' => 'pulse-oximeters',
            ],
            [
                'id' => 40,
                'category_id' => 8,
                'name' => 'Medical Imaging Devices',
                'slug' => 'medical-imaging-devices',
            ],

            // Industrial Electronics
            [
                'id' => 41,
                'category_id' => 9,
                'name' => 'Programmable Logic Controllers (PLCs)',
                'slug' => 'programmable-logic-controllers',
            ],
            [
                'id' => 42,
                'category_id' => 9,
                'name' => 'Industrial Sensors',
                'slug' => 'industrial-sensors',
            ],
            [
                'id' => 43,
                'category_id' => 9,
                'name' => 'Variable Frequency Drives (VFDs)',
                'slug' => 'variable-frequency-drives',
            ],
            [
                'id' => 44,
                'category_id' => 9,
                'name' => 'Automation Controllers',
                'slug' => 'automation-controllers',
            ],
            [
                'id' => 45,
                'category_id' => 9,
                'name' => 'Industrial Cameras',
                'slug' => 'industrial-cameras',
            ],
        ];


        foreach ($subcategories as $subcategory) {
            SubCategory::create($subcategory);
        }
    }
}
