import 'dart:io';

import 'package:flutter/material.dart';

class FoodItem extends StatelessWidget {
  const FoodItem({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 20, right: 20),
      physics: const BouncingScrollPhysics().parent,
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          height: 150,
          width: 100,
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color.fromRGBO(79, 195, 247, 0.5)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 60,
                  child: const Image(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/food/imgpizza.png')),
                ),
                const Column(children: [
                  SizedBox(
                    child: Text('Pizza',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                  SizedBox(
                    child:
                        Text('Starting from', style: TextStyle(fontSize: 12)),
                  ),
                  SizedBox(
                    child: Text('Rp. 12.000',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold)),
                  ),
                ]),
              ]),
        ),
        const SizedBox(width: 20),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromRGBO(79, 195, 247, 0.5),
          ),
          width: 100,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 60,
                  child: const Image(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/food/img5.png')),
                ),
                const Column(children: [
                  SizedBox(
                    child: Text('Burger',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                  SizedBox(
                    child:
                        Text('Starting from', style: TextStyle(fontSize: 12)),
                  ),
                  SizedBox(
                      child: Text('Rp. 12.000',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold))),
                ]),
              ]),
        ),
        const SizedBox(width: 20),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromRGBO(79, 195, 247, 0.5),
          ),
          width: 100,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: const Image(
                      height: 50,
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/food/img4.png')),
                ),
                const Column(children: [
                  SizedBox(
                    child: Text('Paket Murah',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                  SizedBox(
                    child:
                        Text('Starting from', style: TextStyle(fontSize: 12)),
                  ),
                  SizedBox(
                      child: Text('Rp. 15.000',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold))),
                ]),
              ]),
        ),
        const SizedBox(width: 20),
        Container(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: const Color.fromRGBO(79, 195, 247, 0.5),
          ),
          width: 100,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 60,
                  child: const Image(
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/food/img1.png')),
                ),
                const Column(children: [
                  SizedBox(
                    child: Text('Seafoood',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12)),
                  ),
                  SizedBox(
                    child:
                        Text('Starting from', style: TextStyle(fontSize: 12)),
                  ),
                  SizedBox(
                      child: Text('Rp. 20.000',
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold))),
                ]),
              ]),
        ),
      ],
    );
  }
}
