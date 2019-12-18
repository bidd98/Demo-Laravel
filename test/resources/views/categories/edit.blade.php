@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">Watches Management</div>

                <div class="card-body">
                    @if (session('status'))
                    <div class="alert alert-success" role="alert">
                        {{ session('status') }}
                    </div>
                    @endif

                    <form enctype="multipart/form-data" action="/categories/{{$category->id}}" method="POST">
                        @csrf
                        @method('PATCH')    
                        <div class="form-group">
                            <label for="Brand">Brand</label>
                            <input value="{{$category->brand}}" name="brand" type="text" class="form-control" id="brand" placeholder="Brand">
                            @error('brand')
                            <span style="color:red">{{$message}}</span>
                            @enderror
                        </div>

                        <a class="btn btn-danger" href="/categories">{{__('label.btn-cancle')}}</a>
                        <input type="submit" class="btn btn-primary" value="{{__('label.btn-save')}}" />
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection