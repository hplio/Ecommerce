import 'package:flutter/material.dart';
import 'package:to_do/common/widgets/signin_login/devider.dart';
import 'package:to_do/common/widgets/signin_login/social_button.dart';
import 'package:to_do/features/authentication/screens/login_page/widgets/login_form.dart';
import 'package:to_do/utils/constants/size.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: KSizeScreen.getScreenWidth(context) * .05,
              vertical: KSizeScreen.getScreenHeight(context) * .023,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  height: KSizeScreen.getScreenHeight(context) * .12,
                  image: AssetImage(dark
                      ? 'assets/images/login_img/darkmode.png'
                      : 'assets/images/login_img/lightmode.png'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back,',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      'Discover limitless choices and unmatched convenience.',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    SizedBox(
                      height: KSizeScreen.getScreenHeight(context) * .03,
                    ),
                    const LoginForm(),
                    const SizedBox(
                      height: 25,
                    ),
                    const DeviderText(deviderText: 'Or Sign in with'),
                    const SizedBox(
                      height: 12,
                    ),
                    const SocialButton(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// 24 size padding

