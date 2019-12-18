<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class User_info extends Model
{
    //

    public function user(){
        return $this->belongsTo(User::class);
    }
}
