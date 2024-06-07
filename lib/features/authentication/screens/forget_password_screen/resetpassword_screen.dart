import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:to_do/features/authentication/screens/login_page/login_screen.dart';
import 'package:to_do/utils/constants/size.dart';
import 'package:to_do/utils/constants/text.dart';

class ReSetPasswordScreen extends StatelessWidget {
  const ReSetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    SizedBox getSizeBox(double hight) {
      return SizedBox(
        height: hight,
      );
    }

    final controller = Get.put(ForgetPasswordController());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.clear,
            ),
            onPressed: () => Get.back(),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Image(
                image: const AssetImage(
                    'assets/images/verification_img/success verified.gif'),
                width: KSizeScreen.getScreenWidth(context) * .6,
              ),
              getSizeBox(20.0),
              Text(
                email,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              getSizeBox(16.0),
              Text(
                KtextString.emailResetTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              getSizeBox(16.0),
              Text(
                KtextString.emailResetSubTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              getSizeBox(16.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: const Text('Done'),
                ),
              ),
              getSizeBox(16.0),
              TextButton(
                onPressed: () => controller.resendPasswordReesetEmail(email),
                child: const Text('Resend Email'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
