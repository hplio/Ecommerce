import 'package:flutter/material.dart';
import 'package:to_do/utils/constants/enums.dart';

class BrandTextOnly extends StatelessWidget {
  const BrandTextOnly({
    super.key,
    required this.brandName,
    this.maxLine = 1,
    this.color,
    this.textAlign = TextAlign.center,
    this.brandTextSize=TextSize.small,
  });

  final String brandName;
  final int? maxLine;
  final Color? color;
  final TextAlign? textAlign;
  final TextSize brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      // 'Nike',
      brandName,
      textAlign: textAlign,
      // style: Theme.of(context).textTheme.labelMedium,
      style: brandTextSize == TextSize.small
          ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
          : brandTextSize == TextSize.midum
              ? Theme.of(context).textTheme.bodyLarge!.apply(color: color)
              : brandTextSize == TextSize.large
                  ? Theme.of(context).textTheme.titleLarge!.apply(color: color)
                  : Theme.of(context).textTheme.bodyMedium!.apply(color: color),
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
    );
  }
}
