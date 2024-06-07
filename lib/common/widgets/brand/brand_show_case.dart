import 'package:flutter/material.dart';
import 'package:to_do/common/custom_shap/container_unfixed_hight.dart';
import 'package:to_do/common/widgets/brand/brand_card.dart';
import 'package:to_do/utils/constants/colors.dart';

class KBrandShowCase extends StatelessWidget {
  const KBrandShowCase({
    super.key,
    required this.imgStrings,
  });

  final List<String> imgStrings;
  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return UnFixedHightContainer(
      // hight: 220,
      width: double.infinity,
      borderColor: TColor.darkGrey,
      padding: 16,
      showBorderColor: true,
      color: Colors.transparent,
      margin: const EdgeInsets.only(bottom: 8),
      radius: 16,
      child: Column(
        children: [
          const KBrandCard(showBorder: false),
          Row(
            children: imgStrings
                .map(
                  (imgString) => brandImageContainer(imgString, dark),
                )
                .toList(),
          )
        ],
      ),
    );
  }

  Widget brandImageContainer(String imgString, bool dark) {
    return Expanded(
      child: UnFixedHightContainer(
      // child: CustomCirculerShap(
        color: dark ? TColor.darkerGrey : TColor.light,
        // hight: 100,
        radius: 16,
        // width: 80,
        margin: const EdgeInsets.all(8),
        padding: 16,
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(
            imgString,
          ),
        ),
      ),
    );
  }
}