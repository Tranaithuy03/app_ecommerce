import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/loaders.dart';
import '../../../../data/repositories/authentication/authentication_repository.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';
import '../../screens/Password_configuration/noti_password.dart';

class ForgetPasswordController extends GetxController{
  static ForgetPasswordController get instance => Get.find();
  final email = TextEditingController();
  GlobalKey<FormState> forgetFormKey = GlobalKey<FormState>();
  sendPasswordResetEmail()async{
    try{
      MPFullScreenLoader.openLoadingDialog(
          'Processing your request...',
          'assets/animations/animation_wait.json');
      //kiểm tra kết nối internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MPFullScreenLoader.stopLoading();
        return;
      }
      //check form
      if (!forgetFormKey.currentState!.validate()) {
        MPFullScreenLoader.stopLoading();
        return;
      }
      MPFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.sendPasswordResetEmail(email.text.trim());
      MPLoaders.successSnackBar(title: 'Email sent', message: 'Email link sent to reset your password'.tr);
      Get.to(()=> NotiPasswordScreen(email: email.text.trim(),));
    } catch (e) {
      MPLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      MPFullScreenLoader.stopLoading();

    }
  }
  resendPasswordResetEmail(String email)async{
    try{
      MPFullScreenLoader.openLoadingDialog(
          'Processing your request...',
          'assets/animations/animation_wait.json');
      //kiểm tra kết nối internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MPFullScreenLoader.stopLoading();
        return;
      }
      MPFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.sendPasswordResetEmail(email);
      MPLoaders.successSnackBar(title: 'Email sent', message: 'Email link sent to reset your password'.tr);
    } catch (e) {
      MPLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      MPFullScreenLoader.stopLoading();

    }
  }
}