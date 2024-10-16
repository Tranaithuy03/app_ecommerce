import 'package:app_my_pham/data/repositories/authentication/authentication_repository.dart';
import 'package:app_my_pham/feature/personalization/screens/address/address.dart';
import 'package:app_my_pham/feature/personalization/screens/profile/profile.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/appbar.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/header_container.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/heading_section.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/image_container.dart';
import 'package:app_my_pham/feature/shop/screen/order/order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../controller/user_controller.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MPPrimaryHeaderContainer(
              child: Column(
                children: [
                  MPCustomAppBar(
                    title: Text(
                      'Account',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: Colors.white),
                    ),
                  ),
                  ListTile(
                    leading: Obx((){
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty? networkImage: 'assets/images/user/user.png';
                      return controller.imageLoading.value?
                          const MPShimmerEffect(width: 50, height: 50)
                          :MPRoundImage(image: image,width: 50,height: 50,isNetworkImage: networkImage.isNotEmpty);
                    }),
                    title: Obx(
                      ()=> Text(
                        controller.user.value.fullName,
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .apply(color: Colors.white),
                      ),
                    ),
                    subtitle: Text(controller.user.value.email,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: Colors.white)),
                    trailing: IconButton(
                        onPressed: () => Get.to(() => const ProfileScreen()),
                        icon: const Icon(
                          Iconsax.edit_copy,
                          color: Colors.white,
                        )),
                  ),
                  const SizedBox(
                    height: 32.0,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const MPSectionHeading(
                    title: 'Account settings',
                    showActionButton: false,
                  ),
                  MPSettingsMenuTile(
                    icon: Iconsax.safe_home_copy,
                    title: 'My Addresses',
                    subtitle: 'Set shopping delivey address',
                    onTap: () => Get.to(() => const UserAddressScreen()),
                  ),
                  const MPSettingsMenuTile(
                    icon: Iconsax.shopping_cart_copy,
                    title: 'My Cart',
                    subtitle: 'Add, remove products and move to checkout',
                  ),
                  MPSettingsMenuTile(
                    icon: Iconsax.bag_tick_copy,
                    title: 'My Orders',
                    subtitle: 'In-progress and Complete Orders',
                    onTap: () => Get.to(() => const MyOrderScreen()),
                  ),
                  const MPSettingsMenuTile(
                    icon: Iconsax.bank_copy,
                    title: 'Bank Account',
                    subtitle: 'Withdraw balance to registered bank account',
                  ),
                  const MPSettingsMenuTile(
                    icon: Iconsax.discount_shape_copy,
                    title: 'My Coupons',
                    subtitle: 'List of all the discounted coupons',
                  ),
                  const MPSettingsMenuTile(
                    icon: Iconsax.notification_copy,
                    title: 'Notifications',
                    subtitle: 'Set any kind of notification message',
                  ),
                  const MPSettingsMenuTile(
                    icon: Iconsax.security_card_copy,
                    title: 'Account Privacy',
                    subtitle: 'Manage data usage and connected accounts',
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  const MPSectionHeading(
                    title: 'App Settings',
                    showActionButton: false,
                  ),
                  const MPSettingsMenuTile(
                    icon: Iconsax.document_upload_copy,
                    title: 'Load Data',
                    subtitle: 'Upload Data to your Cloud Firebase',
                  ),
                  MPSettingsMenuTile(
                    icon: Iconsax.location_copy,
                    title: 'Geolocation',
                    subtitle: 'Set recommendation based on location',
                    trailing: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                  MPSettingsMenuTile(
                    icon: Iconsax.security_user_copy,
                    title: 'Safe Mode',
                    subtitle: 'Search result is safe for all ages',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                  MPSettingsMenuTile(
                    icon: Iconsax.image_copy,
                    title: 'HD Image Quality',
                    subtitle: 'Set image quality to be seen',
                    trailing: Switch(
                      value: false,
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => AuthenticationRepository.instance.logout(),
                    child: const Text('Log Out')),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MPSettingsMenuTile extends StatelessWidget {
  const MPSettingsMenuTile({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.trailing,
    this.onTap,
  });

  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 28,
        color: Colors.blue,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium,
      ),
      trailing: trailing,
    );
  }
}
