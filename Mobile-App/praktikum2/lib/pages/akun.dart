import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:praktikum2/component/infoAkun.dart';
import 'package:praktikum2/component/pengaturanUmum.dart';

class Akun extends StatefulWidget {
  const Akun({super.key});

  @override
  State<Akun> createState() => _AkunState();
}

class _AkunState extends State<Akun> {
  @override
  Widget build(BuildContext context) {
    // var sized = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(parent: const ScrollPhysics().parent),
        child: Column(
          children: [
            SizedBox(
              height: 250,
              child: Stack(
                children: [
                  Container(
                    height: 200,
                    color: Colors.deepPurple,
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(-2, 2),
                              color: Colors.black12,
                              blurRadius: 8,
                              blurStyle: BlurStyle.normal)
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 25),
                            padding: const EdgeInsets.all(8),
                            child: Image.asset(
                              'assets/images/avatar/avatar.png',
                              width: 40,
                              height: 40,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(bottom: 6),
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    'Riyadh Ruzaini',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.only(top: 6),
                                  alignment: Alignment.centerLeft,
                                  child: const Text(
                                    'Riyadh56870@gmail.com',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Stack(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 20, left: 25),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              alignment: AlignmentDirectional.center,
                              minimumSize: const Size(2, 2),
                              fixedSize: const Size(30, 30),
                              padding: const EdgeInsets.only(right: 2, top: 5),
                              elevation: 0,
                              backgroundColor: Colors.transparent,
                              side: const BorderSide(
                                  width: 1,
                                  color: Colors.white,
                                  style: BorderStyle.solid)),
                          onPressed: () {},
                          child: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(top: 20),
                        alignment: Alignment.topCenter,
                        child: const Text(
                          'Akun Saya',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              color: Colors.white,
                              letterSpacing: 1),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Informasi Akun',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: 100,
              child: const InformasiAkun(),
            ),
            const SizedBox(height: 25),
            Container(
              margin: const EdgeInsets.only(left: 15),
              alignment: Alignment.centerLeft,
              child: const Text(
                'Pengaturan Umum',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10),
              height: 400,
              child: const PengaturanUmum(),
            ),
          ],
        ),
      ),
    );
  }
}
