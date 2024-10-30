import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../authentication/screens/onboarding/widgets/onboarding_dot.dart';
import '../../../controller/banner_home_controller.dart';
import 'image_container.dart';


class MPBanners extends StatelessWidget {
  const MPBanners({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(
            (){
          if(controller.isLoading.value){
            return const MPShimmerEffect(width: double.infinity, height: 190);
          }
          if(controller.banners.isEmpty){
            return const Center(child: Text('No data'),);
          }else{
            return Column(
              children: [
                CarouselSlider(
                  carouselController: controller.carouselController,
                  items: controller.banners
                      .map((banner) => MPRoundImage(
                    radius: 16,
                    padding: const EdgeInsets.all(24.0),
                    image: banner.image,
                    isNetworkImage: true,
                    onPressed: () => Get.toNamed(banner.targetScreen),
                  ))
                      .toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    viewportFraction: 1,
                    onPageChanged: (index, _) =>
                        controller.updatePageIndicator(index),
                  ),
                ),
                OnboardingDot(
                  count: controller.banners.length,
                  controller: controller,
                  isBanner: true,
                ),
              ],
            );
          }
        }
    );
  }
}
