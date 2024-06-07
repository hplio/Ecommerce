import 'package:flutter/material.dart';
import 'package:to_do/utils/constants/colors.dart';

class KIconContainer extends StatelessWidget {
  const KIconContainer({
    super.key,
    this.onPress,
    this.width,
    this.height,
    this.size,
    this.bgColor,
    this.iconColor,
    this.iconInfo,
  });

  final void Function()? onPress;
  final double? width;
  final double? height;
  final double? size;
  final Color? bgColor;
  final Color? iconColor;
  final IconData? iconInfo;

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: bgColor != null
            ? bgColor!
            : dark
                ? TColor.black.withOpacity(.9)
                : TColor.white.withOpacity(.9),
      ),
      child: IconButton(
        onPressed: onPress,
        icon: Center(
          child: Icon(
            iconInfo,
            color: iconColor,
            size: size,
          ),
        ),
      ),
    );
  }
}
