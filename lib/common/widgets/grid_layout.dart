import 'package:flutter/material.dart';
class MPGridLayout extends StatelessWidget {
  const MPGridLayout({
    super.key,
    required this.itemCount,
    required this.itemBuilder, this.mainAxisExtent = 300,
  });

  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  final double mainAxisExtent;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: itemCount,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
            mainAxisExtent: mainAxisExtent),
        itemBuilder: itemBuilder
    );
  }
}