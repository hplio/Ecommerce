import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/common/custom_shap/primary_header_container.dart';
import 'package:to_do/common/widgets/layout/grid_layout.dart';
import 'package:to_do/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:to_do/common/widgets/img_container/round_img_container.dart';
import 'package:to_do/common/widgets/search_container/search_container.dart';
import 'package:to_do/common/widgets/text/heading_text.dart';
import 'package:to_do/features/shop/screens/all_product/view_all_products.dart';
import 'package:to_do/features/shop/screens/home/widget/home_appbar.dart';
import 'package:to_do/features/shop/screens/home/widget/home_categories.dart';
import 'package:to_do/features/shop/screens/home/widget/promo_img_slider.dart';
import 'package:to_do/utils/constants/colors.dart';
import 'package:to_do/utils/constants/text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              // hight: 400,
              child: Column(
                children: [
                  const HomeAppBar(),
                  const SizedBox(
                    height: 32.0,
                  ),
                  const CSearchBar(
                    text: KtextString.searchBarText,
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Column(
                      children: [
                        KSectionHeading(
                          title: 'Populer Products',
                          onPress: (){},
                          showTextButton: false,
                          textColor: TColor.white,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        const HomeCategories()
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  const KImageSlider(
                    imgList: [
                      KImageContainer(
                        imgString: 'assets/images/banner_img/banner_img-1.jpg',
                      ),
                      KImageContainer(
                        imgString: 'assets/images/banner_img/banner_img-2.jpg',
                      ),
                      KImageContainer(
                        imgString: 'assets/images/banner_img/banner_img-3.jpg',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                   KSectionHeading(
                    title: 'Populer Products',
                    onPress: ()=>Get.to(()=>const ViewAllProductScreen()),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GridLayOut(
                    itemBuilder: (_, index) => const ProductCardVertical(),
                    itemCount: 2,
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


// 16-ImagR