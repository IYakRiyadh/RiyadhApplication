import 'package:flutter/material.dart';
import 'package:prak3/helper/dbHerlper.dart';
import 'package:prak3/main.dart';
import 'package:prak3/pages/home.dart';
import 'package:prak3/pages/penjualanTiket.dart';
import 'package:prak3/pages/profil.dart';
import 'package:sqflite/sqflite.dart';

class BottomBarNavigasi extends StatefulWidget {
  const BottomBarNavigasi({super.key});

  @override
  State<BottomBarNavigasi> createState() => _BottomBarNavigasiState();
}

class _BottomBarNavigasiState extends State<BottomBarNavigasi> {
  int _currentIndex = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int jumlah = 0;
    return Scaffold(
      body: _lamanBody(),
      bottomNavigationBar: _NavControlView(),
    );
  }

  Widget _lamanBody() => Container(
        child: IndexedStack(
          index: _currentIndex,
          children: const <Widget>[
            Beranda(),
            PenjualanTiket(),
            ProfilPage(),
          ],
        ),
      );

  Widget _NavControlView() => BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w900),
        selectedItemColor: Colors.teal,
        selectedIconTheme: const IconThemeData(color: Colors.teal),
        showUnselectedLabels: false,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() => _currentIndex = index);
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_num),
            label: 'Tiket',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      );
}
