import 'package:flutter/material.dart';

class MyKopi extends StatefulWidget {
  const MyKopi({super.key});

  @override
  State<MyKopi> createState() => _MyKopiState();
}

class _MyKopiState extends State<MyKopi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaksi'.toUpperCase()),
        centerTitle: true,
        backgroundColor: Colors.lime.shade600,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.zero,
          child: const Text('data'),
        ),
      ),
    );
  }
}
