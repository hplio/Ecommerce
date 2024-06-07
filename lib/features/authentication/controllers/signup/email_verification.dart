import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:to_do/common/loader/loader.dart';
import 'package:to_do/common/widgets/success_screen/success_screen.dart';
import 'package:to_do/data/repositories.authentication/authentication/repositoeies_authentication.dart';
import 'package:to_do/utils/constants/text.dart';

class EmailVerification extends GetxController {
  static EmailVerification get instance => Get.find();
  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  void sendEmailVerification() async {
    try {
      await AuthenticationRepo.instance.sendEmailVerification();
      KLoader.successSnackBar(
          title: 'Email sent', massage: 'Please check your mail box');
    } catch (e) {
      KLoader.errorSnackBar(title: 'oh snap!', massage: e.toString());
    }
  }

  setTimerForAutoRedirect() {
    Timer.periodic(
      const Duration(seconds: 1),
      (timer) async {
        await FirebaseAuth.instance.currentUser?.reload();
        final user = FirebaseAuth.instance.currentUser;
        if (user?.emailVerified ?? false) {
          timer.cancel();
          Get.off(
            () => SuccsessScreen(
              imageString: KtextString.imageSucssessFull,
              title: KtextString.sucssessFullT,
              subTitle: KtextString.sucssessFullDis,
              onPress: () => AuthenticationRepo.instance.screenRedirect(),
            ),
          );
        }
      },
    );
  }

  checkEmailVerificationStatus() async {
    final curruntUser = FirebaseAuth.instance.currentUser;

    if (curruntUser != null && curruntUser.emailVerified) {
      Get.off(
        () => SuccsessScreen(
          imageString: KtextString.imageSucssessFull,
          title: KtextString.sucssessFullT,
          subTitle: KtextString.sucssessFullDis,
          onPress: () => AuthenticationRepo.instance.screenRedirect(),
        ),
      );
    }
  }
}
