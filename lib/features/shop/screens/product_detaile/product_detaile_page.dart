import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/common/widgets/text/heading_text.dart';
import 'package:to_do/features/shop/screens/product_detaile/widget/bottom_navigation_pd.dart';
import 'package:to_do/features/shop/screens/product_detaile/widget/product_attribute.dart';
import 'package:to_do/features/shop/screens/product_detaile/widget/product_img_slider.dart';
import 'package:to_do/features/shop/screens/product_detaile/widget/product_meta_data.dart';
import 'package:to_do/features/shop/screens/product_detaile/widget/product_rate_share.dart';
import 'package:readmore/readmore.dart';
import 'package:to_do/features/shop/screens/product_review/product_review_page.dart';
import 'package:to_do/utils/constants/colors.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomNavigationPd(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const KProductImgSlider(),
            Padding(
              padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
              child: Column(
                children: [
                  const KProductRateShare(),
                  const ProductMetaData(),
                  const ProductAttribut(),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text('Checkout'),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const KSectionHeading(
                    title: 'Description',
                    padding: EdgeInsets.all(0),
                    showTextButton: false,
                  ),
                  const SizedBox(height: 16 / 2),
                  const ReadMoreText(
                    'This is description of the product you have click it is visibal until 4-line so if you have read more click on show more option so that you can read whole item ',
                    trimExpandedText: 'Show less',
                    trimCollapsedText: 'show more',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    moreStyle: TextStyle(
                        color: TColor.primary,
                        fontWeight: FontWeight.w800,
                        fontSize: 14),
                    lessStyle: TextStyle(
                        color: TColor.primary,
                        fontWeight: FontWeight.w800,
                        fontSize: 14),
                  ),
                  const Divider(),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const KSectionHeading(
                        padding: EdgeInsets.all(0),
                        title: 'Reviews(200)',
                        showTextButton: false,
                      ),
                      IconButton(
                        onPressed: ()=>Get.to(()=>const ProductReviewPage()),
                        icon: const Icon(
                          Iconsax.arrow_right_3,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 16 / 2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


