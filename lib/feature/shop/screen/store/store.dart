import 'package:app_my_pham/common/enum.dart';
import 'package:app_my_pham/common/widgets/brand_title_verify.dart';
import 'package:app_my_pham/common/widgets/product_cart.dart';
import 'package:app_my_pham/common/widgets/rounded_container.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/action_container.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/heading_section.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/image_container.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/search_container.dart';
import 'package:flutter/material.dart';


class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Store',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: MPCartCounterIcon(
              onPressed: () {},
            ),
          )
        ],
      ),
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  pinned: true,
                  automaticallyImplyLeading: false,
                  floating: true,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        const SizedBox(
                          height: 24.0,
                        ),
                        const MPSearchContainer(
                            padding: EdgeInsets.symmetric(horizontal: 8.0)),
                        const SizedBox(
                          height: 24.0,
                        ),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: MPSectionHeading(
                            title: 'Featured Brands',
                            showActionButton: true,
                          ),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: 4,
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 14.0,
                                  crossAxisSpacing: 14.0,
                                 mainAxisExtent: 80
                              ),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {},
                              child: MPRoundedContainer(
                                //radius: 16.0,
                                backgroundColor: Colors.transparent,
                                showBorder: true,
                                padding: const EdgeInsets.all(8.0),
                                borderColor: Colors.grey,
                                child: Row(
                                  children: [
                                    const Flexible( //chỉ chiếm không gian vừa đủ
                                      child: MPRoundImage(
                                        image: 'assets/images/products/perfume.png',
                                        height: 56,
                                        width: 56,
                                        padding: EdgeInsets.all(8.0),
                                        backgroundColor: Colors.transparent,
                                      ),
                                    ),
                                    const SizedBox(width: 6.0,),
                                    Expanded( //chiếm hết phần còn lại của row
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          const MPBrandTitleVerify(
                                            title: 'Macaland',
                                            size: textSize.medium,
                                          ),
                                          Text(
                                            '250 products with ahhh',
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium,
                                            overflow: TextOverflow.ellipsis,)
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
          body: Container()),
    );
  }
}
