import 'package:app_my_pham/common/widgets/product_cart.dart';
import 'package:app_my_pham/feature/authentication/screens/onboarding/widgets/onboarding_dot.dart';
import 'package:app_my_pham/feature/shop/controller/banner_home_controller.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/action_container.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/appbar.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/category_container.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/header_container.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/heading_section.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/image_container.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/search_container.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                  MPCustomAppBar(
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
                        Text(
                          'Ms.Thuy',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .apply(color: Colors.white),
                        ),
                      ],
                    ),
                    actions: [
                      MPCartCounterIcon(
                        number: '10',
                        onPressed: () {},
                        colorIcon: Colors.white,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const MPSearchContainer(text: 'Search in store'),
                  const SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const MPSectionHeading(
                          title: 'Popular Categories',
                          textColor: Colors.white,
                          showActionButton: false,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        //categories
                        SizedBox(
                          height: 80,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 10,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                return const MPVerticalImageText(
                                  title: 'Body mist',
                                  image:
                                      'assets/icons/categories/body_mist.png',
                                );
                              }),
                        )
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
                      ),
                      MPRoundImage(
                        image: 'assets/images/banners/banner_2.png',
                        padding: EdgeInsets.all(24.0),
                      ),
                      MPRoundImage(
                        image: 'assets/images/banners/banner_3.png',
                        padding: EdgeInsets.all(24.0),
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
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    itemCount: 12,
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 12.0,
                        mainAxisSpacing: 12.0,
                      mainAxisExtent: 300
                    ),
                    itemBuilder: (context, index) => MPProductCart(),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
