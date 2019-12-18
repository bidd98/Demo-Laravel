<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class CategoryStoreRequest extends FormRequest
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
            'brand' => 'required|string|max:255'
        ];
    }

    public function messages()
    {
        if (app()->getLocale() == 'vn') {
            return [
                'brand.required' => 'Mục thương hiệu không được để  trống',
                'brand.max' => 'Thương hiệu không được dài quá :max ký tự',
            ];
        }
        return [];
    }
}
