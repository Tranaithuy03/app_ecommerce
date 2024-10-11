import 'package:app_my_pham/data/repositories/authentication/authentication_repository.dart';
import 'package:app_my_pham/feature/personalization/controller/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../common/widgets/loaders.dart';
import '../../../../utils/helpers/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();
  GlobalKey<FormState> signInFormKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final localStorage=GetStorage();
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final userController = Get.put(UserController());

  @override
  void onInit() {
    email.text= localStorage.read('REMEMBER_ME_EMAIL')??'';
    password.text =localStorage.read('REMEMBER_ME_PASSWORD')??'';
    super.onInit();
  } //sign in = email
  Future<void> emailAndPasswordSignIn()async{
    try{
      MPFullScreenLoader.openLoadingDialog(
          'Logging you in...',
          'assets/animations/animation_wait.json');
      //kiểm tra kết nối internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MPFullScreenLoader.stopLoading();
        return;
      }
      //check form
      if (!signInFormKey.currentState!.validate()) {
        MPFullScreenLoader.stopLoading();
        return;
      }
      if(rememberMe.value){
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      final userCredential = await AuthenticationRepository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      MPFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      MPLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      MPFullScreenLoader.stopLoading();

    }
  }
  Future<void> googleSignIn()async{
    try{
      MPFullScreenLoader.openLoadingDialog(
          'Logging you in...',
          'assets/animations/animation_wait.json');
      //kiểm tra kết nối internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MPFullScreenLoader.stopLoading();
        return;
      }

      final userCredential = await AuthenticationRepository.instance.signInWithGoogle();

      await userController.saveUserRecord(userCredential);

      MPFullScreenLoader.stopLoading();
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      MPLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      MPFullScreenLoader.stopLoading();

    }
  }
}