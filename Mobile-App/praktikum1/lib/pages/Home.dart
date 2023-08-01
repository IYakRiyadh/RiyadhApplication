import 'dart:io';

import 'package:flutter/material.dart';
import 'package:praktikum1/component/linkIrems.dart';
import 'package:praktikum1/component/foodMenu.dart';
import 'package:praktikum1/component/rekomendasi.dart';
import 'package:praktikum1/pages/Explore.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Container(
          margin: const EdgeInsets.only(left: 20),
          child: const Icon(
            Icons.dehaze_rounded,
            color: Colors.black,
          ),
        ),
        title: const Text('Home'),
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
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 30),
                child: const Text(
                  'Hungry?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 30),
                child: const Text(
                  'Order & Eat.',
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(height: 30),
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
                      suffixIcon: Icon(Icons.search)),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.only(left: 25),
                height: 30,
                child: const LinkItems(),
              ),
              const SizedBox(height: 30),
              Container(
                height: 150,
                child: const FoodItem(),
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.only(left: 30, bottom: 15),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'We Recommend',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 150,
                child: const Rekomendasi(),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: AlignmentDirectional.center,
            margin: EdgeInsetsDirectional.only(bottom: 10),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(5),
            ),
            child: MaterialButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const Explore(),
                  ),
                );
              },
              child: const Icon(
                Icons.grid_view_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
