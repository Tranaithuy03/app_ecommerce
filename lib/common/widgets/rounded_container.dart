import 'package:flutter/material.dart';

class MPRoundedContainer extends StatelessWidget {
  const MPRoundedContainer({
    super.key,
    this.width,
    this.height,
    this.radius=16.0,
    this.padding,
    this.margin,
    this.backgroundColor=Colors.white10,
    this.child,
    this.showBorder= false,
    this.borderColor =Colors.white38
  });

  final double? width, height;
  final double radius;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color backgroundColor;
  final Widget? child;
  final bool showBorder;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder? Border.all(color: borderColor):null
      ),
      child: child,
    );
  }

}