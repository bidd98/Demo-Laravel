<?php

namespace App\Http\Controllers;

use App\Currency;
use Illuminate\Http\Request;

class CurrencyController extends Controller
{
    //
    public function update($symbol){
        $currency = Currency::where('symbol',$symbol)->get()[0];
        session(['cur' => $currency]);
        // dd($currency);
       
        return back();
    }
}
//