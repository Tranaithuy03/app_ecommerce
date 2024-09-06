import 'package:app_my_pham/feature/authentication/screens/onboarding/widgets/onboarding_dot.dart';
import 'package:app_my_pham/feature/authentication/screens/onboarding/widgets/onboarding_next.dart';
import 'package:app_my_pham/feature/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:app_my_pham/feature/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/onboarding/onboarding_controller.dart';



class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnboardingPage(
                image: 'assets/images/onboarding/onboarding_image2.gif',
                title: 'Choose your product',
                subtitle: 'Welcome to my app - The best app in the world',
              ),
              OnboardingPage(
                image: 'assets/images/onboarding/onboarding_image1.gif',
                title: 'Buy your favorite clothes',
                subtitle: 'Welcome to my app - The best app in the world',
              ),
              OnboardingPage(
                image: 'assets/images/onboarding/onboarding_image3.gif',
                title: 'Free ship all the world',
                subtitle: 'Welcome to my app - The best app in the world',
              ),
            ],
          ),
          const OnboardingSkip(),
          const OnboardingDot(),
          const OnboardingNextButton()
        ],
      ),
    );
  }
}





