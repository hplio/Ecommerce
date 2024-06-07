import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/features/authentication/controllers/login/login_controller.dart';
import 'package:to_do/utils/constants/colors.dart';
import 'package:to_do/utils/constants/size.dart';

class SocialButton extends StatelessWidget {
  const SocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    final controlller= Get.put(LoginController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => controlller.googleSignIn(),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(
                  color: dark
                      ? TColor.lightGrey.withOpacity(.5)
                      : TColor.grey),
            ),
            child: const Padding(
              padding: EdgeInsets.all(2.0),
              child: Image(
                image: AssetImage(
                    'assets/logo/login_icon/google.png'),
              ),
            ),
          ),
        ),
        SizedBox(
          width: KSizeScreen.getScreenWidth(context) * .05,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(
                color: dark
                    ? TColor.lightGrey.withOpacity(.5)
                    : TColor.grey),
          ),
          child: const Padding(
            padding: EdgeInsets.all(2.0),
            child: Image(
              image: AssetImage(
                  'assets/logo/login_icon/facebook.png'),
            ),
          ),
        ),
      ],
    );
  }
}