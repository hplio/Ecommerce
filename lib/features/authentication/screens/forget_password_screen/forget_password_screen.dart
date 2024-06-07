import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:to_do/utils/constants/colors.dart';
import 'package:to_do/utils/constants/text.dart';
import 'package:to_do/utils/validators/validator.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    final controller = Get.put(ForgetPasswordController());
    SizedBox getSizedbox(double height) {
      return SizedBox(
        height: height,
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
            children: [
              Text(
                KtextString.fPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              getSizedbox(20),
              Text(
                KtextString.fPasswordSubTitle,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              getSizedbox(24),
              Form(
                key: controller.forgetPasswordKey,
                child: TextFormField(
                  controller: controller.fEmail,
                  validator: (value) => Kvalidator.validateEmail(value),
                  decoration: const InputDecoration(
                    labelText: 'E-Mail',
                    prefixIcon: Icon(Icons.mail),
                  ),
                ),
              ),
              getSizedbox(24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.resetPasswordViaEmail(),
                  // onPressed: () => Get.off(const ReSetPasswordScreen()),
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
