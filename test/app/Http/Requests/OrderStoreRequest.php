<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class OrderStoreRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'quantity' => 'required|min:1|integer',
            'price' => '',
            'watch_id' => '',
        ];
    }

    public function messages()
    {
        if (app()->getLocale() == 'vn') {
            return [
                'quantity.required' => 'Số lượng không được để trống.',
                'quantity.min' => 'Số lượng bé nhất bằng :min',
                'quantity.integer' => 'Số lượng phải là một số tự nhiên',
            ];
        }
        return [
            'quantity.min' => 'Quantity must be larger than 0',
        ];
    }
}
