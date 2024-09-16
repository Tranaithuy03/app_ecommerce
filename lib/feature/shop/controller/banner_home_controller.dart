import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class BannerController extends GetxController{
  static BannerController get instance => Get.find();
  Rx<int> currentCarouselIndex = 0.obs;
  final carouselController = CarouselSliderController();
  void updatePageIndicator(index)=> currentCarouselIndex.value = index;
  void dotNavigationClick(index){
    currentCarouselIndex.value = index;
    carouselController.jumpToPage(index);
  }

}