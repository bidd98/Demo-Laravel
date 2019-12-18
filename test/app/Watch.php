<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Scout\Searchable;

class Watch extends Model
{

    use Searchable;

    protected $guarded = [];
    //
    // Get the category that this belongs to
    public function category()
    {
        return $this->belongsTo('App\Category', 'category_id', 'id');
    }

    // Get all orders contain this watch
    public function order()
    {
        return $this->belongsToMany(Order::class);
    }

    // Get all images belongs to this watch
    public function images()
    {
        return $this->hasMany(Image::class);
    }

    public function toSearchableArray()
    {
        $array = $this->toArray();

        // $array = $this->transform($array);

        $array['category'] = $this->category->brand;

        return $array;
    }
}
