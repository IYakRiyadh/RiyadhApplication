<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\FirebaseController;
use App\Http\Controllers\UserController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', [UserController::class, 'home']);

Route::get('/masuk', [UserController::class, 'signIn']);
Route::get('/daftar', [UserController::class, 'signUp']);

Route::post('/daftarkan', [FirebaseController::class, 'daftarkan']);
