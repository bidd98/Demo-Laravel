<?php

namespace App\Http\Controllers;

use App\Currency;
use App\Exports\InvoicesExport;
use App\Exports\UserOrdersExport;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Http\Request;
use App\Order;
use Illuminate\Support\Facades\Config;

class UserOrderController extends Controller
{
    //
    public function index(){
        // Get Orders of this User
        $orders = auth()->user()->orders()->orderBy('order_date', 'DESC')->paginate(Config::get('constants.item_number.orders'));
        // dd($orders[0]->watches[0]->pivot);
        // Return to view
        return view('users.orders.index', compact('orders'));
    }

    public function processOrder($id){
        // Get Current Order
        $order = Order::find($id);

        // Get quantity of this watch in the order
        $quantity = $order->watches[0]->pivot->quantity;

        // Get discount
        $discount = $order->watches[0]->discount;

        // Get the price of this watch
        $price = $order->watches[0]->price;

        // Calculate total money to pay
        $rate = Currency::where('symbol', 'VND')->get()[0]->rate;
        $total = $quantity * $price * $rate * (1 - $discount/100);

        // Sent to create payment page
        return view('payments.confirm', compact('id', 'total'));
        
    }

    public function show($id){
        // get Current Order
        $order = Order::find($id);

        // Get Watch item of this order
        $watch = $order->watches[0];

        // Get total money of this order
        $total = $watch->pivot->quantity * $watch->price * (1-$watch->discount/100);

        return view('users.orders.show', compact('order', 'watch', 'total'));
    }

    public function export(){
        return Excel::download(new UserOrdersExport(), 'export.xlsx');
    }
}
