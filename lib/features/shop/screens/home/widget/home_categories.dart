import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/common/widgets/horizontal_img_text/image_text.dart';
import 'package:to_do/features/shop/screens/sub_category/sub_category.dart';

class HomeCategories extends StatelessWidget {
  const HomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 6,
        itemBuilder: (_, index) {
          return  ImageTextWidget(
            onPress: ()=>Get.to(()=>const SubCategoty()),
            imageString:
                'assets/images/populer_prodect/shoe-3.png',
            text: 'Shoe',
          );
        },
      ),
    );
  }
}
