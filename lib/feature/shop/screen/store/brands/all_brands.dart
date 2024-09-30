import 'package:app_my_pham/common/widgets/grid_layout.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/heading_section.dart';
import 'package:app_my_pham/feature/shop/screen/store/brands/widgets/brand_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/brand_card.dart';
import '../../home/widgets/appbar.dart';
class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MPCustomAppBar(
        title: Text(
          'Brand',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        isShowBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const MPSectionHeading(title: 'Brands', showActionButton: false,),
              const SizedBox(height: 24,),
              MPGridLayout(
                itemCount: 20,
                mainAxisExtent: 80,
                itemBuilder: (context, index) {
                  return  MPBrandCard(
                    image: 'assets/images/products/perfume.png',
                    title: 'Maccaland',
                    subtitle: '250 products',
                    onTap: ()=> Get.to(()=>  const BrandProductsScreen()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
