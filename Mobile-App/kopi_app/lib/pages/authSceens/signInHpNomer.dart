import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kopi_app/komponen/komponenKopi.dart';
import 'package:kopi_app/pages/authSceens/otpPage.dart';
import 'package:kopi_app/service/userAuth.dart';

class MasukDenganNomorHp extends StatefulWidget {
  const MasukDenganNomorHp({super.key});

  @override
  State<MasukDenganNomorHp> createState() => _MasukDenganNomorHpState();
}

class _MasukDenganNomorHpState extends State<MasukDenganNomorHp> {
  final auth = Get.put(UserAuthKopi());

  final formKey = GlobalKey<FormState>();

  set verifyId(String verifyId) {
    setState(() {
      verifyId = verifyId;
    });
  }

  @override
  void initState() {
    super.initState();
    noHp = '62';
  }

  @override
  void dispose() {
    super.dispose();
    ctrSignUpNoHp.isBlank;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  ClipRRect(
                    child: FaIcon(FontAwesomeIcons.solidCircleUser,
                        size: 100.0, color: Colors.lime.shade700),
                  ),
                  const SizedBox(height: 15.0),
                  ClipRRect(
                    child: Text.rich(
                      textAlign: TextAlign.center,
                      textScaleFactor: 1.0,
                      TextSpan(
                        text: 'Selamat datang, di Kopi Plaza!'
                            .capitalize
                            .toString(),
                        children: const [
                          TextSpan(
                            text: '\n',
                            style: TextStyle(
                              fontSize: 1.0,
                            ),
                          ),
                          TextSpan(
                            text: '\nDaftar Sebagai Pembeli!',
                            style: TextStyle(
                                fontSize: 15.0, fontWeight: FontWeight.w500),
                          ),
                        ],
                        spellOut: true,
                        style: const TextStyle(
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
                      controller: ctrSignUpNoHp,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        labelText: 'Ketik Nomer HP Anda..',
                        labelStyle: TextStyle(color: Colors.lime.shade800),
                        prefixText: '${noHp!}',
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
                  SizedBox(height: 20.0),
                  SizedBox(
                    height: 40,
                    child: MaterialButton(
                      color: Colors.limeAccent,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: 2.0, color: Colors.lime.shade800),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: const Text('Verify'),
                      onPressed: () {
                        setState(() {
                          // codeVerifikasi = auth.generateString(4);
                          valNoHP = '+$noHp' + '${ctrSignUpNoHp.text.trim()}';
                        });
                        if (formKey.currentState!.validate()) {
                          verifyHpNumber(valNoHP!);
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> verifyHpNumber(String nomerHp) async {
    try {
      // var code = generateString(4);

      await authKopi.verifyPhoneNumber(
        phoneNumber: nomerHp,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await PhoneAuthProvider.credential(
              verificationId: credential.verificationId!,
              smsCode: credential.smsCode!);
          if (credential.smsCode != null) {
            try {
              await authKopi.signInWithCredential(credential).whenComplete(() {
                // Navigator.pop(context);
                Navigator.pushNamed(context, '/');
                setState(() {
                  codeVerifikasi = credential.verificationId;
                  pinController.text = credential.smsCode!;
                });
              });
            } on FirebaseAuthException catch (e) {
              if (e.code == 'provider-already-linked') {
                await authKopi.signInWithCredential(credential);
              }
            }
          }
        },
        verificationFailed: (error) {
          if (error.code == 'invalid-phone-number') {
            UserAuthKopi.permanen
                .snap('error', 'The provided phone number is not valid.');
          }
        },
        codeSent: (verificationId, forceResendingToken) async {
          this.verifyId = verificationId;
          // try {
          // Navigator.pushNamed(context, 'otp');

          // } on FirebaseAuthException catch (e) {
          //   print(e.message);
          // }
        },
        timeout: const Duration(seconds: 60),
        codeAutoRetrievalTimeout: (verificationId) {
          if (verificationId == 'invalid-phone-number') {
            auth.snap('Pesan Invalid', "The phone number entered is invalid!");
          }
        },
      );
    } on FirebaseException catch (e) {
      if (e.code == 'invalid-phone-number') {
        await UserAuthKopi.permanen
            .snap('error', 'The provided phone number is not valid.');
      }
    }
  }
}
