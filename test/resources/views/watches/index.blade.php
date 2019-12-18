@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">{{__('label.watches-manage')}}</div>

                <div class="card-body">
                    @if (session('status'))
                    <div class="alert alert-success" role="alert">
                        {{ session('status') }}
                    </div>
                    @endif
                    <a class="btn btn-primary" href="/watches/create">{{__('label.btn-create')}}</a>
                    @if(!$watches->isEmpty() && isset($watches))
                    <table class="table table-striped mt-2">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">{{__('label.category')}}</th>
                                <th scope="col">{{__('label.name')}}</th>
                                <th scope="col">{{__('label.image')}}</th>
                                <th scope="col">{{__('label.price')}}</th>
                                <th scope="col">{{__('label.discount')}}</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($watches as $watch)
                            <tr>
                                <th scope="row">{{$watch->id}}</th>
                                <td>{{$watch->category->brand}}</td>
                                <td>{{$watch->name}}</td>
                                <td><img src="{{$watch->image}}" style="max-width: 100px"></td>
                                <td>{{$watch->price*session('cur')->rate . session('cur')->shortcut}}</td>
                                <td>{{$watch->discount}}%</td>
                                <td>
                                    <a href="/watches/{{$watch->id}}/edit" class="btn btn-dark mr-1">{{__('label.btn-update')}}</a>


                                    <button class="btn btn-danger" data-href="/watches/{{$watch->id}}" data-toggle="modal" data-target="#confirm-delete">
                                    {{__('label.btn-delete')}}
                                    </button>

                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                    {{$watches->links()}}

                    <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3 style="color:red">Do you really want to delete this record?</h3>
                                </div>
                                
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                    <form action="/watches/{{$watch->id}}" method="POST">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="btn btn-danger btn-ok">Delete</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    @else
                    <h3 class="pt-4">There is no item available at the moment</h3>
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
@endsection