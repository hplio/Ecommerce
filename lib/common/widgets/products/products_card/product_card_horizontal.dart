import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/common/custom_shap/container_unfixed_hight.dart';
import 'package:to_do/common/widgets/icon_btn_container/icon_btn_container.dart';
import 'package:to_do/common/widgets/img_container/round_img_container.dart';
import 'package:to_do/common/widgets/text/brand_text_vicon.dart';
import 'package:to_do/common/widgets/text/price_product.dart';
import 'package:to_do/common/widgets/text/product_text.dart';
import 'package:to_do/utils/constants/colors.dart';

class ProductCardHorizontal extends StatelessWidget {
  const ProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: dark ? TColor.darkerGrey : TColor.softGrey,
      ),
      child: Row(
        children: [
          UnFixedHightContainer(
            hight: 120,
            color: dark ? TColor.dark : TColor.light,
            padding: 8,
            child: Stack(
              children: [
                const SizedBox(
                  height: 120,
                  width: 120,
                  child: KImageContainer(
                    imgString: 'assets/images/populer_prodect/nike-shoe-1.png',
                  ),
                ),
                Positioned(
                  top: 8,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: KIconContainer(
                    iconColor: Colors.red,
                    iconInfo: Iconsax.heart5,
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductText(
                    text: 'Blue Nike importent for shows',
                    textSmall: true,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const KBrandTitleVerifyIcon(
                    brandName: 'Nike',
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Flexible(
                        child: PriceProduct(
                          price: '250.0',
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(16),
                            ),
                            color: TColor.dark),
                        child: const SizedBox(
                          width: 32 * 1.2,
                          height: 32 * 1.2,
                          child: Center(
                            child: Icon(
                              Iconsax.add,
                              color: TColor.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}



// im-24 ds-24 sbi-16 sbs-32 CL-16 md-16 sbif-16 sm-8

