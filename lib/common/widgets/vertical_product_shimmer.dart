import 'package:app_my_pham/common/widgets/grid_layout.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/image_container.dart';
import 'package:flutter/material.dart';

class MPVerticalProductsShimmer extends StatelessWidget {
  const MPVerticalProductsShimmer({super.key,  this.itemCount=4});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return MPGridLayout(
        itemCount: itemCount,
        itemBuilder: (_,__)=> const SizedBox(
          width: 180,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MPShimmerEffect(width: 180, height: 180, radius: 16,),
              SizedBox(height: 24,),
              //text
              MPShimmerEffect(width: 160, height: 16,radius: 16,),
              SizedBox(height: 12,),
              MPShimmerEffect(width: 110, height: 15)
            ],
          ),
        )
    );
  }
}
