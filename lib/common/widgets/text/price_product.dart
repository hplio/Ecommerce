import 'package:flutter/material.dart';

class PriceProduct extends StatelessWidget {
  const PriceProduct({
    super.key,
    this.curruncy = '\$',
    required this.price,
    this.isLarge = false,
    this.isLineThrough = false,
    this.maxLine=1,
  });

  final String curruncy;
  final String price;
  final bool isLarge;
  final bool isLineThrough;
  final int? maxLine;
  @override
  Widget build(BuildContext context) {
    return Text(
      curruncy + price,
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      style: isLarge
          ? Theme.of(context).textTheme.headlineMedium!.apply(
              decoration: isLineThrough ? TextDecoration.lineThrough : null)
          : Theme.of(context).textTheme.titleLarge!.apply(
              decoration: isLineThrough ? TextDecoration.lineThrough : null),
    );
  }
}
