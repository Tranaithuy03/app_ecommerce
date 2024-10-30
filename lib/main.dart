import 'package:app_my_pham/bindings/general_binding.dart';
import 'package:app_my_pham/feature/authentication/screens/onboarding/onboarding.dart';
import 'package:app_my_pham/routes/app_routes.dart';
import 'package:app_my_pham/utils/theme/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'data/repositories/authentication/authentication_repository.dart';
import 'firebase_options.dart';

Future<void> main() async {
  //đảm bảo rằng Flutter đã được khởi động hoàn toàn
  // trước khi thực hiện các thao tác khởi tạo (như Firebase)
  final WidgetsBinding binding = WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  //hiển thị splash
  FlutterNativeSplash.preserve(widgetsBinding: binding);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: GeneralBinding(),
      theme: MPAppTheme.lightTheme,
      darkTheme: MPAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      getPages: AppRoute.pages,
      home: const OnboardingScreen(),
    );
  }
}
