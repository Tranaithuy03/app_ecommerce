import 'package:flutter/material.dart';
class MPIcon extends StatelessWidget {
  const MPIcon({
    super.key,
    this.width,
    this.height,
    this.size = 24,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onPressed,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: backgroundColor ??
            (dark
                ? Colors.black.withOpacity(0.9)
                : Colors.white.withOpacity(0.9)),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Center(
        child: Icon(
              icon,
              color: color,
              size: size,
            )),
    );
  }
}
