import 'package:app_my_pham/common/widgets/product_cart.dart';
import 'package:app_my_pham/common/widgets/vertical_product_shimmer.dart';
import 'package:app_my_pham/feature/shop/controller/product/product_controller.dart';
import 'package:app_my_pham/feature/shop/screen/all_product/all_product.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/header_container.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/heading_section.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/home_appbar.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/home_categories.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/search_container.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/slider_banner.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/grid_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            MPPrimaryHeaderContainer(
              child: Column(
                children: [
                  const HomeAppBar(),
                  const SizedBox(
                    height: 32,
                  ),
                  const MPSearchContainer(),
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MPSectionHeading(
                          title: 'Popular Categories',
                          textColor: Colors.white,
                          showActionButton: true,
                          onPressed: () =>
                              Get.to(() => const AllProductsScreen()),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        //categories
                        const MPHomeCategories()
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const MPBanners(),
                  const SizedBox(
                    height: 32.0,
                  ),
                  MPSectionHeading(
                    title: 'Popular Categories',
                    textColor: Colors.black,
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Obx((){
                    if(controller.isLoading.value)return const MPVerticalProductsShimmer();
                    if(controller.featuredProducts.isEmpty)return const Center(child: Text('No data'),);
                    return MPGridLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (_, index) => MPProductCart(product: controller.featuredProducts[index],));
                  })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

