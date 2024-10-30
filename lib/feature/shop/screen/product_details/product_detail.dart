import 'package:app_my_pham/common/enum.dart';
import 'package:app_my_pham/common/widgets/icon_container.dart';
import 'package:app_my_pham/feature/shop/controller/product/variation_controller.dart';
import 'package:app_my_pham/feature/shop/models/product_model.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/appbar.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/heading_section.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/image_container.dart';
import 'package:app_my_pham/feature/shop/screen/product_details/widgets/curved_edget.dart';
import 'package:app_my_pham/feature/shop/screen/product_details/widgets/product_data.dart';
import 'package:app_my_pham/feature/shop/screen/product_details/widgets/product_image_slider.dart';
import 'package:app_my_pham/feature/shop/screen/product_details/widgets/product_to_cart.dart';
import 'package:app_my_pham/feature/shop/screen/product_reviews/product_review.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MPProductBottomBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //slider
            MPProductImageSlider(product: product,),
            //details
            Padding(
              padding:
                  const EdgeInsets.only(right: 24.0, left: 24.0, bottom: 24.0),
              child: Column(
                children: [
                  const MPProductRating(),
                  MPProductData(product: product,),
                  const SizedBox(
                    height: 16.0,
                  ),
                  //attributes,
                  if(product.productType==ProductType.variable.toString())
                    MPProductAttributes(product: product,),
                  if(product.productType==ProductType.variable.toString())
                    const SizedBox(
                    height: 16.0,
                  ),
                  //checkout
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text('Checkout'),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  //description
                  const MPSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                   ReadMoreText(
                    product.description??'',
                  trimLines: 2,
                    trimMode:TrimMode.Line,
                    trimExpandedText: 'Less',
                    trimCollapsedText: 'More',
                    textAlign: TextAlign.justify,
                    moreStyle: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
                    lessStyle: const TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const MPSectionHeading(title: 'Reviews(196)',showActionButton: false,),
                      IconButton(onPressed: ()=> Get.to(()=>const ProductReviewScreen()), icon: const Icon(Iconsax.arrow_right_3_copy))
                    ],
                  ),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MPProductAttributes extends StatelessWidget {
  const MPProductAttributes({
    super.key, required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: product.productAttributes!.map((attribute) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               MPSectionHeading(
                title: attribute.name??'',
                showActionButton: false,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Wrap(
                spacing: 16.0,
                children: attribute.values!.map((value) => MPChoice(
                  text: value,
                  selected: false,
                  onSelected: (value) {},
                ),).toList()
              ),
              const SizedBox(
                height: 16.0,
              ),
            ],
          ),
          ).toList()
        ),

      ],
    );
  }
}



class MPChoice extends StatelessWidget {
  const MPChoice({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(text),
      selected: selected,
      onSelected: (value) {},
      elevation: 0,
      selectedColor: Colors.blueAccent,
      labelStyle: TextStyle(color: selected ? Colors.white : null),
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
                  text: '4.8', style: Theme.of(context).textTheme.bodyLarge),
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
