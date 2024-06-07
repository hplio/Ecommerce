import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do/common/loader/loader.dart';
import 'package:to_do/data/repositories.authentication/authentication/repositoeies_authentication.dart';
import 'package:to_do/features/personalization/controllers/user_controller/user_controller.dart';
import 'package:to_do/network/network_manager.dart';
import 'package:to_do/popups/full_screen_loder.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  @override
  void onInit() {
    if (localStorage.read('REMEMBER_ME_EMAIL') != null &&
        localStorage.read('REMEMBER_ME_PASSWORD') != null) {
      email.text = localStorage.read('REMEMBER_ME_EMAIL');
      password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    }

    super.onInit();
  }

  final localStorage = GetStorage();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final rememberMe = false.obs;
  final showPassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final userController = Get.put(UserController());

  Future<void> logIn() async {
    try {
      KFullScreenLoder.openLodingDialog('We are processing your information...',
          'assets/images/animation/animation_loading.gif');

      final connection = await NetworkManager.instance.isConnected();
      if (!connection) {
        KFullScreenLoder.stopLoading();
        return;
      }
      if (!loginFormKey.currentState!.validate()) {
        KFullScreenLoder.stopLoading();
        return;
      }
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text);
        localStorage.write('REMEMBER_ME_PASSWORD', password.text);
      }

      await AuthenticationRepo.instance
          .loginWithEmailAndPassword(email.text, password.text);
      // final userCredential=
      KFullScreenLoder.stopLoading();
      AuthenticationRepo.instance.screenRedirect();
    } catch (e) {
      KFullScreenLoder.stopLoading();
      KLoader.errorSnackBar(title: 'oh snap', massage: e.toString());
    }
  }

  Future<void> googleSignIn() async {
    try {
      KFullScreenLoder.openLodingDialog(
          'LogIn you in...', 'assets/images/animation/animation_loading.gif');

      final isconnected = await NetworkManager.instance.isConnected();
      if (!isconnected) {
        KFullScreenLoder.stopLoading();
        return;
      }

      final userCredential =
          await AuthenticationRepo.instance.signInWithGoogle();
      

      await userController.saveUserRecord(userCredential);

      KFullScreenLoder.stopLoading();
      AuthenticationRepo.instance.screenRedirect();
    } catch (e) {
      KFullScreenLoder.stopLoading();
      KLoader.errorSnackBar(title: 'oh snap!', massage: e.toString());
    }
  }
}
