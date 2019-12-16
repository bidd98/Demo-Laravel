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
        return [
            'images-del' => '',
            'category_id' => 'required',
            'name' => 'required',
            'price' => 'required|numeric|max:30',
            'discount' => 'required|numeric',
            'images' => 'required|array|min:2|max:15',
            'images.*' => 'required|mimes:jpeg,jpg,png,gif'
            
        ];
    }

    public function messages(){
        return [
            'name.required' => 'name is required madafaker',
            'images.*.mimes' => 'The image must be a file of: jpeg, jpg, png, gif',
        ];
    }
}
