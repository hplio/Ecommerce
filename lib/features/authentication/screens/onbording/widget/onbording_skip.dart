import 'package:flutter/material.dart';
import 'package:to_do/features/authentication/controllers/onbording/onbording_controller.dart';
import 'package:to_do/utils/constants/size.dart';


class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: KSizeScreen.getScreenHeight(context) * .03,
      right: KSizeScreen.getScreenWidth(context) * .001,
      child: TextButton(
        onPressed: OnBordingController.instance.skipPage,
        child:const Text('Skip'),
      ),
    );
  }
}
