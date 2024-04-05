import 'package:flutter/material.dart';
import 'package:shoe_spotter/core/widgets/custom_curved_edges.dart';

class CurvedEdgeWidget extends StatelessWidget {
  final Widget? child;
  const CurvedEdgeWidget({
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: CustomCurvedEdges(),
      child: child,
    );
  }
}
