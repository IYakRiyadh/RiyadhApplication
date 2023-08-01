import 'package:flutter/material.dart';
import 'package:praktikum1/pages/Home.dart';

class Katagori extends StatefulWidget {
  const Katagori({super.key});

  @override
  State<Katagori> createState() => _KatagoriState();
}

class _KatagoriState extends State<Katagori> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(left: 15, right: 15),
      physics: BouncingScrollPhysics(
        parent: const AlwaysScrollableScrollPhysics().parent,
      ),
      scrollDirection: Axis.horizontal,
      children: [
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.amber[100],
              ),
              child: const Image(
                width: 50,
                image: AssetImage('assets/images/icons/kategori/fastfood.png'),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: 75,
              decoration: BoxDecoration(
                color: Colors.amber[50],
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                'Fast Foods',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                selectionColor: Color.fromRGBO(117, 117, 117, 1),
              ),
            ),
          ],
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.purpleAccent[100],
              ),
              child: const Image(
                width: 50,
                image: AssetImage('assets/images/icons/kategori/drinks.png'),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: 75,
              decoration: BoxDecoration(
                color: Colors.purple[50],
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                'Drinks',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                selectionColor: Color.fromRGBO(117, 117, 117, 1),
              ),
            ),
          ],
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.yellowAccent[100],
              ),
              child: const Image(
                width: 50,
                image: AssetImage('assets/images/icons/kategori/dessert.png'),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: 75,
              decoration: BoxDecoration(
                color: Colors.yellow[50],
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                'Desserts',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                selectionColor: Color.fromRGBO(117, 117, 117, 1),
              ),
            ),
          ],
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.greenAccent[100],
              ),
              child: const Image(
                width: 50,
                image: AssetImage('assets/images/icons/kategori/seafood.png'),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: 75,
              decoration: BoxDecoration(
                color: Colors.lightGreen[50],
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                'Seafoods',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                selectionColor: Color.fromRGBO(117, 117, 117, 1),
              ),
            ),
          ],
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.blueAccent[100],
              ),
              child: const Image(
                width: 50,
                image: AssetImage('assets/images/icons/kategori/meat.png'),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: 75,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                'Meats',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                selectionColor: Color.fromRGBO(117, 117, 117, 1),
              ),
            ),
          ],
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.cyanAccent[100],
              ),
              child: const Image(
                width: 50,
                image: AssetImage('assets/images/icons/kategori/dishets.png'),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: 75,
              decoration: BoxDecoration(
                color: Colors.cyan[50],
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                'Dishes',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                selectionColor: Color.fromRGBO(117, 117, 117, 1),
              ),
            ),
          ],
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.pinkAccent[100],
              ),
              child: const Image(
                width: 50,
                image: AssetImage('assets/images/icons/kategori/pastry.png'),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: 75,
              decoration: BoxDecoration(
                color: Colors.pink[50],
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                'Pastry',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                selectionColor: Color.fromRGBO(117, 117, 117, 1),
              ),
            ),
          ],
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            Container(
              padding: const EdgeInsets.all(5),
              width: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.redAccent[100],
              ),
              child: const Image(
                width: 50,
                fit: BoxFit.cover,
                image: AssetImage('assets/images/icons/kategori/fruits.png'),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(5),
              width: 75,
              decoration: BoxDecoration(
                color: Colors.red[50],
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Text(
                'Fruits',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
                selectionColor: Color.fromRGBO(117, 117, 117, 1),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
