import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

// NoSQL
final cloud_db = FirebaseFirestore.instance;
final db_realtime = FirebaseDatabase.instance;
final authKopi = FirebaseAuth.instance;

Map? dataIntro;

double valProgrees = 5.0;

var docsList;

List<String> img = [
  'assets/img/gif/gif2.png',
  'assets/img/gif/gif3.png',
  'assets/img/gif/gif4.png',
];

List<String> judul = [
  'Pesan Kopi ditempat favorit',
  'Nikmati kopi anda dengan orang terdakat',
  'bayar lansung menlalui aplikasi',
];

final TextEditingController ctrLoginEmail = TextEditingController();
final TextEditingController ctrLoginSandi = TextEditingController();
final TextEditingController ctrSignUpNama = TextEditingController();
final TextEditingController ctrSignUpNoHp = TextEditingController();
final TextEditingController ctrSignUpEmail = TextEditingController();
final TextEditingController ctrSignUpSandi = TextEditingController();

final TextEditingController pinController = TextEditingController();

bool? displaySandiLogin;
bool? displaySandiSignUp;

String? noHp;
String? valNoHP;
String? codeVerifikasi;
String? verifyId;
