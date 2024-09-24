import 'package:flutter/material.dart';
import 'circular_container.dart';
import 'curved_edges.dart';
class MPPrimaryHeaderContainer extends StatelessWidget {
  const MPPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MPCustomCurvedEdges(),
      child: Container(
        color: Colors.blueAccent,
        padding: const EdgeInsets.all(0),
        child: Container(
          //height: 400,
          child: Stack(
            children: [
              const Positioned(
                top: -150,
                right: -250,
                child: CircularContainer(),
              ),
              const Positioned(
                top: 100,
                right: -300,
                child: CircularContainer(),
              ),
              child
            ],
          ),
        ),
      ),
    );
  }
}
