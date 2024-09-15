import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
class MPSearchContainer extends StatelessWidget {
  const MPSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal_copy,
    this.showBackground = true,
    this.showBorder = true,
  });

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
            color: showBackground
                ? dark
                ? Colors.black
                : Colors.white
                : Colors.transparent,
            borderRadius: BorderRadius.circular(16.0),
            border: showBorder ? Border.all(color: Colors.grey) : null),
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xff777777),
            ),
            const SizedBox(width: 14.0),
            Text(
              text,
              style: Theme.of(context).textTheme.bodySmall,
            )
          ],
        ),
      ),
    );
  }
}