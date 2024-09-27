import 'package:app_my_pham/common/widgets/icon_container.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/appbar.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/heading_section.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/image_container.dart';
import 'package:app_my_pham/feature/shop/screen/product_details/widgets/curved_edget.dart';
import 'package:app_my_pham/feature/shop/screen/product_details/widgets/product_data.dart';
import 'package:app_my_pham/feature/shop/screen/product_details/widgets/product_to_cart.dart';
import 'package:app_my_pham/feature/shop/screen/product_reviews/product_review.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:readmore/readmore.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MPProductBottomBar(),
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
            Padding(
              padding:
                  const EdgeInsets.only(right: 24.0, left: 24.0, bottom: 24.0),
              child: Column(
                children: [
                  const MPProductRating(),
                  const MPProductData(),
                  const SizedBox(
                    height: 16.0,
                  ),
                  //attributes,
                  Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const MPSectionHeading(
                            title: 'Types',
                            showActionButton: false,
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Wrap(
                            spacing: 16.0,
                            children: [
                              MPChoice(
                                text: 'Nam - Flipped',
                                selected: true,
                                onSelected: (value) {},
                              ),
                              MPChoice(
                                text: 'Nam - Iris',
                                selected: false,
                                onSelected: (value) {},
                              ),
                              MPChoice(
                                text: 'Nam - Orchid',
                                selected: false,
                                onSelected: (value) {},
                              ),
                              MPChoice(
                                text: 'Nữ - Darling',
                                selected: false,
                                onSelected: (value) {},
                              ),
                              MPChoice(
                                text: 'Nữ - Soft Spring',
                                selected: false,
                                onSelected: (value) {},
                              ),
                              MPChoice(
                                text: 'Nữ - Sauve',
                                selected: false,
                                onSelected: (value) {},
                              ),
                              MPChoice(
                                text: 'Unisex - Dynamic',
                                selected: false,
                                onSelected: (value) {},
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const MPSectionHeading(
                            title: 'Size',
                            showActionButton: false,
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Wrap(
                            spacing: 16.0,
                            children: [
                              MPChoice(
                                text: '100ml',
                                selected: true,
                                onSelected: (value) {},
                              ),
                              MPChoice(
                                text: '150ml',
                                selected: false,
                                onSelected: (value) {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32.0,
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
                  const ReadMoreText(
                      '- Body mist của Macaland với công dụng 2 trong 1 không chỉ giúp bạn tự tin với hương thơm nước hoa Pháp ấn tượng mà còn nhờ làn da được dưỡng ẩm mịn màng với Dầu Mắc Ca, Chiết xuất Trà Xanh và Niacinamide. Đa dạng các loại tinh dầu cùng hỗ trợ tạo hương thơm thiên nhiên dễ chịu.\n - Đặc biệt trong phiên bản cải tiến lần này, Macaland đã hạn chế tối đa cồn (Alcohol) trong thành phần mang đến trải nghiệm an toàn và dễ chịu hơn. Body mist của Macaland đảm bảo tiêu chí hương thơm không bị nồng gắt, khó chịu và có thể dùng trực tiếp trên da mà không lo về việc tắc nghẽn lỗ chân lông hay khô da quá mức. Khách hàng có thể yên tâm sử dụng lâu dài hằng ngày nha! ',
                  trimLines: 2,
                    trimMode:TrimMode.Line,
                    trimExpandedText: 'Less',
                    trimCollapsedText: 'More',
                    textAlign: TextAlign.justify,
                    moreStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800),
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
