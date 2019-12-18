<?php

use App\Watch;
use Illuminate\Database\Seeder;

class WatchTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        Watch::insert([
            [
                'category_id' => 1,
                'name' => 'Lux2.a',
                'price' => '20',
                'discount' => '40',
                'image' => 'https://res.cloudinary.com/dh1cdxsr9/image/upload/v1576626831/watches/r5tv0yulwbra3i63pefy.jpg',
            ],
            [
                'category_id' => 1,
                'name' => 'Lux2.c',
                'price' => '21',
                'discount' => '45',
                'image' => 'https://res.cloudinary.com/dh1cdxsr9/image/upload/v1576627709/watches/zqvbbl9vpms5ibz1vtux.jpg',
            ],
            [
                'category_id' => 1,
                'name' => 'Lux2.d',
                'price' => '25',
                'discount' => '50',
                'image' => 'https://res.cloudinary.com/dh1cdxsr9/image/upload/v1576627707/watches/u2t5m4kkl830cxznehsa.jpg',
            ],
            [
                'category_id' => 2,
                'name' => 'Layya',
                'price' => '10',
                'discount' => '20',
                'image' => 'https://res.cloudinary.com/dh1cdxsr9/image/upload/v1576627705/watches/z0782z2qhifumerwdndx.jpg',
            ],
            [
                'category_id' => 2,
                'name' => 'Layya-royal',
                'price' => '30',
                'discount' => '60',
                'image' => 'https://res.cloudinary.com/dh1cdxsr9/image/upload/v1576627690/watches/kzmuimitylroveuntwgr.jpg',
            ],
            [
                'category_id' => 3,
                'name' => 'Luxxu',
                'price' => '25',
                'discount' => '80',
                'image' => 'https://res.cloudinary.com/dh1cdxsr9/image/upload/v1576627688/watches/vh3s4pi3hmunlduksvbn.jpg',
            ],
            [
                'category_id' => 3,
                'name' => 'fooly',
                'price' => '30',
                'discount' => '20',
                'image' => 'https://res.cloudinary.com/dh1cdxsr9/image/upload/v1576627686/watches/fsfz5zmg3nrxpmey9pz8.jpg',
            ],
            [
                'category_id' => 4,
                'name' => 'Royallya',
                'price' => '20',
                'discount' => '10',
                'image' => 'https://res.cloudinary.com/dh1cdxsr9/image/upload/v1576627686/watches/fsfz5zmg3nrxpmey9pz8.jpg',
            ],
            [
                'category_id' => 4,
                'name' => 'Batterle',
                'price' => '20',
                'discount' => '40',
                'image' => 'https://res.cloudinary.com/dh1cdxsr9/image/upload/v1576627436/watches/b6xrctrmncxdkoyfxxjk.jpg',
            ],
        ]);
    }
}
