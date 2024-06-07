import 'package:flutter/material.dart';
import 'package:to_do/common/custom_shap/container_unfixed_hight.dart';
import 'package:to_do/common/widgets/chips/choice_chip.dart';
import 'package:to_do/common/widgets/text/heading_text.dart';
import 'package:to_do/common/widgets/text/price_product.dart';
import 'package:to_do/common/widgets/text/product_text.dart';
import 'package:to_do/utils/constants/colors.dart';

class ProductAttribut extends StatelessWidget {
  const ProductAttribut({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      children: [
        UnFixedHightContainer(
          width: double.infinity,
          padding: 16,
          radius: 16,
          color: dark ? TColor.darkerGrey : TColor.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const KSectionHeading(
                    padding: EdgeInsets.all(0.0),
                    title: 'Variation',
                    showTextButton: false,
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const ProductText(
                            text: 'Price : ',
                            textSmall: true,
                          ),
                          Text(
                            '\$25',
                            style:
                                Theme.of(context).textTheme.titleMedium!.apply(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const PriceProduct(price: '20'),
                        ],
                      ),
                      Row(
                        children: [
                          const ProductText(
                            text: 'Stock : ',
                            textSmall: true,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
              const ProductText(
                text:
                    'This is the discription of the product and it can go up to more 4 line.',
                maxLine: 4,
                textSmall: true,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const KSectionHeading(
              padding: EdgeInsets.all(0),
              title: 'Colors',
              showTextButton: false,
            ),
            const SizedBox(
              height: 16 / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                KChoiceChip(
                  value: 'Teal',
                  selected: true,
                  onSelected: (value) {},
                ),
                KChoiceChip(
                  value: 'Red',
                  selected: false,
                  onSelected: (value) {},
                ),
                KChoiceChip(
                  value: 'Blue',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const KSectionHeading(
              padding: EdgeInsets.all(0),
              title: 'Size',
              showTextButton: false,
            ),
            const SizedBox(
              height: 16 / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                KChoiceChip(
                  value: 'EU 34',
                  selected: false,
                  onSelected: (value) {},
                ),
                KChoiceChip(
                  value: 'EU 36',
                  selected: true,
                  onSelected: (value) {},
                ),
                KChoiceChip(
                  value: 'EU 38',
                  selected: false,
                  onSelected: (value) {},
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

// im-24 ds-24 sbi-16 sbs-32
