
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../core/utils/constants.dart';

class CustomSmoothPageIndicator extends StatelessWidget {
  const CustomSmoothPageIndicator({
    super.key,
    required this.controller, required this.height, required this.count,
  });

  final PageController controller;
  final double height;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SmoothPageIndicator(
          effect:  WormEffect(
            dotHeight: height,
            spacing: 5,
            radius: 50,
            activeDotColor: kPrimaryColor,
            dotColor: Colors.grey,
          ),
          controller: controller,
          count: count),
    );
  }
}
