@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{__('label.category-create')}}</div>

                <div class="card-body">
                    @if (session('status'))
                    <div class="alert alert-success" role="alert">
                        {{ session('status') }}
                    </div>
                    @endif

                    <form enctype="multipart/form-data" action="/categories/create" method="POST">
                        @csrf
                        
                        <div class="form-group">
                            <label for="Brand">{{__('label.category')}}</label>
                            <input name="brand" type="text" class="form-control" id="brand" placeholder="{{__('label.category')}}">
                            @error('brand')
                            <span style="color:red">{{$message}}</span>
                            @enderror
                        </div>

                        <input type="submit" class="btn btn-primary" value="{{__('label.btn-create')}}" />
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection