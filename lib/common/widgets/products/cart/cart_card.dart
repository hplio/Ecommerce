import 'package:flutter/material.dart';
import 'package:to_do/common/widgets/img_container/round_img_container.dart';
import 'package:to_do/common/widgets/text/brand_text_vicon.dart';
import 'package:to_do/common/widgets/text/product_text.dart';
import 'package:to_do/utils/constants/colors.dart';

class KCartCard extends StatelessWidget {
  const KCartCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        KImageContainer(
          imgString: 'assets/images/populer_prodect/nike-shoee-2.png',
          bgColor: dark ? TColor.darkerGrey : TColor.light,
          applyBgColor: true,
          hight: 70,
          width: 70,
          padding: const EdgeInsets.all(8),
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const KBrandTitleVerifyIcon(
                brandName: 'Nike',
                maxLine: 1,
              ),
              const ProductText(
                text: 'Green Nike Sport Shoe',
                maxLine: 1,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Color ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'Green ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextSpan(
                      text: 'Size ',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    TextSpan(
                      text: 'EU 38 ',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ),
              
            ],
          ),
        )
      ],
    );
  }
}
