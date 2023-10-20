import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
// import 'package:kopi_app/controller/navigasi.dart';
import 'package:kopi_app/komponen/komponenKopi.dart';
import 'package:kopi_app/komponen/widgetKopi.dart';
import 'package:kopi_app/service/userAuth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({required this.onClik, super.key});

  final Function()? onClik;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final auth = Get.put(UserAuthKopi());

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    ctrLoginEmail.isBlank;
    ctrLoginSandi.isBlank;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    displaySandiLogin = true;
    lihatSandi();
    // snack();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: ClipRRect(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  // clipBehavior: Clip.antiAliasWithSaveLayer,
                  // shrinkWrap: true,
                  children: [
                    const SizedBox(height: 20.0),
                    Center(
                      child: ClipRRect(
                        child: FaIcon(FontAwesomeIcons.solidCircleUser,
                            size: 100.0, color: Colors.lime.shade700),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    const ClipRRect(
                      child: Text.rich(
                        textAlign: TextAlign.center,
                        textScaleFactor: 1.0,
                        TextSpan(
                          text: 'Anda Bisa Masuk Sekarang!',
                          children: [
                            TextSpan(
                              text: '\n',
                              style: TextStyle(
                                fontSize: 1.0,
                              ),
                            ),
                            TextSpan(
                              text: '\nSilahkan Masuk!',
                              style: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w500),
                            ),
                          ],
                          spellOut: true,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: ctrLoginEmail,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.lime.shade800),
                          contentPadding:
                              const EdgeInsets.fromLTRB(12, 10, 12, 10),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.lime.shade800, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.lime.shade600, width: 2.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: ctrLoginSandi,
                        obscureText: !displaySandiLogin!,
                        keyboardType: TextInputType.text,
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(color: Colors.lime.shade800),
                          contentPadding:
                              const EdgeInsets.fromLTRB(12, 10, 12, 10),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.fromLTRB(
                                12.0, 12.0, 12.0, 12.0),
                            child: GestureDetector(
                              child: FaIcon(
                                displaySandiLogin!
                                    ? FontAwesomeIcons.solidEye
                                    : FontAwesomeIcons.solidEyeSlash,
                                color: Colors.lime.shade600,
                              ),
                              onTap: () => lihatSandi(),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.lime.shade800, width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.lime.shade600, width: 2.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15.0),
                    SizedBox(
                      height: 40,
                      child: MaterialButton(
                        color: Colors.limeAccent,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 2.0, color: Colors.lime.shade800),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: const Text('Masuk'),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            auth.kopiLogin();
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 35.0),
                    SizedBox(
                      width: size.width,
                      child: Text.rich(
                        TextSpan(
                          text: 'Belum punya Akun, Silahkan ',
                          children: [
                            TextSpan(
                              text: ' Daftar..!',
                              style: TextStyle(
                                color: Colors.lime.shade800,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = widget.onClik,
                            ),
                          ],
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const DividerKopi(),
                    const SizedBox(height: 25.0),
                    SizedBox(
                      height: 40,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50.0, right: 50.0),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                  width: 2.0, color: Colors.lime.shade800),
                              borderRadius: BorderRadius.circular(10.0)),
                          child: const BtnGoogle(),
                          onPressed: () => auth.signInWithGoogle(context),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void lihatSandi() {
    setState(() {
      displaySandiLogin = !(displaySandiLogin!);
    });
  }

  // snack() {
  //   final barInfo = SnackBar(
  //     content: Container(
  //       child: Text('Email atau password anda Salah!'),
  //     ),
  //     backgroundColor: Colors.limeAccent,
  //   );
  //   return ScaffoldMessenger.maybeOf(context)!.showSnackBar(barInfo);
  // }
}
