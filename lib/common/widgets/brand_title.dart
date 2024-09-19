import 'package:flutter/material.dart';

import '../enum.dart';

class MPBrandTitle extends StatelessWidget {
  const MPBrandTitle(
      {super.key, required this.title, this.size, this.color, this.maxLine});

  final String title;
  final textSize? size;
  final Color? color;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      maxLines: maxLine ,
      overflow: TextOverflow.ellipsis,
      style: size == textSize.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : size == textSize.medium
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
              : size == textSize.large
                  ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
                  : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
    );
  }
}
