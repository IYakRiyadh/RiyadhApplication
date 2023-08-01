import 'dart:js';

import 'package:meta/meta.dart';

class MenuModel {
  final String nama;
  final String image;

  final String detailImg;
  final String namaImg;
  final String harga;
  final String deskripsi;

  const MenuModel({
    required this.nama,
    required this.image,
    required this.detailImg,
    required this.namaImg,
    required this.harga,
    required this.deskripsi,
  });

  static MenuModel fromJson(json) => MenuModel(
        nama: json['nama'],
        image: json['image'],
        detailImg: json["detailImg"],
        namaImg: json["namaImg"],
        harga: json["harga"],
        deskripsi: json["deskripsi"],
      );
}
