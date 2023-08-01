import 'dart:html';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:prak3/components/gridItem.dart';
import 'package:prak3/pages/profil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    var ukuran = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 280,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(40),
                            bottomRight: Radius.circular(40),
                          ),
                          color: Colors.teal[400],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 15, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Beranda',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                      InkResponse(
                        child: Image.asset(
                          '/images/avatar.png',
                          fit: BoxFit.cover,
                          width: 25,
                          height: 25,
                        ),
                        onTap: () {
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) =>
                          //         const ProfilPage(nama: , email: email),
                          //   ),
                          // );
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 40,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  margin: const EdgeInsets.only(
                      bottom: 25, left: 20, top: 30, right: 25),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(1, 4),
                        color: Colors.black26,
                        blurRadius: 3,
                        blurStyle: BlurStyle.solid,
                      ),
                    ],
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      suffixIcon: const Icon(
                        Icons.search,
                      ),
                      contentPadding: const EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        gapPadding: 8,
                        borderRadius: BorderRadius.circular(40),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: ukuran.width,
                  height: ukuran.height,
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 15),
                  child: const GridMenuItem(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
