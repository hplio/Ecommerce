import 'package:flutter/material.dart';
import 'package:to_do/utils/constants/colors.dart';

class CustomCirculerShap extends StatelessWidget {
  const CustomCirculerShap({
    super.key,
    this.hight=400,
    this.width = 400,
    this.color = TColor.white,
    this.padding = 0,
    this.radius = 400,
    this.child,
    this.margin,
    this.borderColor = TColor.borderPrimary,
    this.showBorderColor = false,
  });

  final double? hight;
  final double? width;
  final Color color;
  final double padding;
  final double radius;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final Color borderColor;
  final bool showBorderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      margin: margin,
      height: hight,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: showBorderColor ? Border.all(color: borderColor) : null,
        color: color,
      ),
      child: child,
    );
  }
}
