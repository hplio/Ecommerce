import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/features/authentication/controllers/onbording/onbording_controller.dart';
import 'package:to_do/utils/constants/colors.dart';
import 'package:to_do/utils/constants/size.dart';

class ArrowButton extends StatelessWidget {
  const ArrowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.put(OnBordingController());

    return Positioned(
      bottom: KSizeScreen.getScreenHeight(context) * .03,
      right: KSizeScreen.getScreenWidth(context) * .03,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? TColor.primary : TColor.dark,
          side: BorderSide(color: dark ? TColor.primary : TColor.black),
        ),
        onPressed: controller.nextPage,
        child: const Icon(
          // Icons.arrow_forward,
          Iconsax.arrow_right_34,
          color: Colors.white,
        ),
      ),
    );
  }
}
