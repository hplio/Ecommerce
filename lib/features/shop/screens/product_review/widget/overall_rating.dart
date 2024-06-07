import 'package:flutter/material.dart';
import 'package:to_do/features/shop/screens/product_review/widget/liner_progress_indicator.dart';

class KOverallRating extends StatelessWidget {
  const KOverallRating({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '4.5',
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        const Expanded(
          flex: 7,
          child: Column(
            children: [
              KProgressIndicatorL(
                rating: '5',
                ratingValue: 1,
              ),
              KProgressIndicatorL(
                rating: '4',
                ratingValue: .7,
              ),
              KProgressIndicatorL(
                rating: '3',
                ratingValue: .5,
              ),
              KProgressIndicatorL(
                rating: '2',
                ratingValue: .3,
              ),
              KProgressIndicatorL(
                rating: '1',
                ratingValue: .1,
              ),
            ],
          ),
        )
      ],
    );
  }
}
