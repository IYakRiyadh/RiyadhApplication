import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kopi_app/komponen/komponenKopi.dart';

class IntroViews extends GetxController {
  static IntroViews get permanin => Get.find();

  Stream<void> introService() async* {
    await cloud_db.collection('intropage').get();
  }
}
