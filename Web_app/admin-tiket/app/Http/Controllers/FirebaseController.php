<?php

namespace App\Http\Controllers;

use App\Models\FirebaseAdmin;
use Illuminate\Http\Request;
use Kreait\Firebase\Exception\Auth\FailedToVerifyToken;
use Kreait\Laravel\Firebase\Facades\Firebase;
use Kreait\Firebase\Auth;
use Kreait\Firebase\Factory;

class FirebaseController extends Controller
{
    protected $auth;

    public function __construct(Auth $auth)
    {
        $this->auth = $auth;
    }

    public function daftarkan(Request $req, Auth $firebaseAuth)
    {
        $email = $req->input('email');
        $password = $req->input('password');

        $user = $firebaseAuth->createUserWithEmailAndPassword($email, $password);


        // $user = $this->auth->createUser([
        //     'email' => $req->input('email'),
        //     'password' => $req->input('password'),
        // ]);


        // return response()->json($user);
        return redirect('/login');

    }

    public function login()
    {
        // Get user login data (e.g., email and password)
        $email = 'user@example.com';
        $password = 'user_password';

        $signInResult = $this->auth->signInWithEmailAndPassword($email, $password);

        // $result = response()->json($signInResult);
        return redirect('/')->response()->json($signInResult);
    }


    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        // ...
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(FirebaseAdmin $firebaseAdmin)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(FirebaseAdmin $firebaseAdmin)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, FirebaseAdmin $firebaseAdmin)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(FirebaseAdmin $firebaseAdmin)
    {
        //
    }
}
