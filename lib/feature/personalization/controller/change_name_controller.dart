import 'package:app_my_pham/data/repositories/user/user_repository.dart';
import 'package:app_my_pham/feature/personalization/controller/user_controller.dart';
import 'package:app_my_pham/feature/personalization/screens/profile/profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../common/widgets/loaders.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/popups/full_screen_loader.dart';

class ChangeNameController extends GetxController{
  static ChangeNameController get instance => Get.find();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> changeNameFormKey = GlobalKey();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    initializeName();
  }

  Future<void> initializeName() async{
    firstName.text= userController.user.value.firstName;
    lastName.text= userController.user.value.lastName;
  }

  Future<void> uploadUserName()async{
    try{
      MPFullScreenLoader.openLoadingDialog(
          'Update your name...',
          'assets/animations/animation_wait.json');
      //kiểm tra kết nối internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MPFullScreenLoader.stopLoading();
        return;
      }
      //check form
      if (!changeNameFormKey.currentState!.validate()) {
        MPFullScreenLoader.stopLoading();
        return;
      }

      Map<String,dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userRepository.updateSingleField(name);
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();
      userController.user.refresh();
      MPFullScreenLoader.stopLoading();
      MPLoaders.successSnackBar(title: 'Congratulation',message: 'Your name has been updated');
      Get.off(()=>const ProfileScreen());
    } catch (e) {
      MPLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      MPFullScreenLoader.stopLoading();

    }
  }
}