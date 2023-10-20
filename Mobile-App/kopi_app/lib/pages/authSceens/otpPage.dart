import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopi_app/komponen/komponenKopi.dart';
import 'package:kopi_app/service/userAuth.dart';
import 'package:pinput/pinput.dart';

class PageOtpCode extends StatefulWidget {
  const PageOtpCode({super.key});

  @override
  State<PageOtpCode> createState() => _PageOtpCodeState();
}

class _PageOtpCodeState extends State<PageOtpCode> {
  final authVerify = Get.put(UserAuthKopi());

  final focusNode = FocusNode();
  static final formKey = GlobalKey<FormState>();
  String otpCode = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // pinController.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focusedBorderColor = Colors.lime.shade900;
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    final borderColor = Colors.lime.shade600;

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              // direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  child: Container(
                    height: 200,
                    // color: Colors.blue,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: const Text.rich(
                      textAlign: TextAlign.center,
                      TextSpan(
                        text: 'Masukkan Kode OTP\n',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w800,
                        ),
                        children: [
                          TextSpan(
                            text:
                                '\nKode OTP  yang telah masuk ke nomer anda yang didaftarkan',
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ClipRRect(
                  child: SizedBox(
                    height: 120.0,
                    child: Card(
                      color: Colors.limeAccent[100],
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 20.0, right: 20),
                        child: Column(
                          // direction: Axis.vertical,
                          children: [
                            Align(
                              alignment: AlignmentDirectional.center,
                              child: Form(
                                key: formKey,
                                child: Pinput(
                                  controller: pinController,
                                  focusNode: focusNode,
                                  androidSmsAutofillMethod:
                                      AndroidSmsAutofillMethod
                                          .smsUserConsentApi,
                                  listenForMultipleSmsOnAndroid: true,
                                  defaultPinTheme: defaultPinTheme,
                                  separatorBuilder: (index) =>
                                      const SizedBox(width: 8),
                                  validator: (value) {
                                    if (value == otpCode) {
                                      return null;
                                    } else {
                                      return 'Pin is incorrect';
                                    }
                                  },
                                  onClipboardFound: (value) {
                                    debugPrint('onClipboardFound: $value');
                                    pinController.setText(value);
                                    ClipboardStatusNotifier(
                                        value: ClipboardStatus.pasteable);
                                  },
                                  hapticFeedbackType:
                                      HapticFeedbackType.lightImpact,
                                  onCompleted: (pin) {
                                    debugPrint('onCompleted: $pin');
                                  },
                                  onChanged: (value) {
                                    debugPrint('onChanged: $value');
                                  },
                                  cursor: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 9),
                                        width: 22,
                                        height: 1,
                                        color: focusedBorderColor,
                                      ),
                                    ],
                                  ),
                                  focusedPinTheme: defaultPinTheme.copyWith(
                                    decoration:
                                        defaultPinTheme.decoration!.copyWith(
                                      borderRadius: BorderRadius.circular(8),
                                      border:
                                          Border.all(color: focusedBorderColor),
                                    ),
                                  ),
                                  submittedPinTheme: defaultPinTheme.copyWith(
                                    decoration:
                                        defaultPinTheme.decoration!.copyWith(
                                      color: fillColor,
                                      borderRadius: BorderRadius.circular(19),
                                      border:
                                          Border.all(color: focusedBorderColor),
                                    ),
                                  ),
                                  errorPinTheme: defaultPinTheme.copyBorderWith(
                                    border: Border.all(color: Colors.redAccent),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                ClipRRect(
                  child: MaterialButton(
                    color: Colors.lime,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 2.0, color: Colors.lime.shade900),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Komfirmasi',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.lime.shade800),
                    ),
                    onPressed: () {
                      // focusNode.unfocus();
                      if (formKey.currentState!.validate()) {
                        PhoneAuthCredential phoneAuth =
                            PhoneAuthProvider.credential(
                                verificationId: verifyId!,
                                smsCode: '$codeVerifikasi');
                        authKopi
                            .signInWithCredential(phoneAuth)
                            .whenComplete(() {
                          Navigator.pushNamed(context, '/');
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
