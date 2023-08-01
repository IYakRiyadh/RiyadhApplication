import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:praktikum1/component/addfood.dart';
import 'package:praktikum1/component/catagory.dart';
import 'package:praktikum1/pages/Home.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    final ukuran = MediaQuery.of(context).size;
    void backHome() {
      return Navigator.pop(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: backHome,
          color: Colors.black,
        ),
        title: const Text('Explore'),
        titleTextStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            padding: EdgeInsets.zero,
            margin: const EdgeInsets.only(right: 45, top: 15),
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              child: Image.asset(
                'assets/images/avatar.png',
                fit: BoxFit.cover,
                filterQuality: FilterQuality.high,
                width: 40,
                height: 40,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 30),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  hintText: 'Search',
                  suffixIcon: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(height: 30),
            Container(
              height: 125,
              child: const Katagori(),
            ),
            const SizedBox(height: 30),
            Container(
              height: ukuran.height,
              child: const AddFood(),
            ),
          ],
        ),
      ),
      floatingActionButton: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsetsDirectional.only(bottom: 10),
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Material(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black,
                child: const Icon(
                  Icons.store_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
