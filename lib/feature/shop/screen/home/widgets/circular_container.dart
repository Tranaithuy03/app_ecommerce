import 'package:flutter/material.dart';
class CircularContainer extends StatelessWidget {
  const CircularContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 400,
      padding: const EdgeInsets.all(0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(400), color: Colors.white12),
    );
  }
}
