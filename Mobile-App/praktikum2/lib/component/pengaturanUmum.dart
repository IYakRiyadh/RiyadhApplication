import 'package:flutter/material.dart';

class PengaturanUmum extends StatefulWidget {
  const PengaturanUmum({super.key});

  @override
  State<PengaturanUmum> createState() => _PengaturanUmumState();
}

class _PengaturanUmumState extends State<PengaturanUmum> {
  @override
  Widget build(BuildContext context) {
    List listIconsUmum = [
      Icons.notifications,
      Icons.question_mark_rounded,
      Icons.warning_amber_rounded,
    ];
    List lebelUmum = [
      'Notifikasi',
      'Bantuan',
      'Tentang',
    ];

    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: listIconsUmum.length,
      itemBuilder: (context, int index) {
        return Container(
          margin: const EdgeInsets.only(bottom: 5, top: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.purple,
                    ),
                    child: Icon(
                      listIconsUmum[index],
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    lebelUmum[index],
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
