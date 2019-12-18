<?php

namespace App\Http\Controllers;

use App\Currency;
use App\Http\Requests\OrderStoreRequest;
use Carbon\Carbon;
use App\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Config;

class PaymentController extends Controller
{
    // This method is to create an processing order
    public function confirm(OrderStoreRequest $request)
    {
        

        // Get validated data
        $data = $request->validated();

        // Get parameters
        // Get quantity of item
        $quantity = $data['quantity'];

        // Get item id
        $watchId = $data['watch_id'];

        // Get item price
        $total = $data['price'] * $quantity;

        // Get current user
        $user = auth()->user();

        // Create new order
        $order = $user->orders()->create([
            'id' => date('YmdHis'),
            'user_id' => $user->id,
            'order_status' => 'processing',
            'order_date' => Carbon::now()->toDateTimeString(),
        ]);

        // Temporary fix
        $order->id = date('YmdHis');
        $order->save();

        // Attach Watch items to pivot table
        $order->watches()->attach($watchId, array('quantity' => $quantity));

        if (session('cur')->symbol == 'USD'){
            $total = $total * Currency::where('symbol','VND')->get()[0]->rate;
        }
        
        $id = $order->id;

        return view('payments.confirm', compact('total', 'id'));
    }

    public function create()
    {
        $vnp_TmnCode = Config('app.vnp_tmnCode'); //Mã website tại VNPAY 
        $vnp_HashSecret = Config('app.vnp_hashSecret'); //Chuỗi bí mật
        $vnp_Url = Config('app.vnp_url');
        $vnp_Returnurl = Config('app.vnp_returnUrl');


        $vnp_TxnRef = $_POST['order_id']; //Mã đơn hàng. Trong thực tế Merchant cần insert đơn hàng vào DB và gửi mã này sang VNPAY
        $vnp_OrderInfo = $_POST['order_desc'];
        $vnp_OrderType = $_POST['order_type'];
        $vnp_Amount = $_POST['amount'] * 100;
        $vnp_Locale = $_POST['language'];
        $vnp_BankCode = $_POST['bank_code'];
        $vnp_IpAddr = $_SERVER['REMOTE_ADDR'];


        $inputData = array(
            "vnp_Version" => "2.0.0",
            "vnp_TmnCode" => $vnp_TmnCode,
            "vnp_Amount" => $vnp_Amount,
            "vnp_Command" => "pay",
            "vnp_CreateDate" => date('YmdHis'),
            "vnp_CurrCode" => "VND",
            "vnp_IpAddr" => $vnp_IpAddr,
            "vnp_Locale" => $vnp_Locale,
            "vnp_OrderInfo" => $vnp_OrderInfo,
            "vnp_OrderType" => $vnp_OrderType,
            "vnp_ReturnUrl" => $vnp_Returnurl,
            "vnp_TxnRef" => $vnp_TxnRef,
        );

        if (isset($vnp_BankCode) && $vnp_BankCode != "") {
            $inputData['vnp_BankCode'] = $vnp_BankCode;
        }
        ksort($inputData);
        $query = "";
        $i = 0;
        $hashdata = "";
        foreach ($inputData as $key => $value) {
            if ($i == 1) {
                $hashdata .= '&' . $key . "=" . $value;
            } else {
                $hashdata .= $key . "=" . $value;
                $i = 1;
            }
            $query .= urlencode($key) . "=" . urlencode($value) . '&';
        }

        $vnp_Url = $vnp_Url . "?" . $query;
        if (isset($vnp_HashSecret)) {
            // $vnpSecureHash = md5($vnp_HashSecret . $hashdata);
            $vnpSecureHash = hash('sha256', $vnp_HashSecret . $hashdata);
            $vnp_Url .= 'vnp_SecureHashType=SHA256&vnp_SecureHash=' . $vnpSecureHash;
        }

        // dd($inputData);
        return redirect($vnp_Url);
    }

    public function return()
    {
        $message = '';
        $vnp_TmnCode = Config('app.vnp_tmnCode'); //Mã website tại VNPAY 
        $vnp_HashSecret = Config('app.vnp_hashSecret'); //Chuỗi bí mật
        $vnp_Url = Config('app.vnp_url');
        $vnp_Returnurl = Config('vnp_returnUrl');

        $vnp_SecureHash = $_GET['vnp_SecureHash'];
        $inputData = array();
        foreach ($_GET as $key => $value) {
            if (substr($key, 0, 4) == "vnp_") {
                $inputData[$key] = $value;
            }
        }
        unset($inputData['vnp_SecureHashType']);
        unset($inputData['vnp_SecureHash']);
        ksort($inputData);
        $i = 0;
        $hashData = "";
        foreach ($inputData as $key => $value) {
            if ($i == 1) {
                $hashData = $hashData . '&' . $key . "=" . $value;
            } else {
                $hashData = $hashData . $key . "=" . $value;
                $i = 1;
            }
        }

        //$secureHash = md5($vnp_HashSecret . $hashData);
        $secureHash = hash('sha256', $vnp_HashSecret . $hashData);

        

        if ($secureHash == $vnp_SecureHash) {

            if ($inputData['vnp_ResponseCode'] == '00') {
                $message = "Successful Transaction";
                $status = 'success';
               
            } else {
                $message = "Unsuccessful transaction";
                $status = 'rejected';
            }
        } else {
            $message = 'Uncorrect signature!';
            $status = 'rejected';
        }


        // Get the id of order
        $id = $inputData['vnp_TxnRef'];

         // Update status for this order
         Order::find($id)->update([
            'order_status' => $status,
        ]);




        return view('payments.return', compact('message'));
    }
}
