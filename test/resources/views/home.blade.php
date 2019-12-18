@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                <div class="card-header">{{__('label.admin-dashboard')}}</div>

                <div class="card-body">
                    @if (session('status'))
                    <div class="alert alert-success" role="alert">
                        {{ session('status') }}
                    </div>
                    @endif

                    <nav class="navbar navbar-expand-lg navbar-light bg-light">
                        <a class="btn btn-link" href="/watches">{{__('label.watch')}}</a>
                        <a class="btn btn-link" href="/categories">{{__('label.category')}}</a>
                        <a class="btn btn-link" href="/orders">{{__('label.order')}}</a>                  
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection