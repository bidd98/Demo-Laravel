<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $guarded = [];
    //
    public function watches(){
        return $this->hasMany('App\Watch');
    }
}
