<?php

namespace App\Http\Controllers;

use Laravel\Scout\Searchable;
use App\Watch;
use App\Category;
use App\Http\Requests\WatchStoreRequest;
use App\Http\Requests\WatchUpdateRequest;
use Illuminate\Support\Facades\Config;
use Intervention\Image\Facades\Image;

class WatchController extends Controller
{

    public function index()
    {
        // Get all Watches
        $watches = Watch::paginate(Config::get('constants.item_number.watches'));
        
        return view('watches.index', compact('watches'));
    }

    public function show($id){
        // Get current Watch
        $watch = Watch::find($id);

        // Return to show page
        return view('watches.show', compact('watch'));
    }

    public function create()
    {
        // Get all Categories
        $categories = Category::all();
        return view('watches.create', compact('categories'));
    }

    public function store(WatchStoreRequest $request)
    {
        // Get all validated datas
        $data = $request->validated();

        // Get all upload images
        $images = $data['images'];

        // Get Images Path array
        $imagePaths = $this->getImagePaths($images);

        // Insert new watch into db
        $watch = Watch::create([
            'category_id' => $data['category_id'],
            'name' => $data['name'],
            'price' => $data['price'],
            'discount' => $data['discount'],
            'image' => $imagePaths[0],
        ]);

        // Insert new images to this Watch
        $this->storeImage($watch, $images);

        return redirect('/watches');
    }

    public function edit($id)
    {
        // Get Watch by Id
        $watch = Watch::find($id);

        // Get Brand lists
        $categories = Category::all();

        // Get all Images of the watch
        $images = $watch->images;

        return view('watches.edit', compact('watch', 'categories', 'images'));
    }


    public function update($id, WatchUpdateRequest $request)
    {
        // Get the current Watch
        $watch = Watch::find($id);

        // Get validated data
        $data = $request->validated();

        // Get Images to insert if exists
        $images = $data['images'];

        // Get Images to delete if exists
        $imagesDel = $data['images-del'];

        // This block is used to delete element form
        // added image into db when we click delete button in edit section
        if ($images[0]) {

            if ($imagesDel[0]) {

                foreach ($imagesDel as $imageDel) {

                    for ($i = 0; $i < count($images); $i++) {

                        if (strcmp($imageDel, $images[$i]->getClientOriginalName()) == 0) {

                            unset($images[$i]);

                            $images = array_values($images);

                            break;
                        }
                    }
                }

                $this->deleteImage($watch, $imagesDel);
            }

            $this->storeImage($watch, $images);
        } else {

            if ($imagesDel[0]) {
                
                $this->deleteImage($watch, $imagesDel);
            }
        }

        $watch = Watch::find($id);

        // Update current Watch
        $watch->update([
            'category_id' => $data['category_id'],
            'name' => $data['name'],
            'price' => $data['price'],
            'discount' => $data['discount'],
            'image' => $watch->images[0]->path,
        ]);

        return redirect('/watches');
    }

    public function destroy($id)
    {
        Watch::find($id)->delete();
        return redirect('/watches');
    }

    public function getImagePaths(array $images)
    {
        // Init array for Images Path
        $imagesPath = array();

        // Loop through each image
        foreach ($images as $image) {

            //Save image path to local storage and then return it
            $imagesPathItem = $image->store('watches', 'public');

            // Push returned image path to array
            array_push($imagesPath, $imagesPathItem);
        }

        // Return
        return $imagesPath;
    }

    public function storeImage(Watch $watch, array $images)
    {
        $imagePaths = $this->getImagePaths($images);

        //Insert each image into db
        foreach ($imagePaths as $path) {

            $watch->images()->create([
                'watch_id' => $watch->id,
                'path' => $path,
            ]);
        }
    }
    public function deleteImage(Watch $watch, array $imagesDel)
    {
        foreach ($imagesDel as $imageDel) {
            if (!strpos($imageDel, '.') !== false) {
                $watch->images->find($imageDel)->forceDelete();
            }
        }
    }
}
