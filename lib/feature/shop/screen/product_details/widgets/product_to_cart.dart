import 'package:app_my_pham/common/widgets/icon_container.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class MPProductBottomBar extends StatelessWidget {
  const MPProductBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration:  BoxDecoration(
        border: Border.all(color: Colors.grey),
          borderRadius: const BorderRadius.only(
        topRight: Radius.circular(16.0),
        topLeft: Radius.circular(16.0),
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const MPIcon(
                icon: Iconsax.minus_copy,
                height: 40,
                width: 40,
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
                height: 40,
                width: 40,
                backgroundColor: Colors.black,
                color: Colors.white,
              )
            ],
          ),
          ElevatedButton(onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                backgroundColor: Colors.black,
                side: const BorderSide(color: Colors.black54)
              ),
              child: const Text('Add to cart'))
        ],
      ),
    );
  }
}
