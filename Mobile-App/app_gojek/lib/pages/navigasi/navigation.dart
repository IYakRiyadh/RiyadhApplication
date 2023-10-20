import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_gojek/pages/chat.dart';
import 'package:app_gojek/pages/home.dart';
import 'package:app_gojek/pages/pesanan.dart';
import 'package:app_gojek/pages/promo.dart';

class NavigasiBarBottom extends StatefulWidget {
  const NavigasiBarBottom({super.key});

  @override
  State<NavigasiBarBottom> createState() => _NavigasiBarBottomState();
}

class _NavigasiBarBottomState extends State<NavigasiBarBottom> {
  int _halamanAktif = 0;
  // User? user;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: halAktif(),
        bottomNavigationBar: SizedBox(height: 80.0, child: navBottomBar()),
        // restorationId: 'id_ID',
      );

  Widget halAktif() => Container(
        child: IndexedStack(
          index: _halamanAktif,
          children: const <Widget>[
            HomePage(),
            PromoPage(),
            PesananPage(),
            ChatPage(),
          ],
        ),
      );

  Widget navBottomBar() => BottomNavigationBar(
        selectedFontSize: 14.0,
        unselectedFontSize: 14.0,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        iconSize: 30,
        selectedItemColor: Colors.grey[700],
        unselectedItemColor: Colors.grey[500],
        currentIndex: _halamanAktif,
        onTap: (value) {
          setState(() => _halamanAktif = value);
        },
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home),
            activeIcon: FaIcon(FontAwesomeIcons.home, color: Color(0xff00AA13)),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
                backgroundColor: Colors.grey.shade500,
                radius: 15,
                child: const FaIcon(
                  FontAwesomeIcons.percent,
                  size: 15,
                  color: Colors.white,
                )),
            activeIcon: const CircleAvatar(
              radius: 15,
              backgroundColor: Color(0xff00AA13),
              child: FaIcon(
                FontAwesomeIcons.percent,
                color: Colors.white,
                size: 15,
              ),
            ),
            label: 'Promo',
          ),
          const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.receipt),
            activeIcon:
                FaIcon(FontAwesomeIcons.receipt, color: Color(0xff00AA13)),
            label: 'Pesanan',
          ),
          const BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.solidMessage),
            activeIcon:
                FaIcon(FontAwesomeIcons.solidMessage, color: Color(0xff00AA13)),
            label: 'Chat',
          ),
        ],
      );
}
