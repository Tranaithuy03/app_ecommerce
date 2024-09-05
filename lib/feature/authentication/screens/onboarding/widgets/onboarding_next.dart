import 'package:flutter/material.dart';

import '../../../controller.onboarding/onboarding_controller.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: kBottomNavigationBarHeight + 25,
        right: 12.0,
        child: ElevatedButton(
            onPressed: () => OnboardingController.instance.next(),
            style: ElevatedButton.styleFrom(
                shape: const CircleBorder(), backgroundColor: Colors.black),
            child: const Icon(Icons.keyboard_arrow_right_sharp)));
  }
}
