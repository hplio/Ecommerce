import 'package:flutter/material.dart';
import 'package:to_do/utils/constants/colors.dart';

class KImageContainer extends StatelessWidget {
  const KImageContainer({
    super.key,
    required this.imgString,
    this.width,
    this.hight,
    this.boxFit = BoxFit.contain,
    this.bgColor = TColor.light,
    this.isNetworkImage = false,
    this.applyImageRadius = true,
    this.onPress,
    this.padding,
    this.border,
    this.borderRadius = 16.0,
    this.applyBgColor = false,
  });

  final String imgString;
  final double? width, hight;
  final BoxFit? boxFit;
  final Color? bgColor;
  final bool isNetworkImage;
  final bool applyImageRadius;
  final bool applyBgColor;
  final void Function()? onPress;
  final EdgeInsetsGeometry? padding;
  final BoxBorder? border;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: padding,
        height: hight,
        width: width,
        decoration: BoxDecoration(
          color: applyBgColor
              ? bgColor
              : dark
                  ? TColor.dark
                  : bgColor,
          border: border,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? BorderRadius.circular(borderRadius)
              : BorderRadius.zero,
          child: Image(
            image: isNetworkImage
                ? NetworkImage(imgString)
                : AssetImage(
                    imgString,
                  ) as ImageProvider,
            fit: boxFit,
          ),
        ),
      ),
    );
  }
}
