import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/common/custom_shap/container_shap.dart';
import 'package:to_do/common/styles/kshadow_style.dart';
import 'package:to_do/common/widgets/icon_btn_container/icon_btn_container.dart';
import 'package:to_do/common/widgets/img_container/round_img_container.dart';
import 'package:to_do/common/widgets/text/brand_text_vicon.dart';
import 'package:to_do/common/widgets/text/price_product.dart';
import 'package:to_do/common/widgets/text/product_text.dart';
import 'package:to_do/features/shop/screens/product_detaile/product_detaile_page.dart';
import 'package:to_do/utils/constants/colors.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return GestureDetector(
      onTap: ()=>Get.to(const ProductDetailScreen()),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [ShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(16),
          color: dark ? TColor.darkerGrey : TColor.white,
        ),
        child: Column(
          children: [
            CustomCirculerShap(
              hight: 180,
              padding: 8.0,
              radius: 16,
              color: dark ? TColor.dark : TColor.light,
              child: Stack(
                children: [
                  const KImageContainer(
                    applyImageRadius: true,
                    imgString: 'assets/images/populer_prodect/shoe-2.png',
                    borderRadius: 16,
                  ),
                  Positioned(
                    top: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
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
            const SizedBox(
              height: 4,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductText(
                    textSmall: true,
                    text: 'Leadies shoe',
                    textAlign: TextAlign.left,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  KBrandTitleVerifyIcon(
                    brandName: 'Nike',
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: PriceProduct(
                    price: '20.5',
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
            ),
          ],
        ),
      ),
    );
  }
}





// 12-tl,br-16 ,lg-32
// gv-16

// sm-8 xs-4