import 'package:flutter/material.dart';

class LinkItems extends StatefulWidget {
  const LinkItems({super.key});

  @override
  State<LinkItems> createState() => _LinkItemsState();
}

class _LinkItemsState extends State<LinkItems> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: ScrollPhysics(),
      scrollDirection: Axis.horizontal,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {},
          hoverColor: Colors.lightBlue[100],
          splashColor: Colors.blue[300],
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(225, 245, 254, 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              'Available',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {},
          hoverColor: Colors.lightBlue[100],
          splashColor: Colors.blue[300],
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(225, 245, 254, 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              'Fast Food',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(width: 20),
        InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {},
          hoverColor: Colors.lightBlue[100],
          splashColor: Colors.blue[300],
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(225, 245, 254, 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              'Drinks',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(width: 20),
        InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {},
          hoverColor: Colors.lightBlue[100],
          splashColor: Colors.blue[300],
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(225, 245, 254, 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              'Cake',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(width: 20),
        InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {},
          hoverColor: Colors.lightBlue[100],
          splashColor: Colors.blue[300],
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(225, 245, 254, 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              'Ice Cream',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(width: 20),
        InkWell(
          borderRadius: BorderRadius.circular(5),
          onTap: () {},
          hoverColor: Colors.lightBlue[100],
          splashColor: Colors.blue[300],
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(225, 245, 254, 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            child: const Text(
              'Seafoods',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
