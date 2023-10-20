import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:kopi_app/models/payMenuModel.dart';

class WalletKu extends StatefulWidget {
  const WalletKu({super.key});

  @override
  State<WalletKu> createState() => _WalletKuState();
}

class _WalletKuState extends State<WalletKu> {
  final menu = Get.lazyPut(() => PayMenuButton());

  CarouselController ctrlCarousel = CarouselController();
  int menuItemIndex = 0;
  List<Widget> slideMenu = [
    ClipRRect(
      child: SizedBox(
        height: 110,
        child: Card(
          color: Colors.limeAccent[100],
          child: MaterialButton(
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.coins,
                  size: const Size(50, 50).height,
                  color: Colors.lime[800],
                ),
                const SizedBox(height: 2.0),
                Text(
                  'Coins',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.lime[800],
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ),
      ),
    ),
    ClipRRect(
      child: SizedBox(
        height: 110,
        child: Card(
          color: Colors.limeAccent[100],
          child: MaterialButton(
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.wallet,
                  size: const Size(50, 50).height,
                  color: Colors.lime[800],
                ),
                const SizedBox(height: 2.0),
                Text(
                  'Wallet',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.lime[800],
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
            onPressed: () {},
          ),
        ),
      ),
    ),
  ];

  List<Widget> infoSaldoKoin = [
    ClipRRect(
      child: Card(
        color: Colors.lime[600]!.withOpacity(0.75),
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Stack(
            // direction: Axis.vertical,
            children: [
              SizedBox(
                child: Text(
                  '2.000 Koin',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                    color: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Cara Dapatkan Koin!',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.8,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    ClipRRect(
      child: Card(
        color: Colors.lime[600]!.withOpacity(0.75),
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Stack(
            // direction: Axis.vertical,
            children: [
              SizedBox(
                child: Text(
                  'Rp. 2.000.000',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.8,
                    color: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Top Up dengan Mudah!',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.8,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ClipRRect(
        child: Container(
          height: 160.0,
          margin: const EdgeInsets.all(20.0),
          // padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.lime,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: walletMenu(),
        ),
      ),
    );
  }

  walletMenu() {
    return ClipRRect(
      child: Flex(
        direction: Axis.horizontal,
        children: [
          ClipRRect(
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.end,
              children: slideMenu.asMap().entries.map((e) {
                return GestureDetector(
                  child: Container(
                    width: 10,
                    height: menuItemIndex == e.key ? 18.0 : 10,
                    margin: const EdgeInsets.only(
                        left: 8.0, bottom: 8.0, right: 4.0),
                    decoration: BoxDecoration(
                        borderRadius: menuItemIndex == e.key
                            ? BorderRadius.circular(5)
                            : BorderRadius.circular(10),
                        // shape:BoxShape.circle,
                        color: menuItemIndex == e.key
                            ? Colors.limeAccent[100]
                            : Colors.lime[800]),
                  ),
                  onTap: () {
                    setState(() {
                      ctrlCarousel.animateToPage(e.key,
                          duration: const Duration(seconds: 4),
                          curve: Curves.bounceInOut);
                    });
                  },
                );
              }).toList(),
            ),
          ),
          ClipRRect(
            child: SizedBox(
              height: 160,
              width: 100,
              // width: MediaQuery.of(context).size.width - 89,
              child: CarouselSlider(
                carouselController: ctrlCarousel,
                items: slideMenu,
                options: CarouselOptions(
                  // aspectRatio: 2.0,
                  viewportFraction: 0.75,
                  scrollDirection: Axis.vertical,
                  autoPlay: true,
                  autoPlayAnimationDuration: const Duration(seconds: 2),
                  enlargeCenterPage: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      menuItemIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
          ClipRRect(
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 5.0),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      height: 78,
                      width: MediaQuery.of(context).size.width - 90 - 80,
                      margin: const EdgeInsets.only(right: 6.0),
                      child: CarouselSlider(
                        // itemCount: infoSaldoKoin.length,
                        carouselController: ctrlCarousel,
                        items: infoSaldoKoin
                            .asMap()
                            .entries
                            .map((e) => infoSaldoKoin[menuItemIndex])
                            .toList(),
                        options: CarouselOptions(
                          initialPage: menuItemIndex,
                          scrollDirection: Axis.vertical,
                          viewportFraction: 1.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              menuItemIndex = reason.index;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional.bottomCenter,
                    child: Container(
                      height: 65,
                      padding: const EdgeInsets.only(right: 8.0),
                      width: MediaQuery.of(context).size.width - 162,
                      // color: Colors.amber,
                      child: btnPayMenu(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  btnPayMenu() {
    return ListView(
      scrollDirection: Axis.horizontal,
      // physics: BouncingScrollPhysics,
      itemExtent: 80.0,
      children: PayMenuButton.btnDataPay
          .map((e) => PayMenuButton.permanin.builBtnPay(e))
          .toList(),
    );
  }
}
