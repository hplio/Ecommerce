import 'package:flutter/material.dart';
import 'package:to_do/utils/constants/colors.dart';

class TermCheckBox extends StatelessWidget {
  const TermCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: 'I agree to ',
              style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
            text: 'Privacy Police',
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  decoration: TextDecoration.underline,
                  color: dark ? TColor.white : TColor.primary,
                  decorationColor: dark ? TColor.white : TColor.primary,
                ),
          ),
          TextSpan(text: ' and ', style: Theme.of(context).textTheme.bodySmall),
          TextSpan(
            text: 'Terms of use',
            style: Theme.of(context).textTheme.bodyMedium!.apply(
                  decoration: TextDecoration.underline,
                  color: dark ? TColor.white : TColor.primary,
                  decorationColor: dark ? TColor.white : TColor.primary,
                ),
          ),
        ],
      ),
    );
  }
}
