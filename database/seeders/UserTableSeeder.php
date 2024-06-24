<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class UserTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        User::where('email', 'admin@gmail.com')->delete();
        DB::statement('SET FOREIGN_KEY_CHECKS=1;');


        $users = [
            [
                "full_name" => 'admin',
                "nick_name" => 'admin',
                'email' => "admin@gmail.com",
                'password' => bcrypt('11223344'),
                'role_id' => 1
            ]
        ];

        foreach ($users as $user) {
            User::create($user);
        }
    }
}
