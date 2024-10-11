import 'package:app_my_pham/common/widgets/loaders.dart';
import 'package:app_my_pham/data/repositories/authentication/authentication_repository.dart';
import 'package:app_my_pham/data/repositories/user/user_repository.dart';
import 'package:app_my_pham/feature/authentication/screens/sign_up/verify_email.dart';
import 'package:app_my_pham/feature/personalization/models/user_model.dart';
import 'package:app_my_pham/utils/helpers/network_manager.dart';
import 'package:app_my_pham/utils/popups/full_screen_loader.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../shop/screen/home/home.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final phoneNumber = TextEditingController();
  final password = TextEditingController();
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;

  void signup() async {
    try {
      MPFullScreenLoader.openLoadingDialog(
          'We are processing your information...',
          'assets/animations/Animation_save_info.json');
      //kiểm tra kết nối internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MPFullScreenLoader.stopLoading();
        return;
      }
      //check form
      if (!signupFormKey.currentState!.validate()) {
        MPFullScreenLoader.stopLoading();
        return;
      }
      if(!privacyPolicy.value){
        MPLoaders.warningSnackBar(title: 'Accept privacy policy',message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use');
      }
      final user = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());
      final newUser = UserModel(
          id: user.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');
      final userRepository= Get.put(UserRepository());
      userRepository.saveUserRecord(newUser);

      MPFullScreenLoader.stopLoading();

      MPLoaders.successSnackBar(title: 'Congratulations',message: 'Your account has been created!...');

      Get.to(()=> VerifyEmailScreen(email: email.text.trim(),));

    } catch (e) {
      MPLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
