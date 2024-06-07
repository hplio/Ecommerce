import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/common/loader/loader.dart';
import 'package:to_do/data/repositories.authentication/user/user_repository.dart';
import 'package:to_do/features/personalization/controllers/user_controller/user_controller.dart';
import 'package:to_do/features/personalization/screens/profile/pofile_setting.dart';
import 'package:to_do/network/network_manager.dart';
import 'package:to_do/popups/full_screen_loder.dart';

class UpdateNameController extends GetxController {
  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  static UpdateNameController get instance => Get.find();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  GlobalKey<FormState> userUpdateName = GlobalKey<FormState>();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());

  initializeName() {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      KFullScreenLoder.openLodingDialog('We are updating your information...',
          "assets/images/animation/animation_loading.gif");

      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        KFullScreenLoder.stopLoading();
        return;
      }
      if (!userUpdateName.currentState!.validate()) {
        KFullScreenLoder.stopLoading();
        return;
      }
      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim()
      };

      await userRepository.updateSingleField(name);
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();
      KFullScreenLoder.stopLoading();
      KLoader.successSnackBar(
          title: 'Congratulation', massage: 'Your name has been updated.');
      Get.off(() => const ProfileSettingScreen());
    } catch (e) {
      KLoader.errorSnackBar(title: 'oh snap!', massage: e.toString());
    }
  }
}
