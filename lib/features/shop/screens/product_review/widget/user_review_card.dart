import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:to_do/common/widgets/products/rating/rating_bar_indicator.dart';
import 'package:to_do/utils/constants/colors.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage:
                      AssetImage('assets/images/Profile_img/User-img.png'),
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  'Hp',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert))
          ],
        ),
        const SizedBox(
          height: 16 / 2,
        ),
        Row(
          children: [
            const KRatingBarIndicator(rating: 4),
            const SizedBox(
              width: 16,
            ),
            Text(
              'Nov 11, 2024',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: 16 / 2,
        ),
        const ReadMoreText(
          'the user interface of the app is qulite institutive. i was able to navigate and make purchases seamlessly. Great job! ',
          trimLines: 1,
          trimMode: TrimMode.Line,
          trimExpandedText: 'Show less',
          trimCollapsedText: 'Show more',
          moreStyle: TextStyle(
              fontSize: 14, color: TColor.primary, fontWeight: FontWeight.w800),
          lessStyle: TextStyle(
              fontSize: 14, color: TColor.primary, fontWeight: FontWeight.w800),
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: dark ? TColor.darkerGrey : TColor.grey,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Hp\'s Store',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '12 Nov, 2024',
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                const ReadMoreText(
                  'the user interface of the app is qulite institutive. i was able to navigate and make purchases seamlessly. Great job! ',
                  trimLines: 1,
                  trimMode: TrimMode.Line,
                  trimExpandedText: 'Show less',
                  trimCollapsedText: 'Show more',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      color: TColor.primary,
                      fontWeight: FontWeight.w800),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      color: TColor.primary,
                      fontWeight: FontWeight.w800),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 32,
        ),
      ],
    );
  }
}


