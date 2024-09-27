import 'package:app_my_pham/feature/shop/screen/home/widgets/appbar.dart';
import 'package:app_my_pham/feature/shop/screen/product_reviews/widgets/product_ratings.dart';
import 'package:app_my_pham/feature/shop/screen/product_reviews/widgets/user_reviews.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
class ProductReviewScreen extends StatelessWidget {
  const ProductReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MPCustomAppBar(title: Text('Reviews and Ratings'),isShowBackArrow: true,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Ratings and Reviews arre verified and are from people who use the same type of device that you use.'),
              const SizedBox(height: 16.0,),
              Row(
                children: [
                  Expanded(flex:3,child: Text('4.3', style: Theme.of(context).textTheme.displayLarge,)),
                  const Expanded(flex: 7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MPRatings(text: '5',value: 0.6,),
                        MPRatings(text: '4',value: 0.8,),
                        MPRatings(text: '3',value: 0.2,),
                        MPRatings(text: '2',value: 0.1,),
                        MPRatings(text: '1',value: 0.0,),
                      ],
                    ),
                  )
                ],
              ),
              RatingBarIndicator(
                rating: 4.3,
                itemSize: 20,
                itemBuilder: (_,__)=> const Icon(Icons.star_rate_sharp, color: Colors.blueAccent,),
                unratedColor: Colors.grey,
              ),
              Text('19,0603',style: Theme.of(context).textTheme.bodySmall,),
              const SizedBox(height: 32.0,),
              const MPUserReviews()
            ],
          ),
        ),
      ),
    );
  }
}


