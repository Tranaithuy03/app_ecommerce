import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../../../../../common/widgets/rounded_container.dart';
class MPOrderItem extends StatelessWidget {
  const MPOrderItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MPRoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.all(16),
      backgroundColor: Colors.grey.withOpacity(0.1),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Iconsax.ship_copy,
                size: 24,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Processing',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: Colors.blue),
                    ),
                    Text(
                      '07 Nov 2021',
                      style: Theme.of(context).textTheme.headlineSmall,
                    )
                  ],
                ),
              ),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.keyboard_arrow_right))
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    const Icon(
                      Iconsax.tag_2_copy,
                      size: 24,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(
                            '#15615',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    const Icon(
                      Iconsax.calendar_1_copy,
                      size: 24,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shipping Date',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(
                            '03 Feb 2024',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}