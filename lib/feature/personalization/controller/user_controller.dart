import 'package:app_my_pham/common/widgets/loaders.dart';
import 'package:app_my_pham/data/repositories/authentication/authentication_repository.dart';
import 'package:app_my_pham/data/repositories/user/user_repository.dart';
import 'package:app_my_pham/feature/authentication/screens/login/login.dart';
import 'package:app_my_pham/feature/personalization/screens/profile/widgets/re_auth_user.dart';
import 'package:app_my_pham/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../utils/helpers/network_manager.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepository = Get.put(UserRepository());
  Rx<UserModel> user = UserModel.empty().obs;
  final imageLoading = false.obs;
  final verifyEmail =TextEditingController();
  final verifyPassword =TextEditingController();
  final hidePassword = false.obs;
  GlobalKey<FormState>reAuthFormKey = GlobalKey();
  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }
  Future<void> fetchUserRecord()async{
    try{
      final userModel = await userRepository.fetchUserData();
      user(userModel);
    }catch(e){
      user(UserModel.empty());
    }
  }
  ///lưu thông tin user từ bất kì registration provider
  Future<void> saveUserRecord(UserCredential userCredential) async{
    try {
      ///refresh userRecord
      await fetchUserRecord();
      ///nếu không có record nào đã lưu
      if(user.value.id.isEmpty){
        if (userCredential != null) {
          final nameParts =
          UserModel.nameParts(userCredential.user!.displayName ?? '');
          final fullName =
          UserModel.generateUserName(userCredential.user!.displayName ?? '');
          //map
          final user = UserModel(
              id: userCredential.user!.uid,
              firstName: nameParts[0],
              lastName: nameParts.length > 1 ? nameParts[1] : '',
              username: fullName,
              email: userCredential.user?.email ?? '',
              phoneNumber: userCredential.user?.phoneNumber ?? '',
              profilePicture: userCredential.user?.photoURL ?? '');
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      MPLoaders.warningSnackBar(
          title: 'Data not save',
          message:
              'Something went wrong while saving your information. You can re-save your data in your profile');
    }
  }
  void deleteAccountWarningPopup(){
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(8.0),
      title: 'Delete Account',
      middleText: 'Are you sure that you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently',
      confirm: ElevatedButton(onPressed: () async =>deleteUserAccount(),
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red, side: const BorderSide(color: Colors.red)),
        child: const Padding(padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(onPressed: ()=> Navigator.of(Get.overlayContext!).pop(), child: const Text('Cancle'))
    );
  }
  void deleteUserAccount() async{
    try{
      MPFullScreenLoader.openLoadingDialog('Processing', 'assets/animations/animation_wait.json');
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!.providerData.map((e) => e.providerId).first;
      if(provider.isNotEmpty){
        if(provider=='google.com')
          {
            await auth.signInWithGoogle();
            await auth.deleteAccount();
            MPFullScreenLoader.stopLoading();
            Get.offAll(()=>const LoginScreen());
          }
        else if(provider =='password'){
          MPFullScreenLoader.stopLoading();
          Get.to(()=>const ReAuthLoginForm());
        }
      }
    }catch(e){
      MPFullScreenLoader.stopLoading();
      MPLoaders.errorSnackBar(title: 'Oh Snap!',message: e.toString());
    }
  }
  Future<void> reAuthenticateEmailAndPassword() async {
    try {
      MPFullScreenLoader.openLoadingDialog(
          'Processing...',
          'assets/animations/animation_wait.json');
      //kiểm tra kết nối internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        MPFullScreenLoader.stopLoading();
        return;
      }
      if (!reAuthFormKey.currentState!.validate()) {
        MPFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance.reAuthenticateEmailAndPassword(
          verifyEmail.text.trim(), verifyPassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      MPFullScreenLoader.stopLoading();
      Get.offAll(()=>const LoginScreen());
    } catch (e) {
      MPLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
      MPFullScreenLoader.stopLoading();
    }
  }
   uploadUserProfilePicture() async{
    try{
      final image = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality:70, maxWidth: 512,maxHeight: 512 );
      if(image != null){
        imageLoading.value=true;
        final imageUrl = await userRepository.uploadImage('Users/Images/Profile/', image);
        ///update user image records
        Map<String,dynamic> json = {'ProfilePicture':imageUrl};
        await userRepository.updateSingleField(json);
        user.value.profilePicture = imageUrl;
        user.refresh();

        MPLoaders.successSnackBar(title: 'Congratulation',message: 'Your profile Image has been updated');
      }
    }catch(e){
      MPLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
    finally{
      imageLoading.value=false;
    }
  }
}
