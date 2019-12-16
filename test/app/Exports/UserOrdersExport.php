<?php

namespace App\Exports;

use App\User;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\WithHeadings;

class UserOrdersExport implements FromCollection, WithHeadings
{
    /**
     * @return \Illuminate\Support\Collection
     */
    public function collection()
    {
        $orders = auth()->user()->orders;

        $export = [];
        foreach ($orders as $order) {
            $watch = $order->watches[0];
            array_push($export, [
                'ID' => $order->id,
                'Order_Status' => $order->order_status,
                'Order_Date' => $order->order_date,
                'Total' => number_format(($watch->price * $watch->pivot->quantity
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
            'ID',
            'Order_Status',
            'Order_Date',
            'Total',
        ];
    }
}
