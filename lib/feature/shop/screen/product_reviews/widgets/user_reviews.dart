import 'package:app_my_pham/common/widgets/rounded_container.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/image_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:readmore/readmore.dart';
class MPUserReviews extends StatelessWidget {
  const MPUserReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const MPRoundImage(image: 'assets/images/user/user.png',width: 40,height: 40,),
                const SizedBox(width: 12.0,),
                Text('AT tryhard', style: Theme.of(context).textTheme.titleLarge,)
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(height: 16.0,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RatingBarIndicator(
              rating: 4,
              itemSize: 20,
              itemBuilder: (_,__)=> const Icon(Icons.star_rate_sharp, color: Colors.blueAccent,),
              unratedColor: Colors.grey,
            ),
            const SizedBox(width: 16.0,),
            Text('26 Sep, 2024',style: Theme.of(context).textTheme.bodyMedium,),
            const SizedBox(height: 32.0,),
          ],
        ),
        const ReadMoreText(
          'Đặc biệt trong phiên bản cải tiến lần này, Macaland đã hạn chế tối đa cồn (Alcohol) trong thành phần mang đến trải nghiệm an toàn và dễ chịu hơn. Body mist của Macaland đảm bảo tiêu chí hương thơm không bị nồng gắt, khó chịu và có thể dùng trực tiếp trên da mà không lo về việc tắc nghẽn lỗ chân lông hay khô da quá mức. Khách hàng có thể yên tâm sử dụng lâu dài hằng ngày nha! ',
          trimLines: 2,
          trimMode:TrimMode.Line,
          trimExpandedText: 'Show less',
          trimCollapsedText: 'Show more',
          textAlign: TextAlign.justify,
          moreStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800, color: Colors.blueAccent),
          lessStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800,color: Colors.blueAccent),
        ),
        const SizedBox(height: 24.0,),
        MPRoundedContainer(
          backgroundColor: Colors.grey.withOpacity(0.4),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('TiemToaHuong', style: Theme.of(context).textTheme.titleMedium,),
                    Text('26 Sep, 2024',style: Theme.of(context).textTheme.bodyMedium,),
                  ],
                ),
                const SizedBox(height: 8.0,),
                const ReadMoreText(
                  'Đặc biệt trong phiên bản cải tiến lần này, Macaland đã hạn chế tối đa cồn (Alcohol) trong thành phần mang đến trải nghiệm an toàn và dễ chịu hơn. Body mist của Macaland đảm bảo tiêu chí hương thơm không bị nồng gắt, khó chịu và có thể dùng trực tiếp trên da mà không lo về việc tắc nghẽn lỗ chân lông hay khô da quá mức. Khách hàng có thể yên tâm sử dụng lâu dài hằng ngày nha! ',
                  trimLines: 2,
                  trimMode:TrimMode.Line,
                  trimExpandedText: 'Show less',
                  trimCollapsedText: 'Show more',
                  textAlign: TextAlign.justify,
                  moreStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800, color: Colors.blueAccent),
                  lessStyle: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w800,color: Colors.blueAccent),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
