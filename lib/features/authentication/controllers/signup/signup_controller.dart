import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/common/loader/loader.dart';
import 'package:to_do/data/repositories.authentication/authentication/repositoeies_authentication.dart';
import 'package:to_do/data/repositories.authentication/user/user_model.dart';
import 'package:to_do/data/repositories.authentication/user/user_repository.dart';
import 'package:to_do/features/authentication/screens/verify_email/verify_email_screen.dart';
import 'package:to_do/network/network_manager.dart';
import 'package:to_do/popups/full_screen_loder.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final conditionCheck = false.obs;

  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  final fistName = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void singup() async {
    try {
      KFullScreenLoder.openLodingDialog('We are processing your information...',
          'assets/images/animation/animation_loading.gif');

      // check internet conection.
      final isConected = await NetworkManager.instance.isConnected();

      if (!isConected) {
        KFullScreenLoder.stopLoading();
        return;
      }

      // form validation
      if (!signupFormKey.currentState!.validate()) {
        KFullScreenLoder.stopLoading();
        return;
      }

      // privacy police
      if (!conditionCheck.value) {
        KFullScreenLoder.stopLoading();
        KLoader.warningSnackBar(
          title: 'Accept Privacy Police',
          massage:
              'In Order to create account you have to accept privacy policy & terms of use',
        );
        return;
      }
      
      //Register using email and password on firebase.
      final userCredentia = await AuthenticationRepo.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      // save authenticated user data in firebase firestore
      final newUser = UserModel(
        id: userCredentia.user!.uid,
        firstName: fistName.text.trim(),
        lastName: lastName.text.trim(),
        username: userName.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePic: '',
      );

      final userRepo = Get.put(UserRepository());

      await userRepo.saveUserRecord(newUser);

      KFullScreenLoder.stopLoading();

      KLoader.successSnackBar(
          title: 'Congratulation', massage: 'Your account has been created.');
      Get.to(VerifyEmailScreen(email: email.text.trim()));
    } catch (e) {
      // remove loader
      KFullScreenLoder.stopLoading();

      //show error massage
      KLoader.errorSnackBar(title: 'oh snap!', massage: e.toString());
    }
  }
}
