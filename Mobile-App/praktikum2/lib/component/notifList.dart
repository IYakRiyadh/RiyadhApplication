import 'package:flutter/material.dart';

class NotifList extends StatefulWidget {
  const NotifList({super.key});

  @override
  State<NotifList> createState() => _NotifListState();
}

class _NotifListState extends State<NotifList> {
  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size;
    return ListView.builder(
      padding: const EdgeInsets.only(top: 15, bottom: 10),
      itemCount: 15,
      itemBuilder: (context, int index) {
        return ListBody(
          children: [
            Container(
              alignment: Alignment.center,
              width: widthSize.width,
              height: 50,
              padding: const EdgeInsets.only(left: 5, right: 5),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1, color: Colors.black38),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        alignment: Alignment.center,
                        child: Image.asset(
                          'assets/images/avatar/avatar.png',
                          fit: BoxFit.cover,
                          alignment: Alignment.center,
                        ),
                      ),
                      Container(
                        width: 125,
                        child: const Text(
                            'If the [style] argument is null, the text will use the style from the closest enclosing [DefaultTextStyle].',
                            overflow: TextOverflow.ellipsis,
                            textWidthBasis: TextWidthBasis.parent,
                            style: TextStyle(
                                fontSize: 11, overflow: TextOverflow.ellipsis)),
                      ),
                    ],
                  ),
                  Text(
                    '15 yg lalu',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
