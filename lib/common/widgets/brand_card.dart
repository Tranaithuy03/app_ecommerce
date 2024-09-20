import 'package:app_my_pham/common/widgets/rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:app_my_pham/common/enum.dart';
import '../../feature/shop/screen/home/widgets/image_container.dart';
import 'brand_title_verify.dart';
class MPBrandCard extends StatelessWidget {
  const MPBrandCard({
    super.key,
    this.onTap,
    required this.image,
    required this.title,
    required this.subtitle,  this.showBorder=true,
  });

  final VoidCallback? onTap;
  final String image;
  final String title;
  final String subtitle;
  final bool showBorder;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: MPRoundedContainer(
        //radius: 16.0,
        backgroundColor: Colors.transparent,
        showBorder: showBorder,
        padding: const EdgeInsets.all(8.0),
        borderColor: Colors.grey,
        child: Row(
          children: [
            Flexible(
              //chỉ chiếm không gian vừa đủ
              child: MPRoundImage(
                image: image,
                height: 56,
                width: 56,
                padding: const EdgeInsets.all(8.0),
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(
              width: 6.0,
            ),
            Expanded(
              //chiếm hết phần còn lại của row
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MPBrandTitleVerify(
                    title: title,
                    size: textSize.medium,
                  ),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.labelMedium,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}