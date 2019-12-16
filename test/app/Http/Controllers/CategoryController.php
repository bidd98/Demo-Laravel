<?php

namespace App\Http\Controllers;

use App\Category;
use App\Http\Requests\CategoryStoreRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;

class CategoryController extends Controller
{
    

    //
    public function index()
    {

        // Get all Categories
        $categories = Category::paginate(Config::get('constants.item_number.categories'));

        // Return to view
        return view('categories.index', compact('categories'));
    }

    public function create()
    {
        return view('categories.create');
    }

    public function store(CategoryStoreRequest $request)
    {
        // Get validated data
        $data = $request->validated();

        // Insert into db
        Category::create([
            'brand' => $data['brand'],
        ]);

        // Redirect to index page
        return redirect('/categories');
    }

    public function edit($id)
    {
        // Get Category for updating
        $category = Category::find($id);

        // Return to edit page
        return view('categories.edit', compact('category'));
    }

    public function update($id, CategoryStoreRequest $request)
    {
        // Get Category to be updated
        $category = Category::find($id);

        // Get validated data
        $data = $request->validated();

        // Update Category and then redirect to index page
        $category->update([
            'brand' => $data['brand'],
        ]);

        return redirect('/categories');
    }

    public function destroy($id)
    {
        // Delete selected Category by ID
        Category::find($id)->forceDelete();

        // Redirect to index page
        return redirect('/categories');
    }
}
