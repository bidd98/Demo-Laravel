<?php

use App\Category;
use Illuminate\Database\Seeder;

class CategoryTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        Category::insert([
            [
                'brand' => 'Luxuc'
            ],
            [
                'brand' => 'Royal',
            ],
            [
                'brand' => 'Tulip',
            ],
            [
                'brand' => 'Sunny',
            ],
            [
                'brand' => 'Princess',
            ],
            [
                'brand' => 'Romance',
            ],
            [
                'brand' => 'Romance1',
            ],
            [
                'brand' => 'Romance2',
            ],
            [
                'brand' => 'Romance3',
            ],
            [
                'brand' => 'Romance4',
            ],
            [
                'brand' => 'Romance5',
            ],
            [
                'brand' => 'Romance6',
            ],
            [
                'brand' => 'Romance7',
            ],
            [
                'brand' => 'Romance8',
            ],


        ]);
    }
}
