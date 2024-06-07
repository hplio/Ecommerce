import 'package:flutter/material.dart';

class KCheckOutBiling extends StatelessWidget {
  const KCheckOutBiling({
    super.key,
    required this.title_1,
    required this.title_2,
    this.title_1Style,
    this.title_2Style,
  });

  final String title_1;
  final String title_2;
  final TextStyle? title_1Style;
  final TextStyle? title_2Style;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title_1,
          style: title_1Style,
        ),
        Text(
          title_2,
          style: title_2Style,
        ),
      ],
    );
  }
}
