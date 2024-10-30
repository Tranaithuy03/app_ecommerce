import 'package:app_my_pham/feature/shop/controller/product/image_controller.dart';
import 'package:app_my_pham/feature/shop/models/product_model.dart';
import 'package:app_my_pham/feature/shop/screen/product_details/widgets/curved_edget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../common/widgets/icon_container.dart';
import '../../home/widgets/appbar.dart';
import '../../home/widgets/image_container.dart';

class MPProductImageSlider extends StatelessWidget {
  const MPProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageController());
    final images = controller.getAllProductImages(product);
    return MPCurvedEdgetsWidget(
        child: Container(
      color: Colors.white,
      child: Stack(
        children: [
          //main Image
          SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(32.0),
              child: Center(
                child: Obx(() {
                  final image = controller.selectedProductImage.value;
                  return GestureDetector(
                    onTap: ()=> controller.showEnlargedImage(image),
                    child: CachedNetworkImage(
                      imageUrl: image,
                      progressIndicatorBuilder: (context, url, progress) =>
                          CircularProgressIndicator(
                        value: progress.progress,
                        color: Colors.lightBlue,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          //slider
          Positioned(
            right: 0,
            bottom: 15,
            left: 24.0,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                //danh sách có các phần tử được ngăn cách bởi một widget khác
                separatorBuilder: (context, index) => const SizedBox(
                  width: 16.0,
                ),
                //widget cho phần ngăn cách giữa các phần tử
                itemCount: images.length,
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) => Obx(() {
                  final imageSelected =
                      controller.selectedProductImage.value == images[index];
                  ///true or false
                  return MPRoundImage(
                    width: 80,
                    radius: 16,
                    backgroundColor: Colors.white,
                    border: Border.all(
                        color: imageSelected
                            ? Colors.blueAccent
                            : Colors.transparent),
                   // padding: const EdgeInsets.all(8.0),
                    image: images[index],
                    onPressed: ()=>controller.selectedProductImage.value= images[index],
                    isNetworkImage: true,
                  );
                }),
              ),
            ),
          ),
          const MPCustomAppBar(
            isShowBackArrow: true,
            actions: [
              MPIcon(
                icon: Iconsax.heart,
                color: Colors.red,
              )
            ],
          )
        ],
      ),
    ));
  }
}
