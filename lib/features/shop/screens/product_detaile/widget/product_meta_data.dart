import 'package:flutter/material.dart';
import 'package:to_do/common/widgets/img_container/circuler_img_container.dart';
import 'package:to_do/common/widgets/text/brand_text_vicon.dart';
import 'package:to_do/common/widgets/text/price_product.dart';
import 'package:to_do/common/widgets/text/product_text.dart';
import 'package:to_do/utils/constants/colors.dart';
import 'package:to_do/utils/constants/enums.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: TColor.secondery.withOpacity(.8),
              ),
              child: Text(
                '25%',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: TColor.black),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Text(
              '\$250',
              style: Theme.of(context).textTheme.titleSmall!.apply(
                    decoration: TextDecoration.lineThrough,
                  ),
            ),
            const SizedBox(
              width: 16,
            ),
            const PriceProduct(
              price: '170',
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(
          height: 16 / 1.5,
        ),
        const ProductText(
          text: 'Green Nike sport shoe',
        ),
        const SizedBox(
          height: 16 / 1.5,
        ),
        Row(
          children: [
            const Text('Status'),
            const SizedBox(
              width: 16,
            ),
            Text(
              'In Stock',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(
          width: 16,
        ),
        Row(
          children: [
            KCirculerImage(
              width: 32,
              hight: 32,
              imgString: 'assets/images/populer_prodect/shoe-3.png',
              imgColor: dark ? TColor.white : TColor.black,
            ),
            const Flexible(
              child: KBrandTitleVerifyIcon(
                brandName: 'Nike',
                brandTextSize: TextSize.midum,
              ),
            ),
          ],
        ),
        
      ],
    );
  }
}
