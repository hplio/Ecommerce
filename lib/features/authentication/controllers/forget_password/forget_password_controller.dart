import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:to_do/common/loader/loader.dart';
import 'package:to_do/data/repositories.authentication/authentication/repositoeies_authentication.dart';
import 'package:to_do/features/authentication/screens/forget_password_screen/resetpassword_screen.dart';
import 'package:to_do/network/network_manager.dart';
import 'package:to_do/popups/full_screen_loder.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final GlobalKey<FormState> forgetPasswordKey = GlobalKey<FormState>();
  // final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final fEmail = TextEditingController();

  resetPasswordViaEmail() async {
    try {
      KFullScreenLoder.openLodingDialog('Processing your request...',
          "assets/images/animation/animation_loading.gif");
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        KFullScreenLoder.stopLoading();
        return;
      }
      if (!forgetPasswordKey.currentState!.validate()) {
        KFullScreenLoder.stopLoading();
        return;
      }

      await AuthenticationRepo.instance
          .sendPasswordResetEmail(fEmail.text.trim());

      KFullScreenLoder.stopLoading();
      KLoader.successSnackBar(
          title: 'Email sent',
          massage:
              'Email link sent to reset password please check your mail box.');
      Get.offAll(() => ReSetPasswordScreen(
            email: fEmail.text.trim(),
          ));
    } catch (e) {
      KLoader.errorSnackBar(title: 'oh snap!', massage: e.toString());
    }
  }

  resendPasswordReesetEmail(String email) async {
    try {
      KFullScreenLoder.openLodingDialog('Processing your request...',
          "assets/images/animation/animation_loading.gif");
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        KFullScreenLoder.stopLoading();
        return;
      }

      await AuthenticationRepo.instance
          .sendPasswordResetEmail(email);

      KFullScreenLoder.stopLoading();
      KLoader.successSnackBar(
          title: 'Email sent',
          massage:
              'Email link sent to reset password please check your mail box.');
    } catch (e) {
      KLoader.errorSnackBar(title: 'oh snap!', massage: e.toString());
    }
  }
}
