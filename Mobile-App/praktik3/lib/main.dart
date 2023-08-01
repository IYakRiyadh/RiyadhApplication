import 'dart:io';

import 'package:flutter/material.dart';
import 'package:prak3/pages/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

late SharedPreferences localData;

TextEditingController namaCtlr = TextEditingController();
TextEditingController emailCtlr = TextEditingController();
TextEditingController sandiCtlr = TextEditingController();

class MyApp extends StatelessWidget {
  static Future init() async {
    localData = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MasukPage(),
    );
  }
}
