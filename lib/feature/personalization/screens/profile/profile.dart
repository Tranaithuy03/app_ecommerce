import 'package:app_my_pham/feature/shop/screen/home/widgets/appbar.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/heading_section.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/image_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    const MPRoundImage(image: 'assets/images/user/user.png',width: 80,height: 80,),
                    TextButton(onPressed:(){}, child: const Text('Change Profile Photo'))
                  ],
                ),
              ),
              const SizedBox(height: 12.0,),
              const Divider(),
              const SizedBox(height: 24.0,),
              //profile infor
              const MPSectionHeading(title: 'Profile Information',showActionButton: false,),
              const SizedBox(height: 24.0,),
              MPProfileMenu(onPressed: () {  }, title: 'Name', value: 'AT tryhard',),
              MPProfileMenu(onPressed: () {  }, title: 'Username', value: 'TAT',),

              const SizedBox(height: 12.0,),
              const Divider(),
              const SizedBox(height: 24.0,),
              //personal
              const MPSectionHeading(title: 'Personal Information',showActionButton: false,),
              const SizedBox(height: 24.0,),
              MPProfileMenu(onPressed: () {  }, title: 'User ID', value: '1554',icon: Iconsax.copy_copy,),
              MPProfileMenu(onPressed: () {  }, title: 'E-mail', value: 'tata@gmail.com',),
              MPProfileMenu(onPressed: () {  }, title: 'Phone Number', value: '000011111',),
              MPProfileMenu(onPressed: () {  }, title: 'Gender', value: 'Female',),
              MPProfileMenu(onPressed: () {  }, title: 'Date of Birth', value: '20/5/2000',),

              const SizedBox(height: 8.0,),
              const Divider(),
              const SizedBox(height: 24.0,),
              Center(child: TextButton(onPressed: (){}, child: const Text('Close Account',style: TextStyle(color: Colors.red),)))
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
