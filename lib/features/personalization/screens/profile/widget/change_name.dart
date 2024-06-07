import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/common/custom_appbar/custom_appbar.dart';
import 'package:to_do/features/authentication/controllers/change_name/change_name_controller.dart';
import 'package:to_do/utils/validators/validator.dart';

class ChangeNameScreen extends StatelessWidget {
  const ChangeNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: CAppBar(
        title: Text(
          "Change Name",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Use real name for easy verification. This name will appear on several pages.',
                style: Theme.of(context).textTheme.labelMedium,
              ),
              const SizedBox(
                height: 24,
              ),
              Form(
                key: controller.userUpdateName,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) =>
                          Kvalidator.validateEmptyText('First Name', value),
                      decoration: const InputDecoration(
                        labelText: 'First Name',
                        prefixIcon: Icon(
                          Iconsax.user,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: controller.lastName,
                      validator: (value) =>
                          Kvalidator.validateEmptyText('Last Name', value),
                      decoration: const InputDecoration(
                        labelText: 'Last Name',
                        prefixIcon: Icon(
                          Iconsax.user,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => controller.updateUserName(),
                        child: const Text('Save'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
