import 'package:app_my_pham/common/widgets/rounded_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'brand_card.dart';
class MPBrandShowcase extends StatelessWidget {
  const MPBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return MPRoundedContainer(
      showBorder: true,
      borderColor: Colors.grey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        children: [
          const MPBrandCard(
            showBorder: false,
            image: 'assets/images/products/perfume.png',
            title: 'Chanel',
            subtitle: '250 products',
          ),
          Row(
              children:
              images.map((image) => brandTopImage(context, image)).toList())
        ],
      ),
    );
  }

  Widget brandTopImage(context, String image) {
    return Expanded(
      child: MPRoundedContainer(
          height: 100,
          padding: const EdgeInsets.all(16.0),
          margin: const EdgeInsets.only(right: 8.0),
          showBorder: true,
          backgroundColor: CupertinoColors.lightBackgroundGray,
          child: Image(fit: BoxFit.contain, image: AssetImage(image))),
    );
  }
}