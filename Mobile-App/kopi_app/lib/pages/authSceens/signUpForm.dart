import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kopi_app/controller/userAuthAktif.dart';
import 'package:kopi_app/komponen/komponenKopi.dart';
import 'package:kopi_app/komponen/widgetKopi.dart';
import 'package:kopi_app/service/userAuth.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({required this.onClik, super.key});

  final Function()? onClik;

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final auth = Get.put(UserAuthKopi());
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    displaySandiSignUp = true;
  }

  @override
  void dispose() {
    ctrSignUpNama.isBlank;
    ctrSignUpNoHp.isBlank;
    ctrSignUpEmail.isBlank;
    ctrSignUpSandi.isBlank;
    super.dispose();
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
              padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
              child: Form(
                key: formKey,
                child: Column(
                  // scrollDirection: Axis.vertical,
                  // clipBehavior: Clip.antiAliasWithSaveLayer,
                  children: [
                    const SizedBox(height: 15.0),
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
                          text: 'Anda Belum Punya Akun!',
                          children: [
                            TextSpan(
                              text: '\n',
                              style: TextStyle(
                                fontSize: 1.0,
                              ),
                            ),
                            TextSpan(
                              text: '\nSilahkan Daftar!',
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
                        controller: ctrSignUpNama,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          labelText: 'UserName',
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
                        controller: ctrSignUpEmail,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        autovalidateMode: AutovalidateMode.always,
                        decoration: InputDecoration(
                          labelText: 'Alamat Email',
                          labelStyle: TextStyle(color: Colors.lime.shade800),
                          contentPadding:
                              const EdgeInsets.fromLTRB(12, 10, 12, 10),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.lime.shade800, width: 2.0),
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
                    const SizedBox(height: 20.0),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: ctrSignUpSandi,
                        obscureText: displaySandiSignUp!,
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
                                displaySandiSignUp!
                                    ? FontAwesomeIcons.solidEyeSlash
                                    : FontAwesomeIcons.solidEye,
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
                        child: const Text('Daftar'),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            auth.buatAkunBaru();
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 25.0),
                    SizedBox(
                      width: size.width,
                      child: Text.rich(
                        TextSpan(
                          text: 'Sudah punya Akun, Silahkan ',
                          children: [
                            TextSpan(
                              text: ' Masuk..!',
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
      displaySandiSignUp = !(displaySandiSignUp!);
    });
  }
}
