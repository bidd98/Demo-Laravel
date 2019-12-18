<?php

namespace App\Http\Controllers;

use App\Watch;
use Illuminate\Http\Request;

class LanguageController extends Controller
{
    //
    public function update($lang)
    {

        if (in_array($lang, ['en', 'vn'])) {
            session(['locale' => $lang]);
        }

        app()->setLocale(session('locale'));
        session(['canOrder' => false]);

        return redirect()->back();
    }
}
