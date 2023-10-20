import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kopi_app/komponen/komponenKopi.dart';
import 'package:kopi_app/pages/authSceens/otpPage.dart';

class UserAuthKopi extends GetxController {
  static UserAuthKopi get permanen => Get.find();
  // static String? get verify => verifyId;

  void kopiLogin() async {
    try {
      await authKopi.signInWithEmailAndPassword(
          email: ctrLoginEmail.text, password: ctrLoginSandi.text);
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        await snap('Ada Yang salah!', e.message.toString());
      }
    }
  }

  void buatAkunBaru() async {
    try {
      await authKopi
          .createUserWithEmailAndPassword(
              email: ctrSignUpEmail.text.trim(),
              password: ctrSignUpSandi.text.trim())
          .then((value) async {
        final User user = authKopi.currentUser!;

        await cloud_db.collection('users').doc(value.user!.uid).set({
          'nama': ctrSignUpNama.text,
          'email': ctrSignUpEmail.text,
          'uid': value.user!.uid,
          'fotoProfil': '',
        });
        await db_realtime
            .ref('appKopi/users/${value.user!.uid}/')
            .child('userInfo')
            .set({
          'nama': ctrSignUpNama.text,
          'email': ctrSignUpEmail.text,
          'uid': value.user!.uid,
          'fotoProfil': '',
        });
      });
    } on FirebaseException catch (e) {
      if (e.code != 'weak-password') {
        await snap('Ada yang salah!', e.message.toString());
      } else if (e.code == 'email-already-in-use') {
        await snap('Ada yang salah!', e.message.toString());
      }
    } catch (e) {
      print(e);
    }
  }

  Future<UserCredential> signInWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    final authAkun =
        await authKopi.signInWithCredential(credential).then((val) async {
      Navigator.pushNamed(context, '/');

      await cloud_db.collection('users').doc(val.user!.uid).set({
        'nama': val.user!.displayName,
        'email': val.user!.email,
        'uid': val.user!.uid,
        'fotoProfil': val.user!.photoURL,
      });

      await db_realtime
          .ref('appKopi/users/${val.user!.uid}/')
          .child('userInfo')
          .set({
        'nama': val.user!.displayName,
        'email': val.user!.email,
        'uid': val.user!.uid,
        'fotoProfil': val.user!.photoURL,
      });
    });
    return authAkun;
  }

  void keluar() async {
    await authKopi.signOut();
  }

  snap(String title, String pesan) {
    if (pesan.isNotEmpty || title.isNotEmpty) {
      return Get.snackbar(
        title,
        pesan,
        duration: const Duration(seconds: 30),
      );
    } else {
      return null;
    }
  }

  Stream<void> infoAkun() async* {
    await db_realtime.ref('');
  }

  String generateString(int length) {
    const String str = '0123456789';
    final random = Random();

    return List.generate(length, (index) => str[random.nextInt(str.length)])
        .join();
  }
}




// final str = RegExp(
      //                     r'^@[\w-]+(\.[\w-]+)*(\.[a-z]{2,})$',
      //                   );
// email = ctrLoginEmail.text
//                             .replaceFirstMapped('@gmail.com', (match) => '');