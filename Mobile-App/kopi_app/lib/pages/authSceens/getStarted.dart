import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kopi_app/controller/navigasi.dart';
import 'package:kopi_app/controller/navigasiAuth.dart';
import 'package:kopi_app/controller/userAuthAktif.dart';
import 'package:kopi_app/komponen/komponenKopi.dart';
import 'package:kopi_app/komponen/widgetKopi.dart';
import 'package:kopi_app/pages/authSceens/signInHpNomer.dart';
import 'package:kopi_app/service/userAuth.dart';

class DaftarScreens extends StatefulWidget {
  const DaftarScreens({super.key});

  // final Function()? onClik;
  // final Function()? onMulai;

  @override
  State<DaftarScreens> createState() => _DaftarScreensState();
}

class _DaftarScreensState extends State<DaftarScreens> {
  final auth = Get.put(UserAuthKopi());

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              clipBehavior: Clip.antiAliasWithSaveLayer,
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
                          text: '\nDaftar Sekarang!',
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
                  height: 40.0,
                  child: MaterialButton(
                    color: Colors.limeAccent,
                    shape: ContinuousRectangleBorder(
                      side: BorderSide(width: 2.0, color: Colors.lime.shade800),
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Text(
                      'Mulai Daftar',
                      style: TextStyle(
                          color: Colors.lime.shade900,
                          fontWeight: FontWeight.w600),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MasukOrDaftar(),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                const DividerKopi(),
                const SizedBox(height: 25.0),
                // SizedBox(
                //   height: 40,
                //   width: size.width - 120.0,
                //   child: MaterialButton(
                //     shape: RoundedRectangleBorder(
                //         side:
                //             BorderSide(width: 2.0, color: Colors.lime.shade800),
                //         borderRadius: BorderRadius.circular(10.0)),
                //     child: Text(
                //       'Nomor HP',
                //       style: TextStyle(
                //           color: Colors.lime.shade900,
                //           fontWeight: FontWeight.w600),
                //     ),
                //     onPressed: () => Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => const MasukDenganNomorHp())),
                //   ),
                // ),
                // const SizedBox(height: 15.0),
                SizedBox(
                  height: 40,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        side:
                            BorderSide(width: 2.0, color: Colors.lime.shade800),
                        borderRadius: BorderRadius.circular(10.0)),
                    child: const BtnGoogle(),
                    onPressed: () => auth.signInWithGoogle(context),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
