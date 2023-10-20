import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopi_app/models/transaksiInfoModel.dart';

class InfoTransaksi extends StatefulWidget {
  const InfoTransaksi({super.key});

  @override
  State<InfoTransaksi> createState() => _InfoTransaksiState();
}

class _InfoTransaksiState extends State<InfoTransaksi> {
  final dataTransaksi = Get.put(TransaksiInfoData());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SafeArea(
      child: ClipRRect(
        child: SizedBox(
          height: 180.0,
          width: size.width,
          child: Card(
            color: Colors.lime,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Flex(
                direction: Axis.vertical,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...TransaksiInfoData.modelDataSld.map((e) {
                    return Expanded(
                      child: dataTransaksi.saldoInfo(context, e),
                    );
                  }).toList(),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: TransaksiInfoData.modelDataPnPm.map((e) {
                        return Expanded(child: dataTransaksi.infoTransaksi(e));
                      }).toList(),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
