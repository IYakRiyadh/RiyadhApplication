import 'dart:ui';

import 'package:flutter/material.dart';

class Riwayat extends StatefulWidget {
  const Riwayat({super.key});

  @override
  State<Riwayat> createState() => _RiwayatState();
}

class _RiwayatState extends State<Riwayat> {
  @override
  Widget build(BuildContext context) {
    List images = [
      'assets/images/spotify.png',
      'assets/images/drible.png',
      'assets/images/freelance.png',
      'assets/images/eat.png',
      'assets/images/belanja.png',
      'assets/images/dota.png',
      'assets/images/netflix.png',
      'assets/images/medical.png',
      'assets/images/ml.png',
      'assets/images/steam.png',
      'assets/images/hbo.png',
      'assets/images/prime.png',
      'assets/images/pubg.png',
    ];
    List textLebel = [
      'Spotify',
      'Dribble',
      'Freelance',
      'Makan',
      'Shopping',
      'Dota',
      'Netflix',
      'Medical',
      'Mobile Legends: Bang-Bang',
      'Steam',
      'HBO',
      'Prime',
      'PUBG',
    ];
    List biaya = [
      '-500.000',
      '-350.000',
      '+750.000',
      '-100.000',
      '-350.000',
      '-300.000',
      '-150.000',
      '-150.000',
      '-100.000',
      '-150.000',
      '-250.000',
      '-100.000',
      '-350.000',
    ];
    return ListView.builder(
      physics: BouncingScrollPhysics(parent: const ScrollPhysics().parent),
      scrollDirection: Axis.vertical,
      itemCount: images.length,
      itemBuilder: (context, int index) {
        return Container(
          height: 50,
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(1, 2),
                              color: Colors.black12,
                              blurRadius: 5,
                              blurStyle: BlurStyle.inner)
                        ]),
                    child: Image.asset(
                      images[index],
                      fit: BoxFit.contain,
                      width: 35,
                      height: 35,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    child: Text(
                      textLebel[index],
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
              Container(
                child: Text(
                  'Rp. ${biaya[index]}',
                  style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 10,
                      fontWeight: FontWeight.w900),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
