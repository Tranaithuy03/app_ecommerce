import 'package:flutter/material.dart';
class MPVerticalImageText extends StatelessWidget {
  const MPVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.white,
    this.onTap,
  });

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
                child: Image.asset(image, fit: BoxFit.cover,color: Colors.black,)
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