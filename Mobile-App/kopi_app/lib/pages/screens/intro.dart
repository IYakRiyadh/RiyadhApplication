import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopi_app/komponen/komponenKopi.dart';
import 'package:kopi_app/pages/authSceens/otpPage.dart';
import 'package:kopi_app/pages/authSceens/getStarted.dart';
import 'package:kopi_app/service/introService.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final data = Get.put(IntroViews());

  int aktifCarousel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ClipRRect(
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider.builder(
                  itemCount: img.length,
                  itemBuilder:
                      (BuildContext context, int index, int realIndex) {
                    // final docs = snapshot.data!.docs[index].data();

                    // var dataIntro = docs.data();
                    // docsList = snapshot.data!.docs[index];
                    return ClipRRect(
                      child: Flex(
                        direction: Axis.vertical,
                        children: [
                          Image.asset(
                            img[index],
                            fit: BoxFit.contain,
                            height: 250,
                          ),
                          SizedBox(
                            child: Text(
                              judul[index].capitalize.toString(),
                              overflow: TextOverflow.fade,
                              style: const TextStyle(
                                  overflow: TextOverflow.fade,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.0),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: 280.0,
                    initialPage: aktifCarousel,
                    enlargeFactor: 1,
                    viewportFraction: 1,
                    autoPlay: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        aktifCarousel = index;
                      });
                    },
                  ),
                ),
                SizedBox(height: 15.0),
                ClipRRect(
                  child: SizedBox(
                    width: 18.0 * 3 + 8.0,
                    child: Flex(
                      direction: Axis.horizontal,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: judul.asMap().entries.map((e) {
                        return GestureDetector(
                          child: Container(
                            height: 10.0,
                            width: aktifCarousel == e.key ? 18.0 : 10.0,
                            margin: const EdgeInsets.symmetric(horizontal: 1.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: aktifCarousel == e.key
                                    ? Colors.lime[800]
                                    : Colors.lime[800]!.withOpacity(0.5)),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 30.0),
                Container(
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      MaterialButton(
                        shape: ContinuousRectangleBorder(
                          side: BorderSide(
                              color: Colors.lime.shade900,
                              width: 2.0,
                              style: BorderStyle.solid,
                              strokeAlign: 5.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PageOtpCode()),
                        ),
                        child: Text(
                          'Masuk Sebagai Penjual',
                          style: TextStyle(
                            color: Colors.lime.shade900,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      MaterialButton(
                        color: Colors.lime[800],
                        shape: ContinuousRectangleBorder(
                          side: BorderSide(
                              color: Colors.lime.shade800,
                              width: 2.0,
                              style: BorderStyle.solid,
                              strokeAlign: 5.0),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: const Text(
                          'Masuk Sebagai Pembeli',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DaftarScreens()),
                          );
                        },
                      ),
                    ],
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
