import 'package:app_my_pham/common/widgets/rounded_container.dart';
import 'package:app_my_pham/feature/shop/screen/home/widgets/appbar.dart';
import 'package:app_my_pham/feature/shop/screen/order/widgets/order_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MPCustomAppBar(
        title: Text(
          'My Orders',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        isShowBackArrow: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(24),
          child: ListView.separated(
            shrinkWrap: true,
              itemBuilder: (context, index) => const MPOrderItem(),
              separatorBuilder: (context, index) => const SizedBox(height: 16.0,),
              itemCount: 10)),
    );
  }
}


