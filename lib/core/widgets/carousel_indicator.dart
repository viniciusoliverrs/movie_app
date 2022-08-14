// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CarouselIndicator extends StatelessWidget {
  final int currentView;
  final int totalViews;
  final PageController controller;
  const CarouselIndicator({
    Key? key,
    required this.currentView,
    required this.totalViews,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      //children: _indicators(currentView, totalViews),
      children: [
        for (int i = 0; i < totalViews; i++)
          GestureDetector(
            onTap: () => controller.jumpToPage(i),
            child: Container(
              width: 10,
              height: 10,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentView == i ? Colors.blue : Colors.grey,
              ),
            ),
          ),
      ],
    );
  }

  // List<Widget> _indicators(imagesLength, currentIndex) {
  //   return List<Widget>.generate(imagesLength + 1, (index) {
  //     return Container(
  //       margin: const EdgeInsets.all(3),
  //       width: 10,
  //       height: 10,
  //       decoration: BoxDecoration(
  //           color:  Colors.purple,
  //           shape: BoxShape.circle),
  //     );
  //   });
  // }
}
