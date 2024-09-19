import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../enum.dart';
import 'brand_title.dart';

class MPBrandTitleVerify extends StatelessWidget {
  const MPBrandTitleVerify({
    super.key,
    required this.title,
    this.size,
  });

  final String title;
  final textSize? size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
            child: MPBrandTitle(
          title: title,
          size: size,
        )),
        const SizedBox(width: 4.0),
        const Icon(
          Iconsax.verify,
          color: Colors.blue,
          size: 12,
        )
      ],
    );
  }
}
