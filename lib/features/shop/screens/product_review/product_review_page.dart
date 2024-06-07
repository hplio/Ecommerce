import 'package:flutter/material.dart';
import 'package:to_do/common/custom_appbar/custom_appbar.dart';
import 'package:to_do/features/shop/screens/product_review/widget/overall_rating.dart';
import 'package:to_do/common/widgets/products/rating/rating_bar_indicator.dart';
import 'package:to_do/features/shop/screens/product_review/widget/user_review_card.dart';

class ProductReviewPage extends StatelessWidget {
  const ProductReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CAppBar(
        title: Text('Reviews & Ratings'),
        leading: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Rating and reviews are verified and are from people who use the same type of device that you use',
              ),
              const SizedBox(
                height: 16,
              ),
              const KOverallRating(),
              const KRatingBarIndicator(
                rating: 4.5,
              ),
              Text(
                '10,765',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(
                height: 32,
              ),
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
             
            ],
          ),
        ),
      ),
    );
  }
}




