import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class PayMenuModel {
  final IconData icon;
  final String lebel;

  const PayMenuModel({required this.icon, required this.lebel});
}

class PayMenuButton extends GetxController {
  static PayMenuButton get permanin => Get.find();

  static const List<PayMenuModel> btnDataPay = [
    topUp,
    bayar,
    kirim,
  ];

  static const topUp =
      PayMenuModel(icon: FontAwesomeIcons.moneyBillWave, lebel: 'Top Up');
  static const bayar =
      PayMenuModel(icon: FontAwesomeIcons.googlePay, lebel: 'Bayar');
  static const kirim =
      PayMenuModel(icon: FontAwesomeIcons.solidPaperPlane, lebel: 'Kirim');

  Widget builBtnPay(PayMenuModel item) {
    return GestureDetector(
      child: Flex(
        direction: Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.limeAccent[100],
              border: const Border.fromBorderSide(BorderSide(
                  style: BorderStyle.solid,
                  strokeAlign: BorderSide.strokeAlignInside)),
            ),
            child: FaIcon(item.icon),
          ),
          SizedBox(
            child: Text(
              item.lebel,
              style: TextStyle(
                color: Colors.black.withAlpha(200),
                fontWeight: FontWeight.w700,
                fontSize: 14.0,
                letterSpacing: 0.7,
              ),
            ),
          ),
        ],
      ),
      onTap: () {},
    );
  }
}
