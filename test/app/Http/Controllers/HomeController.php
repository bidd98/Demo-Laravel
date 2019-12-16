<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Watch;
use Illuminate\Support\Facades\Config;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth')->only('index');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        
        
        return view('home');
    }

    public function welcome(){

    
        $watches = Watch::paginate(Config::get('constants.item_number.watches-index'));

        return view('welcome', compact('watches'));
    }
}
