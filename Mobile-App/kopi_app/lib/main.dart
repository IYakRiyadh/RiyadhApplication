import 'dart:convert';

import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kopi_app/controller/navigasi.dart';
import 'package:kopi_app/controller/userAuthAktif.dart';
import 'package:kopi_app/pages/authSceens/otpPage.dart';
import 'package:kopi_app/pages/screens/intro.dart';
import 'package:http/http.dart' as http;

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await FirebaseAppCheck.instance.activate(
    webProvider:
        ReCaptchaV3Provider('6LdOGJwoAAAAAHC9OlUg-d0V8qZksfPm5igiVhRk'),
    //  Set androidProvider to `AndroidProvider.debug`
    androidProvider: AndroidProvider.debug,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kopi-kun',
      routes: {
        '/': (context) => const UserKopiAuthAktif(),
        'otp': (context) => const PageOtpCode(),
      },
      // home: UserKopiAuthAktif(),
      // home: NavigasiBottom(),
      debugShowCheckedModeBanner: false,
    );
  }
}
