import 'package:app_my_pham/feature/authentication/screens/login/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

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
        final storage = GetStorage();
        storage.write('isFirstTime', false);
        Get.offAll(const LoginScreen());
      }
    else{
      int pageIndex = currentPageIndex.value +1;
      pageController.jumpToPage(pageIndex);
    }
  }

}