import 'package:app_my_pham/common/widgets/grid_layout.dart';
import 'package:app_my_pham/common/widgets/icon_container.dart';
import 'package:app_my_pham/common/widgets/product_cart.dart';
import 'package:app_my_pham/feature/shop/screen/home/home.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MPCustomAppBar(
        title: Text(
          'WishList',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          MPIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          )
          //lỗi
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              MPGridLayout(
                  itemCount: 10,
                  itemBuilder: (_, index) => const MPProductCart())
            ],
          ),
        ),
      ),
    );
  }
}
