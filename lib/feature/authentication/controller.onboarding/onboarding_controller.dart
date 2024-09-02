import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController{
  static OnboardingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(index)=> currentPageIndex.value = index;

  void dotNavigationClick(index){
    currentPageIndex.value = index;
    pageController.jumpToPage(index);
  }

  void skip(){
    currentPageIndex.value = 2;
    pageController.jumpToPage(2);
  }

  void next(){
    if(currentPageIndex.value==2)
      {
      }
    else{
      int pageIndex = currentPageIndex.value +1;
      pageController.jumpToPage(pageIndex);
    }
  }

}