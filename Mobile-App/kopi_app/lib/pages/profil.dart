// ignore_for_file: deprecated_member_use, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:kopi_app/komponen/komponenKopi.dart';
import 'package:kopi_app/komponen/widgetKopi.dart';
import 'package:kopi_app/pages/views/infoTransaksi.dart';
import 'package:kopi_app/service/userAuth.dart';

class ProfilSaya extends StatefulWidget {
  const ProfilSaya({super.key});

  @override
  State<ProfilSaya> createState() => _ProfilSayaState();
}

class _ProfilSayaState extends State<ProfilSaya> {
  final auth = Get.put(UserAuthKopi());

  User? user;
  String? userId;

  @override
  void initState() {
    user = authKopi.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'.toUpperCase()),
        centerTitle: true,
        backgroundColor: Colors.lime.shade600,
      ),
      body: SingleChildScrollView(
        child: ClipRRect(
          child: Padding(
            padding: const EdgeInsets.only(
                top: 10.0, left: 15.0, bottom: 10.0, right: 15.0),
            child: Flex(
              direction: Axis.vertical,
              children: [
                ClipRRect(
                  child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                      stream: cloud_db
                          .collection('users')
                          .doc(user!.uid)
                          .get()
                          .asStream(),
                      builder: (context, snapshot) {
                        Map<String, dynamic>? dataUser;
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text('Loading..'),
                          );
                        } else if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.lime.shade900,
                            ),
                          );
                        }
                        if (snapshot.hasData) {
                          dataUser = snapshot.data!.data()!;
                        }
                        return Card(
                          color: Colors.lime.shade500,
                          child: SizedBox(
                            height: 180.0,
                            width: size.width,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Stack(
                                // direction: Axis.horizontal,
                                children: [
                                  Positioned(
                                    left: 10.0,
                                    top: 20.0,
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      // margin: const EdgeInsets.only(top: 20.0),
                                      child: const UserAvatar(),
                                    ),
                                  ),
                                  SizedBox.expand(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 10.0, right: 10.0),
                                      child: Flex(
                                        direction: Axis.vertical,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        clipBehavior:
                                            Clip.antiAliasWithSaveLayer,
                                        children: [
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${dataUser!['nama']}'
                                                  .capitalize
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.lime.shade900,
                                                fontSize: 18.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 8.0),
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: Text(
                                              '${dataUser['email']}'
                                                  .capitalizeFirst
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.lime.shade900,
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 10.0,
                                    child: GestureDetector(
                                      child: Container(
                                        width: 50.0,
                                        height: 40.0,
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.all(5.0),
                                        decoration: BoxDecoration(
                                          color: Colors.lime[200],
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          boxShadow: const <BoxShadow>[
                                            BoxShadow(
                                              blurRadius: 10.0,
                                              offset: Offset(2.0, 4.0),
                                              blurStyle: BlurStyle.inner,
                                              // spreadRadius: 10.0,
                                            ),
                                          ],
                                        ),
                                        // ignore: deprecated_member_use
                                        child: const FaIcon(
                                            FontAwesomeIcons.signOutAlt),
                                      ),
                                      onTap: () => auth.keluar(),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(height: 10.0),
                InfoTransaksi(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
