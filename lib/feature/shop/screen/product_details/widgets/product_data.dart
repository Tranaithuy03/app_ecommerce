import 'package:app_my_pham/common/enum.dart';
import 'package:app_my_pham/common/widgets/brand_title.dart';
import 'package:app_my_pham/common/widgets/brand_title_verify.dart';
import 'package:app_my_pham/common/widgets/rounded_container.dart';
import 'package:flutter/material.dart';

import 'Product_price.dart';

class MPProductData extends StatelessWidget {
  const MPProductData({super.key});

  @override
  Widget build(BuildContext context) {
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
                '30%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: Colors.white, fontSizeFactor: 1),
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            const MPProducPriceText(
              price: '135.000',
              isLineThrough: true,
            ),
            const SizedBox(
              width: 16.0,
            ),
            const MPProducPriceText(
              price: '100.000',
              isLarge: true,
            ),
            ],
        ),
        const SizedBox(height: 16.0/1.5,),
        //title
        const MPBrandTitle(title: 'Body mist Macaland', size: textSize.large,),
        const SizedBox(height: 16.0/1.5,),
        Row(
          children: [
            const MPBrandTitle(title: 'Status: '),
            const SizedBox(width: 16.0/1.5,),
            Text('In stock', style: Theme.of(context).textTheme.titleMedium,)
          ],
        ),
        const SizedBox(height: 16.0/1.5,),
        //brand
        const MPBrandTitleVerify(title: 'Macaland')
      ],
    );
  }
}

