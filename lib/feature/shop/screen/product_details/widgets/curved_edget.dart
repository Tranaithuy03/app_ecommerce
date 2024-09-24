import 'package:flutter/material.dart';

import '../../home/widgets/curved_edges.dart';
class MPCurvedEdgetsWidget extends StatelessWidget {
  const MPCurvedEdgetsWidget({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MPCustomCurvedEdges(),
      child: child,
    );
  }
}