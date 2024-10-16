import 'package:app_my_pham/feature/shop/controller/category_controller.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/image_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../sub_category/sub_category.dart';
import 'category_container.dart';

class MPHomeCategories extends StatelessWidget {
  const MPHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return Obx(() {
      if (controller.isLoading.value) {
        return const MPCategoryShimmer();
      }
      if (controller.featuredCategories.isEmpty) {
        return Center(
            child: Text(
          'No data found',
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .apply(color: Colors.white),
        ));
      }
      return SizedBox(
        height: 100,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: controller.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = controller.featuredCategories[index];
              return MPVerticalImageText(
                isNetworkImage: true,
                title: category.name,
                image: category.image,
                onTap: () => Get.to(() => const SubCategoryScreen()),
              );
            }),
      );
    });
  }
}

class MPCategoryShimmer extends StatelessWidget {
  const MPCategoryShimmer({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        shrinkWrap: true,
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 24.0,
        ),
        itemBuilder: (context, index) {
          return const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MPShimmerEffect(
                width: 55,
                height: 55,
                radius: 55,
              ),
              SizedBox(
                height: 12,
              ),
              MPShimmerEffect(width: 55, height: 8)
            ],
          );
        },
      ),
    );
  }
}
