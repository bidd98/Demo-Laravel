<?php

namespace App\Http\Controllers;

use App\Exports\OrdersExport;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Http\Request;
use App\Order;
use Illuminate\Support\Facades\Config;

class OrderController extends Controller
{
    //
    public function index(){
        // Get all orders
        $orders = Order::orderBy('order_date', 'DESC')->paginate(Config::get('constants.item_number.orders'));
        
        // Return to index page
        return view('orders.index', compact('orders'));
    }

    public function export(){
        return Excel::download(new OrdersExport(), 'export.xlsx');
    }
}
