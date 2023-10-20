import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class InfoTransaksiModelData {
  final IconData icon;
  final String strPersen;
  final String strJmlSaldo;
  final Color color;

  const InfoTransaksiModelData(this.strPersen,
      {required this.icon, required this.strJmlSaldo, required this.color});
}

class TransaksiInfoData extends GetxController {
  static TransaksiInfoData get instance => Get.find();

  static const List<InfoTransaksiModelData> modelDataSld = [
    saldo,
  ];
  static const List<InfoTransaksiModelData> modelDataPnPm = [
    pengeluaran,
    pemasukan,
  ];

  static const saldo = InfoTransaksiModelData(
    icon: FontAwesomeIcons.rupiahSign,
    color: Colors.transparent,
    strJmlSaldo: 'Rp. 600.000',
    'Saldo Saya',
  );
  static const pengeluaran = InfoTransaksiModelData(
    icon: FontAwesomeIcons.circleArrowDown,
    color: Colors.red,
    strJmlSaldo: 'Rp. 150.000',
    '12%',
  );
  static const pemasukan = InfoTransaksiModelData(
    icon: FontAwesomeIcons.circleArrowUp,
    color: Colors.green,
    strJmlSaldo: 'Rp. 400.000',
    '30%',
  );

  Widget infoTransaksi(InfoTransaksiModelData item) {
    return ClipRRect(
      child: Container(
        alignment: AlignmentDirectional.center,
        child: Card(
          color: Colors.lime[100],
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FaIcon(
                    item.icon,
                    color: item.color,
                  ),
                  const SizedBox(width: 8.0),
                  Text(
                    item.strPersen,
                    style: const TextStyle(
                        fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              SizedBox(
                child: Text(
                  item.strJmlSaldo,
                  style: const TextStyle(
                      fontSize: 16.0, fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget saldoInfo(BuildContext context, InfoTransaksiModelData item) {
    final size = MediaQuery.sizeOf(context);
    return ClipRRect(
      child: Container(
        width: size.width,
        height: 100.0,
        child: Card(
          color: Colors.limeAccent[100],
          child: Flex(
            direction: Axis.vertical,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                child: Text(
                  item.strPersen.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 15.0, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(height: 8.0),
              SizedBox(
                child: Text(
                  item.strJmlSaldo,
                  style: const TextStyle(
                      fontSize: 20.0, fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
