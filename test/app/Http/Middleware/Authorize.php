<?php

namespace App\Http\Middleware;

use Closure;

class Authorize
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
        $roles = auth()->user()->roles;
        $actionName = class_basename($request->route()->getActionName());
        foreach($roles as $role){
            foreach($role->permissions as $permission){
                if ($actionName == $permission->controller . '@' . $permission->method){
                    return $next($request);
                }
                
            }
        }
        return response()->view('auth.unauthor');
        
    }
}
