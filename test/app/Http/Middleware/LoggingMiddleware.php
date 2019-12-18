<?php

namespace App\Http\Middleware;

use Closure;
use App\Logging;
use Carbon\Carbon;

class LoggingMiddleware
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
        // Get full url
        $url = $request->fullUrl();

        // Get Client IP Address
        $ip = $request->ip();

        // Get Request method
        $method = $request->method();

        // Log request to database
        Logging::create([
            'date' => Carbon::now()->toDateTimeString(),
            'client' => $ip,
            'method' => $method,
            'url' => $url,
        ]);
        
        

        return $next($request);
    }
}
