import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/utils/constants/colors.dart';

class KRatingBarIndicator extends StatelessWidget {
  const KRatingBarIndicator({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return RatingBarIndicator(
      itemSize: 20,
      rating: rating,
      unratedColor: dark ? TColor.darkGrey : TColor.grey,
      itemBuilder: (_, __) => const Icon(
        Iconsax.star1,
        color: TColor.primary,
      ),
    );
  }
}
