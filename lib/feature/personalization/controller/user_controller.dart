import 'package:app_my_pham/common/widgets/loaders.dart';
import 'package:app_my_pham/data/repositories/user/user_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/user_model.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userReposity = Get.put(UserRepository());
  ///lưu thông tin user từ bất kì registration provider
  Future<void> saveUserRecord(UserCredential userCredential) async{
    try {
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
        await userReposity.saveUserRecord(user);
      }
    } catch (e) {
      MPLoaders.warningSnackBar(
          title: 'Data not save',
          message:
              'Something went wrong while saving your information. You can re-save your data in your profile');
    }
  }
}
