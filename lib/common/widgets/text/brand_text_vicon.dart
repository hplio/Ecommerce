import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/common/widgets/text/brand_text_only.dart';
import 'package:to_do/utils/constants/colors.dart';
import 'package:to_do/utils/constants/enums.dart';

class KBrandTitleVerifyIcon extends StatelessWidget {
  const KBrandTitleVerifyIcon({
    super.key,
    required this.brandName,
    this.maxLine = 1,
    this.tColor,
    this.textAlign = TextAlign.center,
    this.brandTextSize = TextSize.small,
    this.iconColor=TColor.primary,
  });

  final String brandName;
  final int? maxLine;
  final Color? tColor;
  final Color? iconColor;
  final TextAlign? textAlign;
  final TextSize brandTextSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: BrandTextOnly(
            brandName: brandName,
            maxLine: maxLine,
            color: tColor,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Icon(
          Iconsax.verify5,
          color: iconColor,
          size: 16,
        )
      ],
    );
  }
}
