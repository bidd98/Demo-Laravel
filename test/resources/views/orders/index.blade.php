@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">{{__('label.orders-manage')}}</div>

                <div class="card-body">
                    @if (session('status'))
                    <div class="alert alert-success" role="alert">
                        {{ session('status') }}
                    </div>
                    @endif
                    
                    @if(!$orders->isEmpty())
                    <a href="/orders/export" class="btn btn-primary">{{__('label.btn-export')}}</a>
                    <table class="table table-striped mt-2">
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">{{__('label.order-status')}}</th>
                                <th scope="col">{{__('label.order-date')}}</th>
                                <th scope="col">{{__('label.order-total')}}</th>
                                <th scope="col">{{__('label.order-detail')}}</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            @foreach($orders as $order)
                            <tr>
                                <th scope="row">{{$order->id}}</th>
                                <td>
                                    @if(($order->order_status == 'success'))
                                    <span class="badge badge-success" style="font-size: 15px; display:inline-block; padding: 10px 35px; width: 155px">{{__('label.success')}}</span>
                                    
                                    @elseif(($order->order_status == 'rejected'))
                                    <span class="badge badge-danger" style="font-size: 15px; display:inline-block; padding: 10px 35px; width: 155px">{{__('label.rejected')}}</span>
                                    @else
                                    <a class="btn btn-dark" href="/user/order/finish/{{$order->id}}"><span style="font-size: 15px; width: 155px">{{__('label.processing')}}</span></a>
                                    @endif
                                </td>
                                <td>{{$order->order_date}}</td>
                                <td>{{number_format($order->watches[0]->price * (1 - $order->watches[0]->discount/100) * $order->watches[0]->pivot->quantity * session('cur')->rate, 1) . session('cur')->shortcut}}</td>
                                <td><a class="btn btn-primary" href="/user/order/{{$order->id}}">{{__('label.btn-detail')}}</a></td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                    {{$orders->links()}}

                    <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    ...
                                </div>
                                <div class="modal-body">
                                    ...
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                                    <form action="/watches/{{$order->id}}" method="POST">
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