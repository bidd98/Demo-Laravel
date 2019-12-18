@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">{{__('label.watch')}}</div>

                <div class="card-body">
                    @if (session('status'))
                    <div class="alert alert-success" role="alert">
                        {{ session('status') }}
                    </div>
                    @endif

                    <div class="container">
                        <div class="row">

                            <div class="col-6">
                                <img class="mb-5" src="{{$watch->image}}" style="max-width: 100%">
                                
                                @foreach($watch->images as $image)

                                <img src="{{$image->path}}" style="width: 120px; height: auto"/>

                                @endforeach
                            </div>
                            <div class="col-6">
                                <span class="heading-primary brand">{{$watch->category->brand}}</span>
                                <span class="heading-subprimary name">{{$watch->name}}</span>
                                <form action="/payments/cf" method="GET">
                                    <input type="hidden" name="watch_id" value="{{$watch->id}}" />
                                    <input type="hidden" name="price" value="{{$watch->price*(1-$watch->discount/100)}}" />
                                    

                                    <table>
                                        <thead>

                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><span id="market-price-label">{{__('label.market-price')}}:</span></td>
                                                <td><span id="market-price"><strike>{{$watch->price*session('cur')->rate . session('cur')->shortcut}}</strike></span></td>
                                            </tr>
                                            <tr>
                                                <td><span id="discount-label">{{__('label.discount')}}:</span></td>
                                                <td><span id="discount">{{$watch->discount}}%</span></td>
                                            </tr>
                                            
                                            <tr>
                                                <td><span id="price-label">{{__('label.price')}}:</span></td>
                                                <td><span id="price">{{number_format(($watch->price*(1-$watch->discount/100))*session('cur')->rate,1) . session('cur')->shortcut}}</span></td>
                                            </tr>
                                            <tr>
                                                <td><span id="quantity-label">{{__('label.quantity')}}</span></td>
                                                <td>
                                                    <input type="number" name="quantity" min="0" value="0" /><br />

                                                </td>

                                            </tr>
                                            <tr>
                                                
                                                <td><span></span></td>
                                                <td>
                                                @error('quantity')
                                                <span style="color:red">{{$message}}</span>
                                                @enderror
                                                <br/>
                                                    <input type="submit" value="{{__('label.btn-buy')}}" class="btn btn-danger">
                                                    </span></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection