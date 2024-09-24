import 'package:app_my_pham/common/widgets/icon_container.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/appbar.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/image_container.dart';
import 'package:app_my_pham/feature/shop/screen/product_details/widgets/curved_edget.dart';
import 'package:app_my_pham/feature/shop/screen/product_details/widgets/product_data.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //slider
            MPCurvedEdgetsWidget(
                child: Container(
              color: Colors.white,
              child: Stack(
                children: [
                  //main Image
                  const SizedBox(
                    height: 400,
                    child: Padding(
                      padding: EdgeInsets.all(32.0),
                      child: Center(
                        child: Image(
                            image: AssetImage(
                                'assets/images/products/body_mist_product.jpg')),
                      ),
                    ),
                  ),
                  //slider
                  Positioned(
                    right: 0,
                    bottom: 30,
                    left: 24.0,
                    child: SizedBox(
                      height: 80,
                      child: ListView.separated(
                        //danh sách có các phần tử được ngăn cách bởi một widget khác
                        separatorBuilder: (context, index) => const SizedBox(
                          width: 16.0,
                        ),
                        //widget cho phần ngăn cách giữa các phần tử
                        itemCount: 6,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) => MPRoundImage(
                          width: 80,
                          radius: 16,
                          backgroundColor: Colors.white,
                          border: Border.all(color: Colors.blueAccent),
                          padding: const EdgeInsets.all(8.0),
                          image:
                              'assets/images/products/macaland/macaland_1.png',
                        ),
                      ),
                    ),
                  ),
                  const MPCustomAppBar(
                    isShowBackArrow: true,
                    actions: [
                      MPIcon(
                        icon: Iconsax.heart,
                        color: Colors.red,
                      )
                    ],
                  )
                ],
              ),
            )),
            //details
            const Padding(
              padding:
                  EdgeInsets.only(right: 24.0, left: 24.0, bottom: 24.0),
              child: Column(
                children: [
                  MPProductRating(),
                  MPProductData()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MPProductRating extends StatelessWidget {
  const MPProductRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Iconsax.star,
              color: Colors.amber,
              size: 24,
            ),
            const SizedBox(
              width: 8.0,
            ),
            Text.rich(//hiển thị văn bản thức tạp
                TextSpan(//định nghĩa từng đoạn văn bản riêng lẻ
                    children: [
              TextSpan(
                  text: '4.8',
                  style: Theme.of(context).textTheme.bodyLarge),
              const TextSpan(text: '(1960)')
            ]))
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              size: 24.0,
            ))
      ],
    );
  }
}


