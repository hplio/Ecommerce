import 'package:flutter/material.dart';
import 'package:to_do/common/curved_edge/curved_edge.dart';

class KCurvedEdgeWidget extends StatelessWidget {
  const KCurvedEdgeWidget({
    super.key, this.child,
  });

 final Widget? child;
 
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: KClipPath(),
      child:child
    );
  }
}
