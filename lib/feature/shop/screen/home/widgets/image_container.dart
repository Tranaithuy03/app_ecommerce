import 'package:flutter/material.dart';
class MPRoundImage extends StatelessWidget {
  const MPRoundImage({
    super.key,
    this.isNetworkImage = false,
    this.isBorder = true,
    this.padding,
    required this.image,
    this.applyImageRadius=true,
    this.backgroundColor= Colors.white,
    this.fit=BoxFit.contain,
    this.width,
    this.height,
    this.onPressed,
    this.radius=16.0,
  });

  final bool isNetworkImage;
  final bool isBorder;
  final bool applyImageRadius;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final String image;
  final double? width, height;
  final VoidCallback? onPressed;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: width,
          height: height,
          padding: padding,
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(radius)),
          child: ClipRRect(
              borderRadius: applyImageRadius?BorderRadius.circular(radius): BorderRadius.zero,
              child: Image(
                image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
                fit: fit,
              ))),
    );
  }
}