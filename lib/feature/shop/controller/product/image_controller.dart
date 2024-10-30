import 'package:app_my_pham/feature/shop/models/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageController extends GetxController{
  static ImageController get instance => Get.find();
  RxString selectedProductImage = ''.obs;

  List<String> getAllProductImages(ProductModel product){
    ///dùng set để thêm các hình ảnh chỉ xuất hiện 1 lần
    Set<String> images ={};
    images.add(product.thumbnail);
    selectedProductImage.value =product.thumbnail;
    if(product.images!=null){
      images.addAll(product.images!);
    }
    ///lay hinh anh cua variation
    if(product.productVariations!= null|| product.productVariations!.isNotEmpty){
      images.addAll(product.productVariations!.map((variation) => variation.image));
    }
  return images.toList();
  }
  void showEnlargedImage(String image){
    Get.to(
      fullscreenDialog: true,
        ()=> Dialog.fullscreen(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 48,horizontal: 24),
                child: CachedNetworkImage(imageUrl: image),
          ),
              const SizedBox(height: 32,),
              Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: 150,
                  child: OutlinedButton(onPressed: ()=>Get.back(),child: const Text('Close'),),
                ),
              )
            ],
          ),
        )
    );
  }
}