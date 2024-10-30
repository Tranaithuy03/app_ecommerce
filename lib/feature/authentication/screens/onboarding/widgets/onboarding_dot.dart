import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class OnboardingDot extends StatelessWidget {
  const OnboardingDot({
    super.key, this.controller,this.isBanner=false, this.count=3
  });
  final controller;
  final bool isBanner;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: kBottomNavigationBarHeight + 25,
        left: 16.0,
        child: isBanner? Obx(() => SmoothPageIndicator(
            controller: PageController(initialPage: controller.currentCarouselIndex.value),
            count: count,
            effect: const ExpandingDotsEffect(
              activeDotColor: Color(0xff232323),
              dotHeight: 6,
            )
        )):SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: count,
          effect: const ExpandingDotsEffect(
              activeDotColor: Color(0xff232323), dotHeight: 6),
        ));
  }
}