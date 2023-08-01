import 'dart:ui';

import 'package:flutter/material.dart';

class InformasiAkun extends StatefulWidget {
  const InformasiAkun({super.key});

  @override
  State<InformasiAkun> createState() => _InformasiAkunState();
}

class _InformasiAkunState extends State<InformasiAkun> {
  @override
  Widget build(BuildContext context) {
    List listIcons = [
      Icons.email_rounded,
      Icons.lock,
      Icons.language,
    ];
    List lebel = [
      'Email',
      'Kata Sandi',
      'Bahasa',
    ];
    List subLebel = [
      'Riyadh56870@gmail.com',
      '••••••••',
      'Bahasa Indonesia',
    ];
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: lebel.length,
      itemBuilder: (context, int index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 5, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    listIcons[index],
                    color: Colors.purple,
                    size: 25,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    lebel[index],
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 12),
                  )
                ],
              ),
              Text(
                subLebel[index],
                style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: Colors.black45),
              ),
            ],
          ),
        );
      },
    );
  }
}
