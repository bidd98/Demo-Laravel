<?php

use Illuminate\Database\Seeder;
use App\User;

class RoleUserPivotTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::find(1)
        ->roles()
        ->attach([1,2]);

        User::find(2)
        ->roles()
        ->attach(2);
    }
}
