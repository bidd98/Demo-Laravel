@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-12">
            <div class="card">
                <div class="card-header">{{__('label.vnpay')}}</div>

                <div class="card-body">
                    @if (session('status'))
                    <div class="alert alert-success" role="alert">
                        {{ session('status') }}
                    </div>
                    @endif

                    <div class="container">
                        <div class="header clearfix">
                            <h3 class="text-muted">{{__('label.payment')}}</h3>
                        </div>
                        
                        <div class="table-responsive">
                            <form action="/payments/create" id="create_form" method="post">
                            @csrf

                                <div class="form-group">
                                    <label for="language">{{__('label.bill-type')}}</label>
                                    <select name="order_type" id="order_type" class="form-control">
                                        <!-- <option value="topup">Nạp tiền điện thoại</option> -->
                                        <option value="billpayment">{{__('label.bank-transfer')}}</option>
                                        <!-- <option value="fashion">Thời trang</option>
                                        <option value="other">Khác - Xem thêm tại VNPAY</option> -->
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="order_id">{{__('label.order-id')}}</label>
                                    <input class="form-control" id="order_id" name="order_id" type="text" value="{{$id}}" />
                                </div>
                                <div class="form-group">
                                    <label for="amount">{{__('label.money-bill')}}</label>
                                    <input class="form-control" type="text" value="{{number_format($total,1)}}đ" disabled/>
                                    <input class="form-control" id="amount" name="amount" type="hidden" value="{{$total}}"/>
                                </div>
                                <div class="form-group">
                                    <label for="order_desc">{{__('label.description')}}</label>
                                    <textarea class="form-control" cols="20" id="order_desc" name="order_desc" rows="2">{{__('label.description')}}</textarea>
                                </div>
                                <div class="form-group">
                                    <label for="bank_code">{{__('label.bank')}}</label>
                                    <select name="bank_code" id="bank_code" class="form-control">
                                        <!-- <option value="">Không chọn</option> -->
                                        <option value="NCB" selected>{{__('label.NCB')}}</option>
                                        <!-- <option value="AGRIBANK"> Ngan hang Agribank</option>
                                        <option value="SCB"> Ngan hang SCB</option>
                                        <option value="SACOMBANK">Ngan hang SacomBank</option>
                                        <option value="EXIMBANK"> Ngan hang EximBank</option>
                                        <option value="MSBANK"> Ngan hang MSBANK</option>
                                        <option value="NAMABANK"> Ngan hang NamABank</option>
                                        <option value="VNMART"> Vi dien tu VnMart</option>
                                        <option value="VIETINBANK">Ngan hang Vietinbank</option>
                                        <option value="VIETCOMBANK"> Ngan hang VCB</option>
                                        <option value="HDBANK">Ngan hang HDBank</option>
                                        <option value="DONGABANK"> Ngan hang Dong A</option>
                                        <option value="TPBANK"> Ngân hàng TPBank</option>
                                        <option value="OJB"> Ngân hàng OceanBank</option>
                                        <option value="BIDV"> Ngân hàng BIDV</option>
                                        <option value="TECHCOMBANK"> Ngân hàng Techcombank</option>
                                        <option value="VPBANK"> Ngan hang VPBank</option>
                                        <option value="MBBANK"> Ngan hang MBBank</option>
                                        <option value="ACB"> Ngan hang ACB</option>
                                        <option value="OCB"> Ngan hang OCB</option>
                                        <option value="IVB"> Ngan hang IVB</option>
                                        <option value="VISA"> Thanh toan qua VISA/MASTER</option> -->
                                    </select>
                                </div>
                                <!-- <div class="form-group">
                                    <label for="language">Language</label>
                                    <select name="language" id="language" class="form-control">
                                        <option value="vn">Vietnamese</option>
                                        <option value="en">English</option>
                                    </select>
                                </div> -->
                                <input type="hidden" name="language" value="vn"/>

                                <!-- <button type="submit" class="btn btn-primary" id="btnPopup">Thanh toán Popup</button> -->
                                <button type="submit" class="btn btn-primary">{{__('label.btn-pay')}}</button>

                            </form>
                        </div>
                        <p>
                            &nbsp;
                        </p>
                        <footer class="footer">
                            <p>&copy; VNPAY 2015</p>
                        </footer>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
@endsection