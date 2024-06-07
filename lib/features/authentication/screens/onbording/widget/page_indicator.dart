import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:to_do/features/authentication/controllers/onbording/onbording_controller.dart';
import 'package:to_do/utils/constants/colors.dart';
import 'package:to_do/utils/constants/size.dart';

class DotNavigation extends StatelessWidget {
  const DotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    final controller = OnBordingController.instance;
    return Positioned(
      bottom: KSizeScreen.getScreenHeight(context) * .05,
      left: KSizeScreen.getScreenWidth(context) * .05,
      child: SmoothPageIndicator(
        effect: WormEffect(
          type: WormType.thin,
          activeDotColor: dark ? TColor.primary : TColor.dark,
          dotHeight: 10,
        ),
        controller: controller.pageController,
        onDotClicked: controller.dotNavigationClick,
        count: 3,
      ),
    );
  }
}
