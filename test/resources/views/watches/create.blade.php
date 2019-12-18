@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{__('label.watch-create')}}</div>

                <div class="card-body">
                    @if (session('status'))
                    <div class="alert alert-success" role="alert">
                        {{ session('status') }}
                    </div>
                    @endif

                    <form enctype="multipart/form-data" action="/watches/create" method="POST">
                        @csrf
                        <div class="form-group">
                            <label for="category_id">{{__('label.category')}}</label>
                            <select name="category_id" class="form-control" id="category_id">
                                @foreach($categories as $category)
                                <option value="{{$category->id}}">{{$category->brand}}</option>
                                @endforeach
                            </select>

                        </div>
                        <div class="form-group">
                            <label for="Name">{{__('label.name')}}</label>
                            <input name="name" type="text" class="form-control" id="Name" placeholder="{{__('label.name')}}">
                            @error('name')
                            <span style="color:red">{{$message}}</span>
                            @enderror
                        </div>
                        <div class="form-group">
                            <label for="Price">{{__('label.price')}}</label>
                            <input name="price" type="number" step="0.01" class="form-control" id="Price" placeholder="{{__('label.price')}}">
                            @error('price')
                            <span style="color:red">{{$message}}</span>
                            @enderror
                        </div>

                        <div class="form-group">
                            <label for="Discount">{{__('label.discount')}}</label>
                            <input name="discount" type="number" step="0.5" class="form-control" id="Discount" placeholder="{{__('label.discount')}}">
                            @error('discount')
                            <span style="color:red">{{$message}}</span>
                            @enderror
                        </div>

                        <div class="form-group">
                            <label for="image">{{__('label.image')}}</label>
                            <input name="images[]" type="file" class="form-control-file" id="image" multiple>
                            @error('images')
                            <span style="color:red">{{$message}}</span><br/>
                            
                            @else

                            @error('images.*')
                            <span style="color:red">{{$message}}</span>
                            @enderror
                            @enderror
                        </div>

                        <a class="btn btn-danger" href="/watches">{{__('label.btn-cancle')}}</a>
                        <input type="submit" class="btn btn-primary" value="{{__('label.btn-create')}}" />
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection