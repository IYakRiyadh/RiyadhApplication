import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SlideEvent extends StatefulWidget {
  const SlideEvent({super.key});

  @override
  State<SlideEvent> createState() => _SlideEventState();
}

class _SlideEventState extends State<SlideEvent> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 4,
      itemBuilder: (context, index, realIndex) {
        return MaterialButton(
          onPressed: () {},
        );
      },
      options: CarouselOptions(),
    );
  }
}
