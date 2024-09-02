import 'package:flutter/material.dart';

import '../../controller.onboarding/onboarding_controller.dart';
class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: kToolbarHeight,
        right: 12.0,
        child: TextButton(
            onPressed: () => OnboardingController.instance.skip(),
            child: const Text(
              'Skip',
            )));
  }
}
