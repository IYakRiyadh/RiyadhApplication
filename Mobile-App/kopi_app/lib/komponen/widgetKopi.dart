import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kopi_app/komponen/komponenKopi.dart';

class BtnGoogle extends StatelessWidget {
  const BtnGoogle({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return ClipRRect(
      child: SizedBox(
        width: size.width - 150.0,
        child: Stack(
          // direction: Axis.horizontal,
          children: [
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                child: Text(
                  'Google',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.0,
                    color: Colors.lime.shade900,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                child: Image.asset(
                  'assets/img/icons/icon1.png',
                  height: 25.0,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DividerKopi extends StatelessWidget {
  const DividerKopi({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Flex(
        direction: Axis.horizontal,
        children: [
          Expanded(
            child: Divider(
              color: Colors.lime.shade800,
              height: 10.0,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text('Atau'),
          ),
          Expanded(
            child: Divider(
              color: Colors.lime.shade800,
              height: 5.0,
            ),
          ),
        ],
      ),
    );
  }
}

class UserAvatar extends StatefulWidget {
  const UserAvatar({super.key});

  @override
  State<UserAvatar> createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  User? user;

  @override
  void initState() {
    user = authKopi.currentUser;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
        stream: cloud_db.collection('users').doc(user!.uid).get().asStream(),
        builder: (context, snapshot) {
          Map<String, dynamic>? dataUser;
          if (snapshot.hasError) {
            return const Center(
              child: Text('Loading..'),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.lime.shade900,
              ),
            );
          }
          if (snapshot.hasData) {
            dataUser = snapshot.data!.data()!;
          }
          RegExp exp = RegExp(r'(\w+)');
          Iterable<Match> matches = exp.allMatches(dataUser!['nama'], 0);
          String? match;
          for (final Match m in matches) {
            match = m.input;
            print(match);
          }

          return ClipRRect(
            child: SizedBox(
              height: 125.0,
              width: 125.0,
              // color: Colors.red,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  SizedBox.expand(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2.0, color: Colors.lime.shade800),
                          borderRadius: BorderRadius.circular(100.0)),
                      child: dataUser['fotoProfil'] == ''
                          ? CircleAvatar(
                              radius: 100,
                              backgroundColor: Colors.limeAccent,
                              // backgroundImage:
                              //     AssetImage('assets/img/icons/img.jpeg'),
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(text: match![0].toUpperCase()),
                                    TextSpan(text: match[1].toUpperCase())
                                  ],
                                ),
                                style: TextStyle(
                                    fontSize: 40.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.lime.shade900),
                              ),
                            )
                          : CircleAvatar(
                              radius: 100,
                              backgroundColor: Colors.lime,
                              backgroundImage:
                                  NetworkImage('${dataUser['fotoProfil']}'),
                            ),
                    ),
                  ),
                  Positioned(
                    // bottom: -5.0,
                    child: GestureDetector(
                      child: Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Container(
                          height: 40,
                          width: 40,
                          alignment: AlignmentDirectional.center,
                          // padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            // color: Colors.red,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: [
                              BoxShadow(
                                offset: Offset.zero,
                                blurRadius: 8.0,
                                blurStyle: BlurStyle.normal,
                                color: Colors.black.withOpacity(0.25),
                              ),
                            ],
                          ),
                          child: const FaIcon(
                            Icons.photo_camera_outlined,
                            size: 30.0,
                            color: Colors.limeAccent,
                          ),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
