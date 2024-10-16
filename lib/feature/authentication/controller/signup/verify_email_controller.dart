import 'dart:async';

import 'package:app_my_pham/common/widgets/loaders.dart';
import 'package:app_my_pham/data/repositories/authentication/authentication_repository.dart';
import 'package:app_my_pham/feature/authentication/screens/sign_up/verify_done.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  void sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      MPLoaders.successSnackBar(
          title: 'Email sent', message: 'Please check and verify your email');
    } catch (e) {
      MPLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;
      if (user!.emailVerified) {
        timer.cancel();
        Get.off(() => VerifyDoneScreen(//xóa màn hình verify ra khỏi stack, chuyển hướng sang done
              onPressed: () =>
                  AuthenticationRepository.instance.screenRedirect(),
            ));
      }
    });
  }
  checkEmailVerificationStatus()async{
    final user = FirebaseAuth.instance.currentUser;
    if(user!= null && user.emailVerified){
      Get.off(() => VerifyDoneScreen(//xóa màn hình verify ra khỏi stack, chuyển hướng sang done
        onPressed: () =>
            AuthenticationRepository.instance.screenRedirect(),
      ));
    }
  }
}
