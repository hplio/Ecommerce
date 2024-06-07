import 'package:flutter/material.dart';
import 'package:to_do/utils/constants/colors.dart';

class DeviderText extends StatelessWidget {
  const DeviderText({
    super.key, required this.deviderText,
  });

  final String deviderText;
  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            thickness: 1,
            color: dark ? TColor.darkGrey : TColor.grey,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          deviderText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            thickness: 1,
            color: dark ? TColor.darkGrey : TColor.grey,
            indent: 5,
            endIndent: 60,
          ),
        ),
      ],
    );
  }
}
