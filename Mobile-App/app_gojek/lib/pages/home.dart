import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_gojek/component/menu/mainMenu.dart';
import 'package:app_gojek/component/myWideget.dart';
import 'package:app_gojek/component/img/promo-banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int aktifSlide = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff00AA13),
        title: Container(
          height: 50,
          child: SearchBar(
            leading: const Padding(
              padding: EdgeInsets.only(left: 8.0, right: 8.0),
              child: FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                color: Colors.black87,
              ),
            ),
            hintText: searchHintHomePage,
            hintStyle: MaterialStateTextStyle.resolveWith(
              (states) => TextStyle(
                  fontSize: 16.0,
                  color: Color.fromRGBO(0, 0, 0, 90),
                  fontWeight: FontWeight.normal,
                  fontFamily: ff_poppins),
            ),
          ),
        ),
        actions: const <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 6.0, right: 15.0),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
              child: Icon(
                Icons.person,
                size: 30,
                color: Color(0xff00AA13),
              ),
            ),
          ),
        ],
        elevation: 0.0,
        toolbarHeight: 100,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Container(
                height: 120.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: const Color(0xff007895),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: saldoGojek.asMap().entries.map((entry) {
                                return GestureDetector(
                                  onTap: () => ctrlSaldoSlider.animateToPage(
                                      entry.key,
                                      curve: Curves.bounceIn,
                                      duration: const Duration(seconds: 2)),
                                  child: Container(
                                    width: 2.8,
                                    height: 12.0,
                                    margin: const EdgeInsets.symmetric(
                                      vertical: 2.0,
                                      horizontal: 2.5,
                                    ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: aktifSlide == entry.key
                                          ? Colors.white
                                          : Colors.white60,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          Container(
                            width: 160,
                            child: CarouselSlider.builder(
                              itemCount: saldoGojek.length,
                              itemBuilder: (context, index, realIndex) {
                                return MaterialButton(
                                  minWidth: 160.0,
                                  height: 120,
                                  padding: EdgeInsets.fromViewPadding(
                                      ViewPadding.zero, 16 / 9),
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 160.0,
                                    height: 120,
                                    padding: const EdgeInsets.only(
                                        left: 10.0,
                                        top: 5.0,
                                        right: 10.0,
                                        bottom: 5.0),
                                    margin: const EdgeInsets.only(
                                        bottom: 3.0, top: 2.0),
                                    decoration: BoxDecoration(
                                        color: aktifSlide == index
                                            ? Colors.white
                                            : Colors.white70,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            index == 0
                                                ? const FaIcon(
                                                    FontAwesomeIcons.coins,
                                                    size: 15.0,
                                                    color: Color(0xFF03A9CC),
                                                  )
                                                : const FaIcon(
                                                    FontAwesomeIcons.wallet,
                                                    size: 15.0,
                                                    color: Color(0xFF03A9CC),
                                                  ),
                                            const SizedBox(
                                              width: 5.0,
                                            ),
                                            index == 0
                                                ? Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: 'gopay',
                                                          style: TextStyle(
                                                              fontSize: 16.5,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w800,
                                                              fontFamily:
                                                                  ff_poppins),
                                                        ),
                                                        TextSpan(text: ' '),
                                                        TextSpan(
                                                            text: 'coins',
                                                            style: TextStyle(
                                                                fontSize: 16.5,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontFamily:
                                                                    ff_poppins)),
                                                      ],
                                                    ),
                                                  )
                                                : Text(
                                                    'gopay',
                                                    style: TextStyle(
                                                      fontSize: 16.5,
                                                      fontWeight:
                                                          FontWeight.w800,
                                                      fontFamily: ff_poppins,
                                                    ),
                                                  ),
                                          ],
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          children: [
                                            index == 0
                                                ? Text(
                                                    '0',
                                                    style: TextStyle(
                                                      fontSize: 17.0,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontFamily: ff_poppins,
                                                    ),
                                                  )
                                                : Text(
                                                    'Rp. -',
                                                    style: TextStyle(
                                                      fontSize: 17.0,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontFamily: ff_poppins,
                                                    ),
                                                  ),
                                          ],
                                        ),
                                        const SizedBox(height: 2),
                                        Row(
                                          children: [
                                            index == 0
                                                ? Text(
                                                    'Klik buat detailnya',
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Color(0xFF0C8913),
                                                      fontFamily: ff_poppins,
                                                    ),
                                                  )
                                                : Text(
                                                    'Klik & cek riwayat',
                                                    style: TextStyle(
                                                      fontSize: 14.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: ff_poppins,
                                                      color: Color(0xFF0C8913),
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  onPressed: () {},
                                );
                              },
                              options: CarouselOptions(
                                height: 120,
                                enlargeFactor: 0.2,
                                enlargeCenterPage: true,
                                viewportFraction: 0.80,
                                initialPage: aktifSlide,
                                enableInfiniteScroll: false,
                                scrollDirection: Axis.vertical,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    aktifSlide = index;
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              // padding: const EdgeInsets.all(5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: MaterialButton(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0)),
                                      padding: EdgeInsets.zero,
                                      onPressed: () {},
                                      child: const FaIcon(
                                          FontAwesomeIcons.arrowUp,
                                          color: Color(0xff007895),
                                          size: 17.4),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      'Bayar',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                        fontFamily: ff_poppins,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 15.0),
                            Container(
                              // padding: const EdgeInsets.all(5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: MaterialButton(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0)),
                                      padding: EdgeInsets.zero,
                                      onPressed: () {},
                                      child: const FaIcon(FontAwesomeIcons.plus,
                                          color: Color(0xff007895), size: 17.4),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      'Top Up',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                        fontFamily: ff_poppins,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 15.0),
                            Container(
                              // padding: const EdgeInsets.all(5.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 30,
                                    height: 30,
                                    child: MaterialButton(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0)),
                                      padding: EdgeInsets.zero,
                                      onPressed: () {},
                                      child: const FaIcon(
                                          FontAwesomeIcons.rocket,
                                          color: Color(0xff007895),
                                          size: 17.4),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.0),
                                    child: Text(
                                      'Eksplor',
                                      style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white,
                                        fontFamily: ff_poppins,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: BannerPertama(),
              ),
              const SizedBox(height: 20.0),
              Container(
                height: 239.5,
                width: size.width,
                alignment: Alignment.center,
                padding: EdgeInsets.all(1.5),
                child: MainMenuGojek(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
