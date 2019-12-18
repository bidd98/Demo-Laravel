<?php

use App\Http\Middleware\Authorize;
use App\Http\Middleware\Currency;
use App\Http\Middleware\Language;
use App\Http\Middleware\LoggingMiddleware;
use Illuminate\Auth\Middleware\Authorize as MiddlewareAuthorize;
use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Auth::routes();

Route::get('/', 'HomeController@welcome')->middleware(Currency::class);




Route::post('/search', 'SearchController@search');



Route::group(['middleware' => ['auth', Authorize::class ]], function(){

Route::get('/home', 'HomeController@index');
Route::get('/watches', 'WatchController@index');
Route::get('/watches/create', 'WatchController@create');
Route::post('/watches/create', 'WatchController@store');
Route::get('/watches/{id}/edit', 'WatchController@edit');

Route::patch('/watches/{id}', 'WatchController@update');
Route::delete('/watches/{id}', 'WatchController@destroy');



// Category routing

Route::get('/categories', 'CategoryController@index');
Route::get('/categories/create', 'CategoryController@create');
Route::post('/categories/create', 'CategoryController@store');
Route::get('/categories/{id}/edit', 'CategoryController@edit');
Route::patch('/categories/{id}', 'CategoryController@update');
Route::delete('/categories/{id}', 'CategoryController@destroy');



// Paymeny Confirm
Route::post('/payments/cf', 'PaymentController@confirm');
Route::post('/payments/create', 'PaymentController@create');
Route::get('/payments/return', 'PaymentController@return');

// User Order
Route::get('/user/order', 'UserOrderController@index');
Route::get('/user/order/export', 'UserOrderController@export');
Route::get('/user/order/{id}', 'UserOrderController@show');
Route::get('/user/order/finish/{id}', 'UserOrderController@processOrder');


// System Orders
Route::get('/orders', 'OrderController@index')->middleware(Authorize::class);
Route::get('/orders/export', 'OrderController@export');
Route::get('/orders/create', 'OrderController@create');
Route::post('/orders/create', 'OrderController@store');
Route::get('/orders/{id}/edit', 'OrderController@edit');
Route::get('/orders/{id}', 'OrderController@show');
Route::patch('/orders/{id}', 'OrderController@update');
Route::delete('/orders/{id}', 'OrderController@destroy');

// Registry Middle

});

// Rouge to setting Language
// Route::get('/languages/{lang}', 'LanguageController@update');

// Route to setting currency
Route::get('/currencies/{symbol}', 'CurrencyController@update');


Route::get('/watches/{id}', 'WatchController@show');


// Reset password

Route::get('/languages/{lang}', 'LanguageController@update');

// Watch routing