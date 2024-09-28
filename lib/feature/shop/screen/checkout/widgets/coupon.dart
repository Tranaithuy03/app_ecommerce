import 'package:flutter/material.dart';

import '../../../../../common/widgets/rounded_container.dart';
class MPCoupon extends StatelessWidget {
  const MPCoupon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MPRoundedContainer(
      showBorder: true,
      backgroundColor: Colors.white,
      padding: const EdgeInsets.only(
          top: 8.0, bottom: 8.0, right: 8.0, left: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a coupon code? Enter here!',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),
          SizedBox(
            width: 70,
            child: ElevatedButton(
                onPressed: () {}, child: const Text('Apply')),
          )
        ],
      ),
    );
  }
}