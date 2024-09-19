import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
class MPCartCounterIcon extends StatelessWidget {
  const MPCartCounterIcon({
    super.key,
    this.number='0',
    this.onPressed,
    this.colorIcon,
  });

  final String number;
  final VoidCallback? onPressed;
  final Color? colorIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
      IconButton(
          onPressed: onPressed,
          icon: Icon(
            Iconsax.shopping_bag_copy,
            color: colorIcon,
          )),
      Positioned(
        right: 0,
        child: Container(
          height: 20,
          width: 20,
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(100)),
          child: Center(
              child: Text(
                number,
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: Colors.white, fontSizeFactor: 1),
              )),
        ),
      )
    ]);
  }
}
