import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopi_app/komponen/komponenKopi.dart';
import 'package:kopi_app/models/menuModel.dart';

class MenuKopi extends StatefulWidget {
  const MenuKopi({super.key});

  @override
  State<MenuKopi> createState() => _MenuKopiState();
}

class _MenuKopiState extends State<MenuKopi> {
  final menu = Get.lazyPut(() => MainMenuButton());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: ClipRRect(
        child: Container(
          width: size.width,
          height: size.height - 460,
          margin: const EdgeInsets.all(20),
          child: gridMenu(),
        ),
      ),
    );
  }

  gridMenu() {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4 * 4 ~/ 4,
        childAspectRatio: 1.0,
        // crossAxisSpacing: 5.0,
        // mainAxisSpacing: 5.0,
      ),
      children: MainMenuButton.dataWidget
          .map((e) => MainMenuButton.permanin.mainMenu(context, e))
          .toList(),
    );
  }
}
