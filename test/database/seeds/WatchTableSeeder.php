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
                'image' => 'watches/6RZw8iWm5ydUgtBndu4Qp1oFh0i4tc0MMRUGUbsA.jpeg',
            ],
            [
                'category_id' => 1,
                'name' => 'Lux2.c',
                'price' => '21',
                'discount' => '45',
                'image' => 'watches/dK8MH9jcjSI5Sp5zyVf6Hl5PMVmYSdU7mtQdOOlc.jpeg',
            ],
            [
                'category_id' => 1,
                'name' => 'Lux2.d',
                'price' => '25',
                'discount' => '50',
                'image' => 'watches/dK8MH9jcjSI5Sp5zyVf6Hl5PMVmYSdU7mtQdOOlc.jpeg',
            ],
            [
                'category_id' => 2,
                'name' => 'Layya',
                'price' => '10',
                'discount' => '20',
                'image' => 'watches/h0X7yraXY8HYeNQeHUIYrMSbvR6cvBkOGSaZUU9N.jpeg',
            ],
            [
                'category_id' => 2,
                'name' => 'Layya-royal',
                'price' => '30',
                'discount' => '60',
                'image' => 'watches/h0X7yraXY8HYeNQeHUIYrMSbvR6cvBkOGSaZUU9N.jpeg',
            ],
            [
                'category_id' => 3,
                'name' => 'Luxxu',
                'price' => '25',
                'discount' => '80',
                'image' => 'watches/iSQUf8Xx8uXzffCtBjtO1MtZMErQOSk3OB3apm7T.jpeg',
            ],
            [
                'category_id' => 3,
                'name' => 'fooly',
                'price' => '30',
                'discount' => '20',
                'image' => 'watches/qjshi0cFtvZzIS84I3BF5bJK9TedrCjMetqDTxds.jpeg',
            ],
            [
                'category_id' => 4,
                'name' => 'Royallya',
                'price' => '20',
                'discount' => '10',
                'image' => 'watches/MhEl5S0BhgbdoXbL2v9dasWO3zhSoU9RsBxvReqo.jpeg',
            ],
            [
                'category_id' => 4,
                'name' => 'Batterle',
                'price' => '20',
                'discount' => '40',
                'image' => 'watches/qjshi0cFtvZzIS84I3BF5bJK9TedrCjMetqDTxds.jpeg',
            ],
        ]);
    }
}
