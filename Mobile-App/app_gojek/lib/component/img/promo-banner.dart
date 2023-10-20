import 'package:flutter/material.dart';

class BannerPertama extends StatelessWidget {
  const BannerPertama({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset(
        'assets/images/img5.jpg',
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
