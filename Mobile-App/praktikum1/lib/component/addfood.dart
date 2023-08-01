import 'dart:ui';

import 'package:flutter/material.dart';

class AddFood extends StatelessWidget {
  const AddFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: GridView.custom(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        childrenDelegate: SliverChildListDelegate(
          [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                  boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.solid,
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset.fromDirection(-2, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                      child: Image(
                        image: AssetImage('assets/images/food/img1.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: const Text(
                            'Seafood',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            'IDR 15.000',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          focusColor: Colors.black,
                          focusElevation: 0,
                          textColor: Colors.black,
                          textTheme: ButtonTextTheme.accent,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'Add',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                  boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.solid,
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset.fromDirection(-2, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                      child: Image(
                        image: AssetImage('assets/images/food/img5.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: const Text(
                            'Burger',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            'IDR 15.000',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          focusColor: Colors.black,
                          focusElevation: 0,
                          textColor: Colors.black,
                          textTheme: ButtonTextTheme.accent,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'Add',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                  boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.solid,
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset.fromDirection(-2, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                      child: Image(
                        image: AssetImage('assets/images/food/img4.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: const Text(
                            'paket murah',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            'IDR 15.000',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          focusColor: Colors.black,
                          focusElevation: 0,
                          textColor: Colors.black,
                          textTheme: ButtonTextTheme.accent,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'Add',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300],
                  boxShadow: [
                    BoxShadow(
                      blurStyle: BlurStyle.solid,
                      color: Colors.black12,
                      blurRadius: 5,
                      offset: Offset.fromDirection(-2, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 60,
                      child: Image(
                        image: AssetImage('assets/images/food/imgpizza.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          child: const Text(
                            'Pizza',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            'IDR 15.000',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          focusColor: Colors.black,
                          focusElevation: 0,
                          textColor: Colors.black,
                          textTheme: ButtonTextTheme.accent,
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'Add',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
