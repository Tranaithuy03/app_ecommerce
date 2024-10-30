import 'package:app_my_pham/common/enum.dart';
import 'package:app_my_pham/common/widgets/brand_title.dart';
import 'package:app_my_pham/common/widgets/brand_title_verify.dart';
import 'package:app_my_pham/common/widgets/rounded_container.dart';
import 'package:app_my_pham/feature/shop/controller/product/product_controller.dart';
import 'package:app_my_pham/feature/shop/models/product_model.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/image_container.dart';
import 'package:flutter/material.dart';

import 'Product_price.dart';

class MPProductData extends StatelessWidget {
  const MPProductData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //price and sale price
        Row(
          children: [
            MPRoundedContainer(
              radius: 8.0,
              backgroundColor: Colors.red.withOpacity(0.8),
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              child: Text(
                '$salePercentage%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: Colors.white, fontSizeFactor: 1),
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              MPProducPriceText(
                price: '${product.price}đ',
                isLineThrough: true,
              ),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              const SizedBox(
                width: 16.0,
              ),
            MPProducPriceText(
              price: controller.getProductPrice(product),
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(
          height: 16.0 / 1.5,
        ),
        //title
        MPBrandTitle(
          title: product.title,
          size: textSize.large,
        ),
        const SizedBox(
          height: 16.0 / 1.5,
        ),
        Row(
          children: [
            const MPBrandTitle(title: 'Status: '),
            const SizedBox(
              width: 16.0 / 1.5,
            ),
            Text(
              controller.getProductStockState(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        const SizedBox(
          height: 16.0 / 1.5,
        ),
        //brand
        Row(
          children: [
            MPRoundImage(
              isNetworkImage: product.brand != null,
              image: product.brand != null ? product.brand!.image : '',
              height: 32,
              width: 32,
            ),
            MPBrandTitleVerify(
                title: product.brand != null ? product.brand!.name : ''),
          ],
        )
      ],
    );
  }
}
