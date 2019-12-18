<?php

use Illuminate\Database\Seeder;
use App\Role;

class PermissionRolePivotTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Role::find(1)
            ->permissions()
            ->attach([
                1, 2, 3, 4, 5,
                6, 7, 8, 9, 10,
                11, 12, 13, 21, 22, 23, 24
            ]);

        Role::find(2)
            ->permissions()
            ->attach([
                14, 15, 16, 
                17, 18, 19, 20
            ]);
    }
}
