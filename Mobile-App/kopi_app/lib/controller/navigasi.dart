import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kopi_app/pages/beranda.dart';
import 'package:kopi_app/pages/kopiSaya.dart';
import 'package:kopi_app/pages/profil.dart';

class NavigasiBottom extends StatefulWidget {
  const NavigasiBottom({super.key});

  @override
  State<NavigasiBottom> createState() => _NavigasiBottomState();
}

class _NavigasiBottomState extends State<NavigasiBottom> {
  String? inisialPage = '/';
  int aktifPage = 1;

  Map<int, GlobalKey<NavigatorState>> navigasiKeys = {
    0: GlobalKey<NavigatorState>(),
    1: GlobalKey<NavigatorState>(),
    2: GlobalKey<NavigatorState>(),
  };

  List<Widget> content = [
    const MyKopi(),
    const BerandaApp(),
    const ProfilSaya(),
  ];

  @override
  void initState() {
    super.initState();
    // tapDipilih(navigasiKeys[aktifPage]);
    navigasiKeys;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildNavigasi(),
      bottomNavigationBar: bottomBar(),
    );
  }

  bottomBar() {
    return BottomNavigationBar(
      currentIndex: aktifPage,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.lime[800],
      selectedItemColor: Colors.limeAccent[100],
      showSelectedLabels: true,
      showUnselectedLabels: false,
      landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          label: 'Minum',
          icon: FaIcon(FontAwesomeIcons.mugSaucer),
        ),
        BottomNavigationBarItem(
          label: 'Beranda',
          icon: FaIcon(FontAwesomeIcons.house),
        ),
        BottomNavigationBarItem(
          label: 'Profil',
          icon: FaIcon(FontAwesomeIcons.solidUser),
        ),
      ],
      onTap: (value) {
        setState(() {
          // aktifPage = (navigasiKeys[aktifPage]) as int;
          aktifPage = value;
        });
      },
    );
  }

  buildNavigasi() {
    return Navigator(
      key: navigasiKeys[aktifPage],
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => content[aktifPage],
          settings: settings,
          maintainState: true,
        );
      },
      reportsRouteUpdateToEngine: true,
      onPopPage: (route, result) => route == content[aktifPage]
          ? route.navigator!.canPop()
          : route.currentResult,
    );
  }

  void tapDipilih(int tapIndex) {
    setState(() {
      aktifPage = tapIndex;
    });
  }
}
