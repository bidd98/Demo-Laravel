@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">Watches Management</div>

                <div class="card-body">
                    @if (session('status'))
                    <div class="alert alert-success" role="alert">
                        {{ session('status') }}
                    </div>
                    @endif

                    <form id="watch-edit-form" enctype="multipart/form-data" action="/watches/{{$watch->id}}" method="POST">
                        @csrf
                        @method('PATCH')
                        <div class="form-group">
                            <label for="category_id">Category</label>
                            <select name="category_id" class="form-control" id="category_id">
                                @foreach($categories as $category)
                                @if($category->id == $watch->category->id)
                                <option selected value="{{$category->id}}">{{$category->brand}}</option>
                                @else
                                <option value="{{$category->id}}">{{$category->brand}}</option>
                                @endif
                                @endforeach
                            </select>

                        </div>
                        <div class="form-group">
                            <label for="Name">Name</label>
                            <input value="{{$watch->name}}" name="name" type="text" class="form-control" id="Name" placeholder="Name">
                            @error('name')
                            <span style="color:red">{{$message}}</span>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label for="Price">Price</label>
                            <input value="{{$watch->price}}" name="price" type="number" step="0.01" class="form-control" id="Price" placeholder="Price">

                            @error('price')
                            <span style="color:red">{{$message}}</span>
                            @enderror
                        </div>

                        <div class="form-group">
                            <label for="Discount">Discount</label>
                            <input value="{{$watch->discount}}" name="discount" type="number" step="0.5" class="form-control" id="Discount" placeholder="Discount">
                            @error('discount')
                            <span style="color:red">{{$message}}</span>
                            @enderror
                        </div>

                        <div class="form-group">
                            <label for="image">Images</label>
                            <input name="images[]" type="file" class="form-control-file" id="image" multiple>
                            <input class="images-add-df" name="images[]" type="hidden" value=""/>
                            @error('images')
                            <span style="color:red">{{$message}}</span><br />

                            @else

                            @error('images.*')
                            <span style="color:red">{{$message}}</span>
                            @enderror
                            @enderror
                        </div>

                       
                        <div class="form-group image-div">
                            @foreach($images as $image)
                            <div class="img-container col-4">
                                <img src="{{$image->path}}" alt="Avatar" class="image  img-fluid img-thumbnail">
                                <div class="overlay">
                                    <div class="text"><button type="button" id="image-{{$image->id}}" class="btn btn-danger btn-dlt-image">Delete</button></div>
                                </div>
                            </div>
                            @endforeach
                        </div>
                        <input class="images-del-df" type="hidden" name="images-del[]" value=""/>

                        <input type="submit" class="btn btn-primary" value="Save" />
                        
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection