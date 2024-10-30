import 'package:app_my_pham/common/widgets/loaders.dart';
import 'package:app_my_pham/data/banner/banner_repository.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

import '../models/banner_model.dart';
class BannerController extends GetxController{
  static BannerController get instance => Get.find();
  Rx<int> currentCarouselIndex = 0.obs;
  final carouselController = CarouselSliderController();
  final RxList<BannerModel> banners = <BannerModel>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  void updatePageIndicator(index)=> currentCarouselIndex.value = index;

  void dotNavigationClick(index){
    currentCarouselIndex.value = index;
    carouselController.jumpToPage(index);
  }
  Future<void> fetchBanners()async{
    try{
      isLoading.value= true;
      final bannerRepo= Get.put(BannerRepository());
      final allBanners = await bannerRepo.fetchBanners();
      banners.assignAll(allBanners);
    }catch(e){
      MPLoaders.errorSnackBar(title: 'Oh snap',message: e.toString());
    }finally{
      isLoading.value=false;
    }
  }
}