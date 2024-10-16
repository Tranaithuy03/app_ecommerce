import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MPRoundImage extends StatelessWidget {
  const MPRoundImage({
    super.key,
    this.isNetworkImage = false,
    this.isBorder = true,
    this.padding,
    required this.image,
    this.applyImageRadius = true,
    this.backgroundColor = Colors.white,
    this.fit = BoxFit.contain,
    this.width,
    this.height,
    this.onPressed,
    this.radius = 100, this.border, this.overlayColor,
  });

  final bool isNetworkImage;
  final bool isBorder;
  final bool applyImageRadius;
  final Color backgroundColor;
  final Color? overlayColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final String image;
  final double? width, height;
  final VoidCallback? onPressed;
  final double radius;
  final Border? border;

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
              border: border,
              borderRadius: BorderRadius.circular(radius)),
          child:  ClipRRect(
            borderRadius: applyImageRadius?BorderRadius.circular(radius): BorderRadius.zero,
            child: Center(
              //borderRadius: applyImageRadius?BorderRadius.circular(radius): BorderRadius.zero,
                child: isNetworkImage ?
                CachedNetworkImage(
                  fit: fit,
                  imageUrl: image,
                  progressIndicatorBuilder: (context, url,
                      progress) => const MPShimmerEffect(width: 80, height: 80),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ) :
                Image(
                  image: AssetImage(image),
                  fit: fit,
                )),
          )),
    );
  }
}

class MPShimmerEffect extends StatelessWidget {
  const MPShimmerEffect(
      {super.key, required this.width, required this.height, this.radius = 100, this.color});

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: color ?? Colors.white,
              borderRadius: BorderRadius.circular(radius)
          ),
        ));
  }
}
