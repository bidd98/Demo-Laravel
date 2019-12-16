@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">{{__('label.categories-manage')}}</div>

                <div class="card-body">
                    @if (session('status'))
                    <div class="alert alert-success" role="alert">
                        {{ session('status') }}
                    </div>
                    @endif
                    <a class="btn btn-primary" href="/categories/create">{{__('label.btn-create')}}</a>
                    @if(!$categories->isEmpty())
                    <table class="table table-striped mt-2">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">{{__('label.category')}}</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($categories as $category)
                            <tr>
                                <th scope="row">{{$category->id}}</th>
                                <td class="col-4">{{$category->brand}}</td>
                                <td>
                                    <a href="/categories/{{$category->id}}/edit" class="btn btn-dark mr-1">{{__('label.btn-update')}}</a>


                                    <button class="btn btn-danger" data-href="/categories/{{$category->id}}" data-toggle="modal" data-target="#confirm-delete">
                                        {{__('label.btn-delete')}}
                                    </button>

                                </td>
                            </tr>
                            @endforeach

                        </tbody>
                    </table>
                    {{$categories->links()}}

                    <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h3 style="color:red">Do you really want to delete this record?</h3>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                    <form action="/categories/{{$category->id}}" method="POST">
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