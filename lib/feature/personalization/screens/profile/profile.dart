import 'package:app_my_pham/feature/personalization/screens/profile/widgets/change_name.dart';
import 'package:app_my_pham/feature/personalization/screens/profile/widgets/re_auth_user.dart';
import 'package:app_my_pham/feature/personalization/screens/settings/setting.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/appbar.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/heading_section.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/image_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../controller/user_controller.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return  Scaffold(
      appBar: const MPCustomAppBar(
        isShowBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx((){
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty? networkImage: 'assets/images/user/user.png';
                      return controller.imageLoading.value?
                      const MPShimmerEffect(width: 80, height: 80)
                          :MPRoundImage(image: image,width: 80,height: 80,isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(onPressed:()=>controller.uploadUserProfilePicture(), child: const Text('Change Profile Photo'))
                  ],
                ),
              ),
              const SizedBox(height: 12.0,),
              const Divider(),
              const SizedBox(height: 24.0,),
              //profile infor
              const MPSectionHeading(title: 'Profile Information',showActionButton: false,),
              const SizedBox(height: 24.0,),
              MPProfileMenu(onPressed: ()=> Get.to(()=>const MPChangeName()), title: 'Name', value: controller.user.value.fullName,),
              MPProfileMenu(onPressed: () {  }, title: 'Username', value: controller.user.value.username,),

              const SizedBox(height: 12.0,),
              const Divider(),
              const SizedBox(height: 24.0,),
              //personal
              const MPSectionHeading(title: 'Personal Information',showActionButton: false,),
              const SizedBox(height: 24.0,),
              MPProfileMenu(onPressed: () {  }, title:'ID' , value: controller.user.value.id,icon: Iconsax.copy_copy,),
              MPProfileMenu(onPressed: () {  }, title:'Email' , value: controller.user.value.email,),
              MPProfileMenu(onPressed: () {  }, title: 'Phone Number', value: controller.user.value.phoneNumber,),
              MPProfileMenu(onPressed: () {  }, title: 'Gender', value: 'Female',),
              MPProfileMenu(onPressed: () {  }, title: 'Date of Birth', value: '20/5/2000',),

              const SizedBox(height: 8.0,),
              const Divider(),
              const SizedBox(height: 24.0,),
              Center(child: TextButton(onPressed: ()=> controller.deleteAccountWarningPopup(), child: const Text('Close Account',style: TextStyle(color: Colors.red),)))
            ],
          ),
        ),
      ),
    );
  }
}

class MPProfileMenu extends StatelessWidget {
  const MPProfileMenu({
    super.key, required this.onPressed, required this.title, required this.value, this.icon=Iconsax.arrow_right_3_copy,
  });
  final VoidCallback onPressed;
  final String title;
  final String value;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            Expanded(flex:3,child: Text(title,style: Theme.of(context).textTheme.bodySmall,overflow: TextOverflow.ellipsis,)),
            Expanded(flex: 5,child: Text(value,style: Theme.of(context).textTheme.bodyMedium,overflow: TextOverflow.ellipsis,)),
            Expanded(child: Icon(icon,size: 20,))
          ],
        ),
      ),
    );
  }
}
