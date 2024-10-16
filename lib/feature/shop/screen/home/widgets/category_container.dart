import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
class MPVerticalImageText extends StatelessWidget {
  const MPVerticalImageText({
    super.key,
    this.isNetworkImage = false,
    required this.image,
    required this.title,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.white,
    this.onTap,
  });
  final bool isNetworkImage;
  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:
      Padding(
        padding: const EdgeInsets.only(right: 16),
        child:Column(
          children: [
            Container(
                height: 56,
                width: 56,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(100)),
                child: Center(
                      child: Image(
                        image: isNetworkImage? NetworkImage(image) : AssetImage(image) as ImageProvider,
                        fit: BoxFit.cover,
                      )),
                ),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ) ,
      ),
    );
  }
}