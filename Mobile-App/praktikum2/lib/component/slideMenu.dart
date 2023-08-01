import 'package:flutter/material.dart';
import 'package:blobs/blobs.dart';

class SlideMenu extends StatelessWidget {
  const SlideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    List imagesMenu = [
      'assets/images/pig.png',
      'assets/images/dp.png',
      'assets/images/shop.png',
      'assets/images/wallet.png',
      'assets/images/game.png',
      'assets/images/sim.png',
      'assets/images/tv.png',
      'assets/images/health.png',
    ];
    List lebelMenu = [
      'Nabung',
      'Kirim Uang',
      'Shop',
      'Dompet Saya',
      'Games',
      'Health',
      'Pulsa/Data',
      'TV/Internet',
    ];
    List bgColorMenu = [
      Colors.lightGreenAccent,
      Colors.pinkAccent.shade200,
      Colors.limeAccent,
      Colors.lightBlueAccent,
      Colors.orangeAccent,
      Colors.redAccent,
      Colors.indigoAccent,
      Colors.greenAccent,
    ];
    return ListView.builder(
      physics: BouncingScrollPhysics(parent: const ScrollPhysics().parent),
      padding: const EdgeInsets.only(left: 25, right: 10),
      scrollDirection: Axis.horizontal,
      itemCount: imagesMenu.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: 100,
          height: 135,
          margin: const EdgeInsets.only(right: 20, top: 20, bottom: 20),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: bgColorMenu[index],
              boxShadow: const [
                BoxShadow(
                    offset: Offset(1, 3),
                    color: Colors.black26,
                    blurRadius: 6,
                    blurStyle: BlurStyle.normal)
              ]),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Stack(alignment: Alignment.center, children: [
                  Blob.fromID(
                    id: const ['7-5-8'],
                    size: 90,
                    styles: BlobStyles(
                      color: Colors.deepPurple,
                      fillType: BlobFillType.fill,
                    ),
                  ),
                  Image(
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    image: AssetImage(imagesMenu[index]),
                  ),
                ]),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    lebelMenu[index],
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 1,
                        shadows: [
                          Shadow(
                              offset: Offset(0, 1),
                              color: Colors.black26,
                              blurRadius: 5),
                          Shadow(
                              offset: Offset(1, 2),
                              color: Colors.black12,
                              blurRadius: 5)
                        ]),
                  ),
                ),
              ]),
        );
      },
    );
  }
}
