import 'package:app_my_pham/feature/authentication/screens/onboarding.dart';
import 'package:app_my_pham/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: MPAppTheme.lightTheme,
      darkTheme: MPAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const OnboardingScreen(),
    );
  }
}