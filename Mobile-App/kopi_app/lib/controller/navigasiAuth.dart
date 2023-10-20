import 'package:flutter/material.dart';
import 'package:kopi_app/pages/authSceens/login.dart';
import 'package:kopi_app/pages/authSceens/getStarted.dart';
import 'package:kopi_app/pages/authSceens/signUpForm.dart';

class MasukOrDaftar extends StatefulWidget {
  const MasukOrDaftar({super.key});

  @override
  State<MasukOrDaftar> createState() => _MasukOrDaftarState();
}

class _MasukOrDaftarState extends State<MasukOrDaftar> {
  bool iniHalamanMasuk = true;

  void toggleHalaman() {
    setState(() {
      iniHalamanMasuk = !iniHalamanMasuk;
    });
  }

  @override
  void initState() {
    super.initState();
    toggleHalaman();
  }

  @override
  Widget build(BuildContext context) {
    if (iniHalamanMasuk) {
      return LoginPage(
        onClik: toggleHalaman,
      );
    } else {
      return SignUpPage(
        onClik: toggleHalaman,
      );
    }
  }
}
