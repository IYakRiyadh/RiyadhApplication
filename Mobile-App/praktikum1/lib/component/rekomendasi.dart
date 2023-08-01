import 'package:flutter/material.dart';

class Rekomendasi extends StatefulWidget {
  const Rekomendasi({super.key});

  @override
  State<Rekomendasi> createState() => _RekomendasiState();
}

class _RekomendasiState extends State<Rekomendasi> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 20, right: 20),
      physics: const BouncingScrollPhysics().parent,
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.lightBlue[100],
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: const Image(
                    image: AssetImage('assets/images/food/img4.png'),
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                const Column(children: [
                  Text('Paket murah',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  Text('Starting from', style: TextStyle(fontSize: 12)),
                  Text('Rp. 15.000',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ]),
              ]),
        ),
        const SizedBox(width: 20),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.lightBlue[100],
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: const Image(
                    image: AssetImage('assets/images/food/img1.png'),
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                const Column(children: [
                  Text('Mie Seafood',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  Text('Starting from', style: TextStyle(fontSize: 12)),
                  Text('Rp. 15.000',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ]),
              ]),
        ),
        const SizedBox(width: 20),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.lightBlue[100],
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: const Image(
                    height: 50,
                    image: AssetImage('assets/images/food/imgpizza.png'),
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                const Column(children: [
                  Text('Pizza',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  Text('Starting from', style: TextStyle(fontSize: 12)),
                  Text('Rp. 12.000',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ]),
              ]),
        ),
        const SizedBox(width: 20),
        Container(
          padding: const EdgeInsets.only(left: 10, right: 10),
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.lightBlue[100],
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: const Image(
                    image: AssetImage('assets/images/food/img5.png'),
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                const Column(children: [
                  Text('Burger',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                  Text('Starting from', style: TextStyle(fontSize: 12)),
                  Text('Rp. 12.000',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ]),
              ]),
        ),
      ],
    );
  }
}
