import 'package:app_my_pham/common/widgets/brand_card.dart';
import 'package:flutter/material.dart';

import '../../../all_product/all_product.dart';
import '../../../home/widgets/appbar.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MPCustomAppBar(
        title: Text(
          'Maccaland',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        isShowBackArrow: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              MPBrandCard(
                image: 'assets/images/products/perfume.png',
                title: 'Maccaland',
              ),
              SizedBox(
                height: 24,
              ),
              MPSortableProduct()
            ],
          ),
        ),
      ),
    );
  }
}
