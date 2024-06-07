import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/features/authentication/controllers/login/login_controller.dart';
import 'package:to_do/features/authentication/screens/create_account/create_account_screen.dart';
import 'package:to_do/features/authentication/screens/forget_password_screen/forget_password_screen.dart';
import 'package:to_do/utils/constants/size.dart';
import 'package:to_do/utils/validators/validator.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          TextFormField(
            controller: controller.email,
            validator: (value) => Kvalidator.validateEmail(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Iconsax.direct_right,
              ),
              labelText: 'E-mail',
            ),
          ),
          SizedBox(
            height: KSizeScreen.getScreenHeight(context) * .018,
          ),
          Obx(
            ()=> TextFormField(
              controller: controller.password,
              validator: (value) => Kvalidator.validatePassword(value),
              obscureText: controller.showPassword.value,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(
                  Iconsax.password_check,
                ),
                suffixIcon: IconButton(
                  onPressed: () => controller.showPassword.value =
                      !controller.showPassword.value,
                  icon: controller.showPassword.value
                      ? const Icon(Iconsax.eye)
                      : const Icon(Iconsax.eye_slash),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Obx(
                      () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Remember Me',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ],
              ),
              InkWell(
                onTap: () => Get.to(const ForgetPasswordScreen()),
                child: Text(
                  'Forget Password?',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.logIn(),
              child: const Text(
                'Sign In',
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton(
              onPressed: () => Get.to(const CreateAccount()),
              child: const Text(
                'Create Account',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
