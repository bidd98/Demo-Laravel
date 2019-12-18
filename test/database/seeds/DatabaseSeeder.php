<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // $this->call(UsersTableSeeder::class);
        $this->call(
            [
                UsersTableSeeder::class,
                RolesTableSeeder::class,
                PermissionsTableSeeder::class,
                PermissionRolePivotTableSeeder::class,
                RoleUserPivotTableSeeder::class,
                CurrencyTableSeeder::class,
                CategoryTableSeeder::class,
                WatchTableSeeder::class,
                ImageTableSeeder::class,
            ]
        );
    }
}
