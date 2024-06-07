import 'package:flutter/material.dart';
import 'package:to_do/utils/constants/colors.dart';

class UnFixedHightContainer extends StatelessWidget {
  const UnFixedHightContainer({
    super.key,
    this.hight,
    this.width,
    this.color = TColor.white,
    this.padding = 0,
    this.radius = 16,
    this.child,
    this.margin,
    this.borderColor = TColor.borderPrimary,
    this.showBorderColor = false,
    this.isPaddingOnly = false,
    this.top,
    this.bottom,
    this.left,
    this.right,
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
  final bool isPaddingOnly;
  final double? top;
  final double? bottom;
  final double? left;
  final double? right;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: isPaddingOnly
          ? EdgeInsets.only(
              top: top!, bottom: bottom!, left: left!, right: right!)
          : EdgeInsets.all(padding),
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
