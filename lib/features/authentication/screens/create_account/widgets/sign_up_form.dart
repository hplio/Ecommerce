import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/features/authentication/controllers/signup/signup_controller.dart';
import 'package:to_do/features/authentication/screens/create_account/widgets/terms_condition_checkbox.dart';
import 'package:to_do/utils/constants/size.dart';
import 'package:to_do/utils/validators/validator.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  controller: controller.fistName,
                  validator: (value) =>
                      Kvalidator.validateEmptyText('First Name', value),
                  // keyboardType: TextInputType.name,
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: 'First Name',
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              SizedBox(
                width: KSizeScreen.getScreenWidth(context) * .03,
              ),
              Flexible(
                child: TextFormField(
                  validator: (value) =>
                      Kvalidator.validateEmptyText('Last Name', value),
                  controller: controller.lastName,
                  // keyboardType: TextInputType.name,
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: 'Last Name', prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            validator: (value) =>
                Kvalidator.validateEmptyText('User Name', value),
            controller: controller.userName,
            // keyboardType: TextInputType.name,
            decoration: const InputDecoration(
              labelText: 'User Name',
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            validator: (value) => Kvalidator.validateEmail(value),
            controller: controller.email,
            // keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'E-mail',
              prefixIcon: Icon(Icons.mail),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          TextFormField(
            validator: (value) => Kvalidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            // keyboardType: TextInputType.phone,
            decoration: const InputDecoration(
              labelText: 'Phone Number',
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Obx(
            () => TextFormField(
              validator: (value) => Kvalidator.validatePassword(value),
              obscureText: controller.hidePassword.value,
              controller: controller.password,
              // keyboardType: TextInputType.visiblePassword,
              decoration: InputDecoration(
                labelText: 'Passeord',
                prefixIcon: const Icon(Iconsax.password_check),
                suffixIcon: IconButton(
                  onPressed: () {
                    controller.hidePassword.value =
                        !controller.hidePassword.value;
                  },
                  icon: Icon(
                    controller.hidePassword.value
                        ? Iconsax.eye_slash
                        : Iconsax.eye,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: Obx(
                  () => Checkbox(
                    value: controller.conditionCheck.value,
                    onChanged: (value) => controller.conditionCheck.value =
                        !controller.conditionCheck.value,
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              const TermCheckBox(),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.singup(),
              // onPressed: () => Get.to(const VerifyEmailScreen()),
              child: const Text('Create Account'),
            ),
          ),
        ],
      ),
    );
  }
}
