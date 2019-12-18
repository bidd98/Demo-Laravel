<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model

{

    protected $guarded = [];

    
    public function watches(){
        return $this->belongsToMany(Watch::class, 'order_watch', 'order_id', 'watch_id')->withPivot('quantity');
    }

    public function user(){
        return $this->belongsTo(User::class);
    }
}
