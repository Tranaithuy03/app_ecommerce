import 'package:app_my_pham/common/widgets/product_cart.dart';
import 'package:app_my_pham/feature/authentication/screens/onboarding/widgets/onboarding_dot.dart';
import 'package:app_my_pham/feature/shop/controller/banner_home_controller.dart';
import 'package:app_my_pham/feature/shop/screen/all_product/all_product.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/category_container.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/header_container.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/heading_section.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/home_appbar.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/home_categories.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/image_container.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/search_container.dart';
import 'package:app_my_pham/feature/shop/screen/sub_category/sub_category.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/widgets/grid_layout.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
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
                          onPressed: () => Get.to(()=> const AllProductsScreen()),
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        //categories
                        MPHomeCategories()
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
                  CarouselSlider(
                    carouselController: controller.carouselController,
                    items: const [
                      MPRoundImage(
                        image: 'assets/images/banners/banner_1.png',
                        padding: EdgeInsets.all(24.0),
                        radius: 16.0,
                      ),
                      MPRoundImage(
                        image: 'assets/images/banners/banner_2.png',
                        padding: EdgeInsets.all(24.0),
                        radius: 16.0,
                      ),
                      MPRoundImage(
                        image: 'assets/images/banners/banner_3.png',
                        padding: EdgeInsets.all(24.0),
                        radius: 16.0,
                      ),
                    ],
                    options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 1,
                      onPageChanged: (index, _) =>
                          controller.updatePageIndicator(index),
                    ),
                  ),
                  OnboardingDot(
                    controller: controller,
                    isBanner: true,
                  ),
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
                   MPGridLayout(itemCount: 8, itemBuilder: (_,index)=> const MPProductCart())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}





