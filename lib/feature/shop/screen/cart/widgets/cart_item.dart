import 'package:app_my_pham/common/enum.dart';
import 'package:app_my_pham/common/widgets/brand_title.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/brand_title_verify.dart';
import '../../home/widgets/image_container.dart';
class MPCartItem extends StatelessWidget {
  const MPCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const MPRoundImage(
          image: 'assets/images/products/macaland/macaland_1.png',
          width: 60,
          height: 60,
          padding: EdgeInsets.all(8.0),
          radius: 0,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MPBrandTitle(
                title: 'Body mist Macaland',
                size: textSize.large,
                maxLine: 1,
              ),
              const MPBrandTitleVerify(title: 'Macaland'),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Type ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: 'Nam-Flipped ',
                    style: Theme.of(context).textTheme.bodyLarge),
                TextSpan(
                    text: 'Size ',
                    style: Theme.of(context).textTheme.bodySmall),
                TextSpan(
                    text: '125ml',
                    style: Theme.of(context).textTheme.bodyLarge),
              ]))
            ],
          ),
        )
      ],
    );
  }
}
