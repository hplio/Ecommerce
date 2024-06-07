import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:to_do/features/authentication/screens/login_page/login_screen.dart';

class OnBordingController extends GetxController {
  static OnBordingController get instance => Get.find();

  final pageController = PageController();
  Rx<int> curruntPage = 0.obs;
  void updatePageIndicator(int index) => curruntPage.value = index;
  void dotNavigationClick(int index) {
    curruntPage.value = index;
    pageController.jumpToPage(index);
  }

  void nextPage() {
    if (curruntPage.value == 2) {
      final storage = GetStorage();
      if (kDebugMode) {
        print('======= CONTEROLER PAGE-2 ======');
        print(storage.read('isFirstTime'));
      }

      storage.write('isFirstTime', false);
      if (kDebugMode) {
        print('======= CONTEROLER PAGE-2 ======');
        print(storage.read('isFirstTime'));
      }
      Get.offAll(const LoginScreen());
    } else {
      pageController.jumpToPage(curruntPage.value + 1);
    }
  }

  void skipPage() {
    curruntPage.value = 2;
    pageController.jumpToPage(2);
  }
}
