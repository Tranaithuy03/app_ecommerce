import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../controller.onboarding/onboarding_controller.dart';


class OnboardingDot extends StatelessWidget {
  const OnboardingDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Positioned(
        bottom: kBottomNavigationBarHeight + 25,
        left: 16.0,
        child: SmoothPageIndicator(
          controller: controller.pageController,
          onDotClicked: controller.dotNavigationClick,
          count: 3,
          effect: const ExpandingDotsEffect(
              activeDotColor: Color(0xff232323), dotHeight: 6),
        ));
  }
}