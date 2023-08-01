<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class UserController extends Controller
{
    public static function home()
    {
        return view('main.index');
    }

    public static function signIn()
    {
        return view('login');
    }

    public static function signUp()
    {
        return view('register');
    }
}
