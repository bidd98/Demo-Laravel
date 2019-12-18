<?php

use Illuminate\Database\Seeder;
use App\User;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::insert([
            [
                'name' => 'hung',
                'email' => 'hungnl.qb98@gmail.com',
                'password' => bcrypt('1234567890'),
            ],
            [
                'name' => 'khanh',
                'email' => 'test2@gmail.com',
                'password' => bcrypt('1234567890'),
            ],
            [
                'name' => 'dung',
                'email' => 'test3@gmail.com',
                'password' => bcrypt('1234567890'),
            ]
        ]);
    }
}

