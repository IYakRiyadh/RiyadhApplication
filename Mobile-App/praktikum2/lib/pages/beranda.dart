import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:praktikum2/component/notifList.dart';
import 'package:praktikum2/component/riwayat.dart';
import 'package:praktikum2/component/slideMenu.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  @override
  Widget build(BuildContext context) {
    final warna = <Color>[Colors.transparent, Colors.deepPurple.shade300];
    var ukuran = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 15),
        child: Column(children: [
          Stack(children: [
            Container(
              width: ukuran.width,
              height: 200,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
                color: Colors.deepPurple,
              ),
              child: Stack(fit: StackFit.loose, children: [
                const Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Image(
                    alignment: Alignment.centerRight,
                    image: AssetImage('assets/images/blob/blob1.png'),
                  ),
                ),
                Align(
                  heightFactor: ukuran.height,
                  alignment: Alignment.topLeft,
                  child: Container(
                    alignment: Alignment.topLeft,
                    height: ukuran.height,
                    child: const Image(
                      alignment: Alignment.centerRight,
                      image: AssetImage('assets/images/blob/blob3.png'),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: ukuran.width,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      ),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        tileMode: TileMode.clamp,
                        colors: warna,
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            ButtonBar(
                buttonHeight: 10,
                alignment: MainAxisAlignment.spaceBetween,
                buttonPadding: const EdgeInsets.only(left: 20, right: 20),
                children: [
                  Row(children: const [
                    CircleAvatar(
                      maxRadius: 20,
                      backgroundColor: Colors.purple,
                      child: Image(
                        alignment: Alignment.center,
                        image: AssetImage('assets/images/avatar/avatar.png'),
                        width: 30,
                        height: 30,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Text(
                        'Hi Rendy!',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(2, 5),
                                color: Color.fromRGBO(0, 0, 0, 0.4),
                                blurRadius: 5,
                              ),
                            ]),
                      ),
                    ),
                  ]),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      icon: const Icon(Icons.notifications_outlined,
                          color: Colors.white,
                          size: 30,
                          shadows: [
                            Shadow(
                              color: Color.fromRGBO(0, 0, 0, 0.7),
                              offset: Offset(2, 5),
                              blurRadius: 5,
                            ),
                          ]),
                      tooltip: 'Notif',
                      onPressed: () {
                        showDialog(
                          barrierLabel: 'Notif',
                          context: context,
                          builder: (context) => Dialog(
                            child: Stack(children: [
                              Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                          top: 12,
                                          bottom: 16,
                                        ),
                                        decoration: const BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                                width: 1,
                                                color: Colors.deepPurple),
                                          ),
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                              color: Colors.black38,
                                              offset: Offset(0, 4),
                                              blurRadius: 10,
                                              blurStyle: BlurStyle.outer,
                                            ),
                                          ],
                                          color: Colors.white,
                                        ),
                                        child: const Text(
                                          'Notif',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w900,
                                            fontSize: 18,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ]),
                              Padding(
                                padding: const EdgeInsets.only(top: 60),
                                child: Container(
                                  width: ukuran.width,
                                  height: ukuran.height,
                                  child: const NotifList(),
                                ),
                              ),
                            ]),
                          ),
                        );
                      },
                    ),
                  ),
                ]),
            Container(
              height: 150,
              alignment: AlignmentDirectional.bottomStart,
              padding: const EdgeInsets.only(left: 25),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: const Text(
                    'Saldo saat ini!',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  alignment: AlignmentDirectional.centerStart,
                  child: const Text(
                    'IDR 48.000.000',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w900,
                        color: Colors.white),
                    textAlign: TextAlign.left,
                  ),
                ),
              ]),
            ),
          ]),
          Container(
            height: 180,
            child: const SlideMenu(),
          ),
          const SizedBox(height: 30),
          Container(
            margin: const EdgeInsets.only(left: 25),
            alignment: Alignment.centerLeft,
            child: const Text('Transaksi Terakhir',
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
          ),
          const Padding(padding: EdgeInsets.all(4)),
          Container(
            padding: const EdgeInsets.only(left: 10, right: 10),
            height: 300,
            child: const Riwayat(),
          ),
        ]),
      ),
    );
  }
}
