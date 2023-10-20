import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kopi_app/pages/views/menuKopi.dart';
import 'package:kopi_app/pages/views/wallet.dart';

class BerandaApp extends StatefulWidget {
  const BerandaApp({super.key});

  @override
  State<BerandaApp> createState() => _BerandaAppState();
}

class _BerandaAppState extends State<BerandaApp> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ClipRRect(
            child: Flex(
              direction: Axis.vertical,
              children: [
                ClipRRect(
                  child: Stack(
                    children: [
                      Container(
                        height: 240.0,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: Colors.lime[800],
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          ),
                        ),
                        child: Flex(
                          direction: Axis.vertical,
                          children: [
                            Align(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 15.0, left: 15.0, right: 15.0),
                                child: Flex(
                                  direction: Axis.horizontal,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const SizedBox(
                                      child: FaIcon(
                                        FontAwesomeIcons.mugHot,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      child: Text(
                                        'Kopi Ku'.toUpperCase(),
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w800,
                                          letterSpacing: 1.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      child: GestureDetector(
                                        child: const FaIcon(
                                          FontAwesomeIcons.ellipsisVertical,
                                          color: Colors.white,
                                        ),
                                        onTap: () {},
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            const WalletKu(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20.0),
                ClipRRect(
                  child: Flex(
                    direction: Axis.vertical,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: const EdgeInsets.only(left: 25.0, right: 25.0),
                        padding: const EdgeInsets.only(left: 5.0, bottom: 2.0),
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.lime.shade800))),
                        child: Text(
                          'Menu Kopi',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.lime.shade800,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.8,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 135.0,
                        child: MenuKopi(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
