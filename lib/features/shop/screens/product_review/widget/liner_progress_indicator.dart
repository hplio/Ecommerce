import 'package:flutter/material.dart';
import 'package:to_do/utils/constants/colors.dart';
import 'package:to_do/utils/constants/size.dart';

class KProgressIndicatorL extends StatelessWidget {
  const KProgressIndicatorL({
    super.key,
    required this.rating,
    required this.ratingValue,
  });

  final String rating;
  final double ratingValue;

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            rating,
            // '5',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: KSizeScreen.getScreenWidth(context) * .8,
            child: LinearProgressIndicator(
              value: ratingValue,
              backgroundColor:dark?TColor.darkGrey: TColor.grey,
              minHeight: 8,
              borderRadius: BorderRadius.circular(8),
              valueColor: const AlwaysStoppedAnimation(
                TColor.primary,
              ),
            ),
          ),
        )
      ],
    );
  }
}
