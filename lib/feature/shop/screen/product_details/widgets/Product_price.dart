import 'package:flutter/material.dart';
class MPProducPriceText extends StatelessWidget {
  const MPProducPriceText({
    super.key,
    required this.price,
    this.maxLines = 1,
    this.isLarge = false,
    this.isLineThrough = false,
  });

  final String price;
  final int maxLines;
  final bool isLarge;
  final bool isLineThrough;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$priceđ',
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
          decoration: isLineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleSmall!.apply(
          decoration: isLineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
