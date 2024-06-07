import 'package:flutter/material.dart';

class ProductText extends StatelessWidget {
  const ProductText({
    super.key,
    required this.text,
    this.textAlign,
    this.textSmall = false,
    this.maxLine=2,
  });

  final String text;
  final int? maxLine;
  final bool textSmall;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: textSmall
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
    );
  }
}
