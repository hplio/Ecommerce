import 'package:flutter/material.dart';
import 'package:to_do/common/custom_shap/container_unfixed_hight.dart';
import 'package:to_do/common/widgets/img_container/circuler_img_container.dart';
import 'package:to_do/common/widgets/text/brand_text_vicon.dart';
import 'package:to_do/utils/constants/enums.dart';

class KBrandCard extends StatelessWidget {
  const KBrandCard({
    super.key,
    this.onPress,
    required this.showBorder,
  });

  final void Function()? onPress;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: UnFixedHightContainer(
        showBorderColor: showBorder,
        width: double.infinity,
        radius: 16,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.0),
          child: Row(
            children: [
              const Flexible(
                child: KCirculerImage(
                  imgString: 'assets/images/populer_prodect/shoe-3.png',
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const KBrandTitleVerifyIcon(
                      brandName: 'Nike',
                      brandTextSize: TextSize.large,
                    ),
                    Text(
                      '200 Products left',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// CustomCirculerShap(
//         showBorderColor: showBorder,
//         width: double.infinity,
//         hight: 68,
//         radius: 16,
//         color: Colors.transparent,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 7.0),
//           child: Row(
//             children: [
//               const Flexible(
//                 child: KCirculerImage(
//                   imgString: 'assets/images/populer_prodect/shoe-3.png',
//                 ),
//               ),
//               const SizedBox(
//                 width: 16,
//               ),
//               Flexible(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     const KBrandTitleVerifyIcon(
//                       brandName: 'Nike',
//                       brandTextSize: TextSize.large,
//                     ),
//                     Text(
//                       '200 Products left',
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                       style: Theme.of(context).textTheme.labelMedium,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),