import 'package:flutter/material.dart';
class MPSectionHeading extends StatelessWidget {
  const MPSectionHeading({
    super.key,
    this.textColor,
    this.onPressed,
    this.showActionButton= true,
    required this.title,
    this.buttonTitle = 'View all',
  });

  final Color? textColor;
  final VoidCallback? onPressed;
  final bool showActionButton;
  final String title, buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonTitle))
      ],
    );
  }
}