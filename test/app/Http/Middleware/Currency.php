<?php

namespace App\Http\Middleware;

use Closure;

class Currency
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        if(is_null(session('cur'))){
            $currency = \App\Currency::where('symbol', 'USD')->get()[0];
            session(['cur'=> $currency]);
        }
        
        return $next($request);
    }
}
