import 'package:app_my_pham/common/widgets/grid_layout.dart';
import 'package:app_my_pham/common/widgets/product_cart.dart';
import 'package:app_my_pham/common/widgets/rounded_container.dart';
import 'package:app_my_pham/common/widgets/tabbar.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/action_container.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/heading_section.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/search_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../common/widgets/brand_card.dart';
import '../../../../common/widgets/brand_show.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
                    backgroundColor: Colors.white,
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
                          MPGridLayout(
                            itemCount: 4,
                            mainAxisExtent: 80,
                            itemBuilder: (context, index) {
                              return const MPBrandCard(
                                image: 'assets/images/products/perfume.png',
                                title: 'Maccaland',
                                subtitle: '250 products',
                              );
                            },
                          )
                        ],
                      ),
                    ),
                    bottom: const MPTabBar(tabs: [
                      Tab(
                        child: Text('Perfume'),
                      ),
                      Tab(
                        child: Text('Fragrance sachet'),
                      ),
                      Tab(
                        child: Text('Body mist'),
                      ),
                      Tab(
                        child: Text('Scented candles'),
                      ),
                    ]),
                  )
                ],
            body: const TabBarView(children: [
              MPCategoryTab(),
              MPCategoryTab(),
              MPCategoryTab(),
              MPCategoryTab(),
            ])),
      ),
    );
  }
}

class MPCategoryTab extends StatelessWidget {
  const MPCategoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              //brand and top 3 product;
              const MPBrandShowcase(
                images: [
                  'assets/images/products/perfume/chanel_product_1.png',
                  'assets/images/products/perfume/chanel_product_2.png',
                  'assets/images/products/perfume/chanel_product_3.png'
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              MPSectionHeading(
                title: 'You might like',
                onPressed: () {},
              ),
              const SizedBox(
                height: 16.0,
              ),
              //product
              MPGridLayout(
                  itemCount: 8,
                  itemBuilder: (_, index) => const MPProductCart()),
              const SizedBox(
                height: 16.0,
              ),
            ],
          ),
        )
      ],
    );
  }
}
