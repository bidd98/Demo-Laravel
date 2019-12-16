<?php

use Illuminate\Database\Seeder;
use App\Permission;
class PermissionsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Permission::insert([
            // Watch Controller
            [
                'controller' => 'WatchController',
                'method' => 'index',
            ],
            [
                'controller' => 'WatchController',
                'method' => 'create',
            ],
            [
                'controller' => 'WatchController',
                'method' => 'store',
            ],
            [
                'controller' => 'WatchController',
                'method' => 'show',
            ],
            [
                'controller' => 'WatchController',
                'method' => 'edit',
            ],
            [
                'controller' => 'WatchController',
                'method' => 'update',
            ],
            [
                'controller' => 'WatchController',
                'method' => 'destroy',
            ],

            // Category Controller

            [
                'controller' => 'CategoryController',
                'method' => 'index',
            ],
            [
                'controller' => 'CategoryController',
                'method' => 'create',
            ],
            [
                'controller' => 'CategoryController',
                'method' => 'store',
            ],
            [
                'controller' => 'CategoryController',
                'method' => 'edit',
            ],
            [
                'controller' => 'CategoryController',
                'method' => 'update',
            ],
            [
                'controller' => 'CategoryController',
                'method' => 'destroy',
            ],

            // Payment Controller

            [
                'controller' => 'PaymentController',
                'method' => 'confirm',
            ],
            [
                'controller' => 'PaymentController',
                'method' => 'create',
            ],

            [
                'controller' => 'PaymentController',
                'method' => 'return',
            ],

            // User Order Controller
            [
                'controller' => 'UserOrderController',
                'method' => 'index',
            ],
            [
                'controller' => 'UserOrderController',
                'method' => 'show',
            ],
            [
                'controller' => 'UserOrderController',
                'method' => 'processOrder',
            ],
            [
                'controller' => 'UserOrderController',
                'method' => 'export',
            ],

            // Order Controller
            [
                'controller' => 'OrderController',
                'method' => 'index',
            ],
            [
                'controller' => 'OrderController',
                'method' => 'export',
            ],
            // [
            //     'controller' => 'OrderController',
            //     'method' => 'store',
            // ],
            // [
            //     'controller' => 'OrderController',
            //     'method' => 'edit',
            // ],
            [
                'controller' => 'OrderController',
                'method' => 'show',
            ],
            // [
            //     'controller' => 'OrderController',
            //     'method' => 'update',
            // ],
            // [
            //     'controller' => 'OrderController',
            //     'method' => 'destroy',
            // ],
            [
                'controller' => 'HomeController',
                'method' => 'index',
            ],
        ]);
    }
}
