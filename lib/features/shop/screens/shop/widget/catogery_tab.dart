import 'package:flutter/material.dart';
import 'package:to_do/common/widgets/brand/brand_show_case.dart';
import 'package:to_do/common/widgets/layout/grid_layout.dart';
import 'package:to_do/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:to_do/common/widgets/text/heading_text.dart';

class CatagoryTab extends StatelessWidget {
  const CatagoryTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              const KBrandShowCase(
                imgStrings: [
                  'assets/images/populer_prodect/nike-shoe-1.png',
                  'assets/images/populer_prodect/nike-shoee-2.png',
                  'assets/images/populer_prodect/nike-shoe-1.png',
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              KSectionHeading(
                title: 'You might like',
                onPress: () {},
              ),
              const SizedBox(
                height: 12,
              ),
              GridLayOut(
                itemCount: 4,
                itemBuilder: (_, index) => const ProductCardVertical(),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
