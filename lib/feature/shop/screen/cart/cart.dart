import 'package:app_my_pham/feature/shop/screen/cart/widgets/cart_item.dart';
import 'package:app_my_pham/feature/shop/screen/checkout/checkout.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/appbar.dart';
import 'package:app_my_pham/feature/shop/screen/product_details/widgets/Product_price.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../common/widgets/icon_container.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MPCustomAppBar(
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        isShowBackArrow: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: MPListItem(itemCount: 10,),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ElevatedButton(onPressed: ()=> Get.to(()=>const CheckoutScreen()),
            child: const Text('Checkout')),
      ),
    );
  }
}

class MPListItem extends StatelessWidget {
  const MPListItem({
    super.key, required this.itemCount, this.isShowButton=true,
  });
  final int itemCount;
  final bool isShowButton;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(
        height: 32.0,
      ),
      shrinkWrap: true,
      itemCount: itemCount,
      itemBuilder: (context, index) =>  Column(
        children: [
          const MPCartItem(),
          if(isShowButton) const SizedBox(height: 16.0,),
          if(isShowButton) Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 70.0,),
                  const MPIcon(
                    icon: Iconsax.minus_copy,
                    height: 24,
                    width: 24,
                    size: 16,
                    backgroundColor: Colors.grey,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  Text(
                    '19',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  const MPIcon(
                    icon: Iconsax.add_copy,
                    height: 24,
                    width: 24,
                    size: 16,
                    backgroundColor: Colors.blue,
                    color: Colors.white,
                  )
                ],
              ),
              const MPProducPriceText(price: '100.000',)
            ],
          )
        ],
      ),
    );
  }
}

