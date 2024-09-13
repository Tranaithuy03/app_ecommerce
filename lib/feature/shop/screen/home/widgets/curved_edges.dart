import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MPCustomCurvedEdges extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    //bo lần 1
    final firstCurve = Offset(0, size.height-20 );
    final lastCurve = Offset(30, size.height-20 );
    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, lastCurve.dx, lastCurve.dy);
    //kẻ ngang
    path.lineTo(size.width-30, size.height-20);
    // bo lần 2
    final secondCurve = Offset(size.width, size.height-20 );
    final secondLastCurve = Offset(size.width,size.height );
    path.quadraticBezierTo(secondCurve.dx, secondCurve.dy, secondLastCurve.dx, secondLastCurve.dy);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}