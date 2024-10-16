import 'package:app_my_pham/feature/personalization/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../cart/cart.dart';
import 'action_container.dart';
import 'appbar.dart';
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return MPCustomAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Have a good day!',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: Colors.white),
          ),
          Obx(
            ()=> Text(
              controller.user.value.fullName,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: Colors.white),
            ),
          ),
        ],
      ),
      actions: [
        MPCartCounterIcon(
          number: '10',
          onPressed: ()=> Get.to(()=> const CartScreen()),
          colorIcon: Colors.white,
        )
      ],
    );
  }
}