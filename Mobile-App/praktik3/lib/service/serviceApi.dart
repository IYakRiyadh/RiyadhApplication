import 'dart:convert';
import 'dart:html';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prak3/models/modelLocal.dart';

class ServiceConfig {
  static Future<List<MenuModel>?> detailItem() async {
    final url = Uri.parse(
        'https://gist.githubusercontent.com/IYakRiyadh/2b38be0da91e3de78672e13f439d4721/raw/b6c058f2b40fee5c3460432c308772536f93a843/menu.json');
    final respons = await http.get(url);

    final dataDetail = jsonDecode(respons.body);
    return dataDetail.map<MenuModel>(MenuModel.fromJson).toList();
  }

  static Future<List<MenuModel>> ambilApi(BuildContext context) async {
    final menuJson = DefaultAssetBundle.of(context);
    final menu = await menuJson.loadString('assets/json/menu.json');
    final view = json.decode(menu);

    return view.map<MenuModel>(MenuModel.fromJson).toList();
  }
}
