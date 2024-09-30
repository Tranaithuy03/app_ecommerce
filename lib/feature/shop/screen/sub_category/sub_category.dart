import 'package:app_my_pham/common/enum.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/appbar.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/heading_section.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/image_container.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../common/widgets/brand_title_verify.dart';
import '../../../../common/widgets/icon_container.dart';
import '../../../../common/widgets/rounded_container.dart';
class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MPCustomAppBar(
        title: Text(
          'Body Mist',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        isShowBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const MPRoundImage(image: 'assets/images/banners/banner_1.png', radius: 16,),
              const SizedBox(height: 24.0,),
              const MPSectionHeading(title: 'Body mist...', showActionButton: true,),
              SizedBox(
                height: 150,
                width: double.infinity,
                child: ListView.separated(
                  itemCount: 10,
                  separatorBuilder: (context, index) => const SizedBox(width: 16,),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => const MPProductHorizontal(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MPProductHorizontal extends StatelessWidget {
  const MPProductHorizontal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Container(
        width: 340,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black38.withOpacity(0.1),
              blurRadius: 50,
              spreadRadius: 7,
              offset: const Offset(0, 2))
        ], borderRadius: BorderRadius.circular(16.0), color: Colors.white),
        child: Row(
          children: [
            MPRoundedContainer(
              height: 100,
              width: 100,
              backgroundColor: Colors.black12,
              child: Stack(
                children: [
                  const MPRoundImage(
                    image: 'assets/images/products/body_mist_product.jpg',
                    applyImageRadius: true,
                    radius: 16,
                  ),
                  //sale
                  Positioned(
                    top: 5,
                    left: 5,
                    child: Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                          child: Text(
                            '30%',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: Colors.white, fontSizeFactor: 1),
                          )),
                    ),
                  ),
                  const Positioned(
                    bottom: 10,
                    right: 5,
                    child: MPIcon(
                      icon: Iconsax.heart,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all( 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Body mist Macaland chính hãng, giữ mùi thơm lâu',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.labelLarge,
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        const MPBrandTitleVerify(title: 'Macaland',size: textSize.small,),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          '100.000đ',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ),
                      Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          child: GestureDetector(
                              onTap: () {},
                              child: const Icon(
                                Iconsax.add_copy,
                                color: Colors.white,
                                size: 20,
                              )))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
