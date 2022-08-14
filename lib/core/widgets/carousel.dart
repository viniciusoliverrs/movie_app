// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'carousel_indicator.dart';
import 'carousel_item.dart';

class Carousel extends StatefulWidget {
  final List<String> images;
  late PageController pageController;
  Carousel({
    Key? key,
    required this.images,
    required this.pageController,
  }) : super(key: key);

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {
  int currentView = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 300,
          child: PageView.builder(
            itemCount: widget.images.length,
            controller: widget.pageController,
            scrollBehavior: const ScrollBehavior(),
            onPageChanged: (page) => setState(() => currentView = page),
            itemBuilder: (_, index) {
              return CarouselItem(
                imageUrl: widget.images[index],
                active: (index == currentView),
              );
            },
          ),
        ),
        CarouselIndicator(
          controller: widget.pageController,
          currentView: currentView,
          totalViews: widget.images.length,
        ),
      ],
    );
  }
}
