<?php

namespace App\Exports;

use App\Order;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\WithHeadings;


class OrdersExport implements FromCollection, WithHeadings
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {

        $orders = Order::all();
        $export = [];
        foreach ($orders as $order) {
            $watch = $order->watches[0];
            array_push($export, [
                __('label.order-id') => $order->id,
                __('label.order-status') => __('label.'.$order->order_status),
                __('label.order-date') => $order->order_date,
                __('label.order-total') => number_format(($watch->price * $watch->pivot->quantity
                    * (1 - $watch->discount / 100)
                    * session('cur')->rate),1)
                    . session('cur')->shortcut,
            ]);
        }
        return collect($export);
    }

    public function headings(): array
    {
        return [
            __('label.order-id'),
            __('label.order-status'),
            __('label.order-date'),
            __('label.order-total'),
        ];
    }
}
