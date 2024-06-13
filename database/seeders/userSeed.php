<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
class userSeed extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $users = [
            [
                'id' => 1,
                'name' => 'Super Admin',
                'email' => 'superadmin@gmail.com',
                'phone' => '12345656',
                'branch_id' => 1,
                'password' => Hash::make('111'),
            ],
            [
                'id' => 2,
                'name' => 'Admin',
                'email' => 'admin@gmail.com',
                'phone' => '1234567838',
                'branch_id' => 1,
                'password' => Hash::make('123'),
            ],
            [
                'id' => 3,
                'name' => 'Demo',
                'email' => 'demo@gmail.com',
<<<<<<< HEAD
                'phone' => '12345678',
=======
                'phone' => '1234538',
>>>>>>> 690cc98c4007643616f0185afb11840f9a796c8f
                'branch_id' => 1,
                'password' => Hash::make('12345678'),
            ],
        ];

        foreach ($users as $user) {
            User::create($user);
        }
    }
}
