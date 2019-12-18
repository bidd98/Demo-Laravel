<?php

use App\Currency;
use Illuminate\Database\Seeder;

class CurrencyTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Currency::insert([
            [
                'name' => 'Dollar',
                'symbol' => 'USD',
                'rate' => 1,
                'shortcut' => '$',
            ],
            [
                'name' => 'Vietnamdong',
                'symbol' => 'VND',
                'rate' => '22000',
                'shortcut' => 'đ'
            ]
        ]);
    }
}
