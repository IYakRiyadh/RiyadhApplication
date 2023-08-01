import 'package:flutter/material.dart';
import 'package:praktikum2/pages/beranda.dart';
import 'package:praktikum2/pages/akun.dart';
import 'package:praktikum2/pages/statistik.dart';

class BottomBarNavigasi extends StatefulWidget {
  const BottomBarNavigasi({super.key});

  @override
  State<BottomBarNavigasi> createState() => _BottomBarNavigasiState();
}

class _BottomBarNavigasiState extends State<BottomBarNavigasi> {
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            Akun(),
          ],
        ),
      );

  Widget _NavControlView() => BottomNavigationBar(
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w900),
        selectedItemColor: Colors.deepPurpleAccent,
        selectedIconTheme: const IconThemeData(color: Colors.deepPurpleAccent),
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
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      );
}
