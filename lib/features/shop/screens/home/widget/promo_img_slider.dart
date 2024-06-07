import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/common/custom_shap/container_shap.dart';
import 'package:to_do/features/shop/controllers/home_conteroller.dart';
import 'package:to_do/utils/constants/colors.dart';

class KImageSlider extends StatelessWidget {
  const KImageSlider({
    super.key,
    this.imgList, 
  });

  final List<Widget>? imgList;

  @override
  Widget build(BuildContext context) {
    final conteroller = Get.put(HomeConteroller());

    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) {
              conteroller.updatePageIndicter(index);
            },
          ),
          items: imgList,
        ),
        const SizedBox(
          height: 8,
        ),
        Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < imgList!.length; i++)
                CustomCirculerShap(
                  hight: 4,
                  margin: const EdgeInsets.only(right: 5),
                  width: 16,
                  color: (conteroller.curuntPage.value) == i
                      ? TColor.primary
                      : TColor.grey,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
