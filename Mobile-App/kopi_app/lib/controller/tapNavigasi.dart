// import 'package:flutter/material.dart';
// import 'package:kopi_app/pages/beranda.dart';
// import 'package:kopi_app/pages/kopiSaya.dart';
// import 'package:kopi_app/pages/profil.dart';

// class TabNavigasi extends StatelessWidget {
//   final GlobalKey<NavigatorState> tabKeys;
//   final String inisialTab;
//   const TabNavigasi(
//       {required this.inisialTab, required this.tabKeys, super.key});

//   @override
//   Widget build(BuildContext context) {
//     Widget child;

//     if (inisialTab == '0') {
//       child = MyKopi();
//     } else if (inisialTab == '1') {
//       child = BerandaApp();
//     } else if (inisialTab == '2') {
//       child = ProfilSaya();
//     }

//     return Navigator(
//       key: tabKeys,
//       // initialRoute: inisialPage,
//       onGenerateRoute: (settings) {
//         return MaterialPageRoute(
//           builder: (context) => ,
//         );
//       },
//       onPopPage: (route, result) => route.didPop(result),
//     );
//   }
// }
