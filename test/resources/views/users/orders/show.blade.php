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
                                <img src="/storage/{{$watch->image}}" style="max-width: 100%">
                            </div>
                            <div class="col-6">
                                <span class="heading-primary brand">{{__('label.order')}}: {{$order->id}}</span>
                                <span class="heading-subprimary name">{{__('label.date')}}: {{$order->order_date}}</span>


                                <table>
                                    <thead>

                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td><span id="quantity-label">{{__('label.quantity')}}:</span></td>
                                            <td><span id="quantity">{{$watch->pivot->quantity}}</span></td>
                                        </tr>
                                        <tr>
                                            <td><span id="total-label">{{__('label.order-total')}}:</span></td>
                                            <td><span id="total">{{number_format($total*session('cur')->rate,1) . session('cur')->shortcut}}</span></td>
                                        </tr>
                                        <!-- <tr>
                                            <td><span></span></td>
                                            <td>
                                                <input type="submit" value="Buy" class="btn btn-danger">
                                                </span></td>
                                        </tr> -->
                                    </tbody>
                                </table>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection