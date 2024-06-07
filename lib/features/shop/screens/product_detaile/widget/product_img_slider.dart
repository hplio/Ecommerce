import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/common/curved_edge/curved_edge_widget.dart';
import 'package:to_do/common/custom_appbar/custom_appbar.dart';
import 'package:to_do/common/widgets/icon_btn_container/icon_btn_container.dart';
import 'package:to_do/common/widgets/img_container/round_img_container.dart';
import 'package:to_do/utils/constants/colors.dart';

class KProductImgSlider extends StatelessWidget {
  const KProductImgSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return KCurvedEdgeWidget(
      child: Container(
        color: dark ? TColor.darkerGrey : TColor.light,
        child: Stack(
          children: [
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(16.0 * 2),
                child: Center(
                  child: Image(
                    image: AssetImage(
                      'assets/images/populer_prodect/nike-shoee-2.png',
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: 30,
              left: 24,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 5,
                  separatorBuilder: (_, __) => const SizedBox(
                    width: 18,
                  ),
                  itemBuilder: (_, int index) {
                    return KImageContainer(
                      width: 80,
                      applyImageRadius: true,
                      border: Border.all(
                        color: TColor.primary,
                      ),
                      bgColor: dark ? TColor.dark : TColor.white,
                      imgString:
                          'assets/images/populer_prodect/nike-shoe-1.png',
                    );
                  },
                ),
              ),
            ),
            CAppBar(
              leading: true,
              action: [
                KIconContainer(
                  iconInfo: Iconsax.heart5,
                  onPress: (){},
                  iconColor: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
