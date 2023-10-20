import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kopi_app/pages/screens/kopiMenuList%20copy%202.dart';
import 'package:kopi_app/pages/screens/kopiMenuList%20copy%203.dart';
import 'package:kopi_app/pages/screens/kopiMenuList%20copy.dart';
import 'package:kopi_app/pages/screens/kopiMenuList.dart';
import 'package:get/get.dart';

class MainMenuModel {
  final IconData icon;
  final String lebel;

  const MainMenuModel({required this.icon, required this.lebel});
}

class MainMenuButton extends GetxController {
  static MainMenuButton get permanin => Get.find();
  static const List<MainMenuModel> dataWidget = [
    cariWarkop,
    pesanKopi,
    pesanMakan,
    beliPulsa,
  ];

  static const cariWarkop = MainMenuModel(
      // ignore: deprecated_member_use
      lebel: 'Warkop',
      icon: FontAwesomeIcons.searchLocation);
  static const pesanKopi =
      // ignore: deprecated_member_use
      MainMenuModel(lebel: 'Kopi', icon: Icons.coffee_rounded);
  static const pesanMakan =
      MainMenuModel(lebel: 'Makan', icon: FontAwesomeIcons.utensils);
  static const beliPulsa = MainMenuModel(
      lebel: 'Pulsa/Data', icon: FontAwesomeIcons.mobileScreenButton);

  Widget mainMenu(BuildContext cxt, MainMenuModel item) {
    return GestureDetector(
      child: ClipRRect(
        child: Flex(
          direction: Axis.vertical,
          children: [
            ClipRRect(
              child: Container(
                width: 50,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: Colors.lime.shade900,
                    strokeAlign: BorderSide.strokeAlignInside,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.limeAccent,
                ),
                child: FaIcon(item.icon),
              ),
            ),
            const SizedBox(height: 5.0),
            SizedBox(
              child: Text(
                item.lebel,
                style: const TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8),
              ),
            ),
          ],
        ),
      ),
      onTap: () => onTapAction(cxt, item),
    );
  }

  void onTapAction(BuildContext cxt, MainMenuModel item) {
    switch (item) {
      case MainMenuButton.cariWarkop:
        Navigator.of(cxt).push(MaterialPageRoute(
          builder: (context) => MenuKopuList(),
        ));
        break;
      case MainMenuButton.pesanKopi:
        Navigator.of(cxt).push(MaterialPageRoute(
          builder: (context) => MenuKopuListA(),
        ));
        break;
      case MainMenuButton.pesanMakan:
        Navigator.of(cxt).push(MaterialPageRoute(
          builder: (context) => MenuKopuListB(),
        ));
        break;
      case MainMenuButton.beliPulsa:
        Navigator.of(cxt).push(MaterialPageRoute(
          builder: (context) => MenuKopuListC(),
        ));
        break;
      default:
    }
  }
}
