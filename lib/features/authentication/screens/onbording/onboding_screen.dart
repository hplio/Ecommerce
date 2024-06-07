import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/features/authentication/controllers/onbording/onbording_controller.dart';
import 'package:to_do/features/authentication/screens/onbording/widget/arrow_button.dart';
import 'package:to_do/features/authentication/screens/onbording/widget/onbording_skip.dart';
import 'package:to_do/features/authentication/screens/onbording/widget/page.dart';
import 'package:to_do/features/authentication/screens/onbording/widget/page_indicator.dart';
import 'package:to_do/utils/constants/text.dart';

class OnBordingScreen extends StatelessWidget {
  const OnBordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final bool dark = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.put(OnBordingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBordingPage(
                imageString: 'assets/images/onbording_img/ecommerce-img-1.png',
                onBordingTitle: KtextString.onBordingTitle1,
                onBordingSubTitle: KtextString.onBordingSubTitle1,
              ),
              OnBordingPage(
                imageString: 'assets/images/onbording_img/ecommerce-img-2.png',
                onBordingTitle: KtextString.onBordingTitle2,
                onBordingSubTitle: KtextString.onBordingSubTitle2,
              ),
              OnBordingPage(
                imageString: 'assets/images/onbording_img/ecommerce-img-3.png',
                onBordingTitle: KtextString.onBordingTitle3,
                onBordingSubTitle: KtextString.onBordingSubTitle3,
              ),
            ],
          ),
          const SkipButton(),
          const DotNavigation(),
          const ArrowButton(),
        ],
      ),
    );
  }
}
