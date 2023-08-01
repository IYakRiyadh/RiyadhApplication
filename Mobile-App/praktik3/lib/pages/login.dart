import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:prak3/main.dart';
import 'package:prak3/navigasi.dart';
import 'package:prak3/pages/register.dart';

class MasukPage extends StatefulWidget {
  const MasukPage({super.key});

  @override
  State<MasukPage> createState() => _MasukPageState();
}

class _MasukPageState extends State<MasukPage> {
  // bool checking = false;
  // final _namaCtlr = TextEditingController();
  // final _emailCtlr = TextEditingController();
  // final _sandiCtlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var ukuran = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('/images/bgLogin.jpg'),
            fit: BoxFit.fill,
            repeat: ImageRepeat.repeat,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Container(
                width: 380,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    Container(
                      height: 40,
                      padding: const EdgeInsets.only(top: 12),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: namaCtlr,
                        decoration: InputDecoration(
                          hintText: 'Nama Pengguna',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 40,
                      padding: const EdgeInsets.only(top: 12),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: emailCtlr,
                        decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      height: 40,
                      padding: const EdgeInsets.only(top: 10),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: sandiCtlr,
                        obscuringCharacter: '•',
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 35),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green[800]),
                              child: const Text('Masuk'),
                              onPressed: () {
                                simpanData();
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(right: 35),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blue[300]),
                              child: const Text('Daftar'),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  simpanData() async {
    await MyApp.init();
    localData.setString('nama', namaCtlr.text.toString());
    localData.setString('email', emailCtlr.text.toString());
    localData.setString('sandi', sandiCtlr.text.toString());

    // String? namaPengguna = localStorage?.getString("namaPengguna");
    // String? email = localStorage?.getString("email");
    // String? kataSandi = localStorage?.getString("kataSandi");

    if (namaCtlr.text == '' && emailCtlr.text == '' && sandiCtlr.text == '') {
      return msgErr();
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomBarNavigasi(),
        ),
      );
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).removeCurrentSnackBar();
    }
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> msgErr() =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.teal[200],
          shape: Border.all(width: 1, color: Colors.red),
          content: Container(
            padding: const EdgeInsets.all(6.0),
            child: Text('Tidak bisa masuk, harap di isi',
                style: TextStyle(color: Colors.red[700])),
          ),
          duration: const Duration(seconds: 5),
        ),
      );
}
