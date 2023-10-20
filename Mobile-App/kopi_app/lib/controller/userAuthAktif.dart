import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kopi_app/controller/navigasi.dart';
import 'package:kopi_app/komponen/komponenKopi.dart';
import 'package:kopi_app/pages/screens/intro.dart';

class UserKopiAuthAktif extends StatefulWidget {
  const UserKopiAuthAktif({super.key});

  @override
  State<UserKopiAuthAktif> createState() => _UserKopiAuthAktifState();
}

class _UserKopiAuthAktifState extends State<UserKopiAuthAktif> {
  // final auth = Get.put(UserAuthKopi());
  User? user;

  @override
  void initState() {
    super.initState();
    user = authKopi.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: authKopi.authStateChanges(),
      initialData: user,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const NavigasiBottom();
        } else {
          return const IntroPage();
        }
      },
    );
  }

  // Stream<User> authStateChanges() async* {
  //   if (authKopi.checkActionCode(codeVerifikasi!).obs == codeVerifikasi) {
  //     await authKopi.authStateChanges();
  //   }
  // }
}
