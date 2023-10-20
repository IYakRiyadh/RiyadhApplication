import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app_gojek/component/myWideget.dart';

class MainMenuGojek extends StatefulWidget {
  const MainMenuGojek({super.key});

  @override
  State<MainMenuGojek> createState() => _MainMenuGojekState();
}

class _MainMenuGojekState extends State<MainMenuGojek> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: GridView.builder(
        itemCount: iconMenu.length,
        physics: const BouncingScrollPhysics(),
        dragStartBehavior: DragStartBehavior.down,
        padding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 15,
            crossAxisSpacing: 25,
            childAspectRatio: 2 / 3),
        itemBuilder: (context, index) {
          return MaterialButton(
            padding: EdgeInsets.zero,
            child: Center(
              child: Column(
                children: [
                  Image.asset('${iconMenu[index]}'),
                  const SizedBox(height: 4.0),
                  Text(
                    '${lebelMenu[index]}',
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            onPressed: () {},
          );
        },
      ),
    );
  }
}
