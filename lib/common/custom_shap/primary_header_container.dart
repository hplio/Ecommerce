import 'package:flutter/material.dart';
import 'package:to_do/common/curved_edge/curved_edge_widget.dart';
import 'package:to_do/common/custom_shap/container_shap.dart';
import 'package:to_do/utils/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
    this.hight,
  });

  final Widget child;
  final double? hight;
  @override
  Widget build(BuildContext context) {
    return KCurvedEdgeWidget(
      child: Container(
        color: TColor.primary,
        padding: EdgeInsets.zero,
        child: SizedBox(
          height: hight,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: CustomCirculerShap(
                  color: TColor.white.withOpacity(.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -270,
                child: CustomCirculerShap(
                  color: TColor.white.withOpacity(.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
