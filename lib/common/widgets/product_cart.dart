import 'package:app_my_pham/common/enum.dart';
import 'package:app_my_pham/common/widgets/rounded_container.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/image_container.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import 'brand_title_verify.dart';
import 'icon_container.dart';

class MPProductCart extends StatelessWidget {
  const MPProductCart({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black38.withOpacity(0.1),
              blurRadius: 50,
              spreadRadius: 7,
              offset: const Offset(0, 2))
        ], borderRadius: BorderRadius.circular(16.0), color: Colors.white),
        child: Column(
          children: [
            //view,heart
            MPRoundedContainer(
              //height: 180,
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
            //details
            Padding(
              padding: const EdgeInsets.all(8.0),
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
                  const MPBrandTitleVerify(title: 'Macaland',),

                ],
              ),
            ),
            const Spacer(),
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
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Iconsax.add_copy,
                          color: Colors.white,
                          size: 20,
                        )))
              ],
            )
          ],
        ),
      ),
    );
  }
}


