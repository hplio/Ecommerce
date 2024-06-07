import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/common/widgets/signin_login/devider.dart';
import 'package:to_do/common/widgets/signin_login/social_button.dart';
import 'package:to_do/features/authentication/screens/create_account/widgets/sign_up_form.dart';
import 'package:to_do/utils/constants/colors.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Iconsax.arrow_left,
            color: dark ? TColor.light : TColor.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Let\'s create your account',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: 25,
              ),
             const SignUpForm(),
              const SizedBox(
                height: 20,
              ),
              const DeviderText(
                deviderText: 'Or sign up with',
              ),
              const SizedBox(
                height: 20,
              ),
              const SocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}

