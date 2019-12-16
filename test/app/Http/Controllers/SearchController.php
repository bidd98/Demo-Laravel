<?php

namespace App\Http\Controllers;

use App\Watch;
use Illuminate\Http\Request;

class SearchController extends Controller
{
    public function search(Request $request){
        $search = $request->get('search');
        $watches = Watch::search($search)->get();
        $result = [];
        foreach($watches as $watch)
        array_push($result, [
            'id' => $watch->id,
            'name' => $watch->name,
            'category' => $watch->category->brand,
            'price' => $watch->price,
            'discount' => $watch->discount,
        ]);
        return json_encode($result);
    }
}
