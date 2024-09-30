import 'package:app_my_pham/common/widgets/rounded_container.dart';
import 'package:app_my_pham/feature/shop/screen/cart/cart.dart';
import 'package:app_my_pham/feature/shop/screen/checkout/success.dart';
import 'package:app_my_pham/feature/shop/screen/checkout/widgets/coupon.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/heading_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../home/widgets/appbar.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MPCustomAppBar(
          title: Text(
            'Order Review',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          isShowBackArrow: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const MPListItem(
                  itemCount: 2,
                  isShowButton: false,
                ),
                const SizedBox(
                  height: 32.0,
                ),
                const MPCoupon(),
                const SizedBox(
                  height: 32.0,
                ),
                MPRoundedContainer(
                  showBorder: true,
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 8.0, right: 8.0, left: 16.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            '100.000đ',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping Fee',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            '25.000đ',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          Text(
                            '125.000đ',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Divider(),
                      const MPPayingMethod(),
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const MPSectionHeading(title: 'Shipping Address', buttonTitle: 'Change',),
                          Text('AT tryhard', style: Theme.of(context).textTheme.bodyLarge,),
                          const SizedBox(width: 12,),
                          Row(
                            children: [
                              const Icon(Icons.phone,color: Colors.grey,size: 16,),
                              const SizedBox(width: 12.0,),
                              Text('+03911555226-555', style: Theme.of(context).textTheme.bodyMedium,),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              const Icon(Icons.location_history,color: Colors.grey,size: 16,),
                              const SizedBox(width: 12.0,),
                              Expanded(child: Text('Đak Ha, Kon Tum', style: Theme.of(context).textTheme.bodyMedium,softWrap: true,)),
                            ],
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ElevatedButton(onPressed: ()=> Get.to(()=>const SuccessScreen()),
            child: const Text('Checkout')),
      ),    );
  }
}



class MPPayingMethod extends StatelessWidget {
  const MPPayingMethod({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MPSectionHeading(title: 'Payment Method', buttonTitle: 'Change',),
        Row(
          children: [
            MPRoundedContainer(
              height: 35,
              width: 60,
              backgroundColor: Colors.white,
              padding: EdgeInsets.all(8.0),
              child: Image(image: AssetImage('assets/logos/paypal.png'),fit: BoxFit.contain,),
            ),
            SizedBox(width: 12,),
            Text('Paypal')
          ],
        )
      ],
    );
  }
}
