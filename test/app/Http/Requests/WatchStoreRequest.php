<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class WatchStoreRequest extends FormRequest
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
        $actionName = class_basename($this->route()->getActionName());
        $imageRule = ($actionName == 'WatchController@store') ? 'required|array|min:2|max:5' : 'max:5';
        $imagesTypeRule = ($actionName == 'WatchController@store') ? 'required|mimes:jpeg,jpg,png,gif' : 'nullable|mimes:jpeg,jpg,png,gif';

        return [
            'images-del' => '',
            'category_id' => 'required',
            'name' => 'required',
            'price' => 'required|numeric|max:30',
            'discount' => 'required|numeric|max:100',
            'images' => $imageRule,
            'images.*' => $imagesTypeRule,

        ];
    }

    public function messages()
    {
        if (app()->getLocale() == 'vn') {
            return [
                'name.required' => 'Tên không được để trống',
                'price.required' => 'Giá tiền không được để trống',
                'price.numeric' => 'Đơn vị giá tiền không hợp lệ',
                'price.max' => 'Giá tiền không được lớn hơn :max',
                'discount.required' => 'Mục giảm giá không được để trống',
                'discount.max' => 'Mục giảm giá không được quá :max%',
                'images.required' => 'Ảnh không được để trống',
                'images.min' => 'Tải lên ít nhất :min ảnh',
                'images.max' => 'Tải lên tối đa :max ảnh',
                'images.*.mimes' => 'Ảnh phải có định dạng: jpeg, jpg, png hoặc gif',
            ];
        }
        return [
            'discount.max' => 'Discount may not be greater than :max%',
            // 'name.required' => 'name is required madafaker',
            'images.*.mimes' => 'The image must be a file of: jpeg, jpg, png, gif',
        ];
    }
}
