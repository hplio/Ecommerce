import 'package:get/get.dart';

class HomeConteroller extends GetxController {
  final Rx<int> curuntPage = 0.obs;

  void updatePageIndicter(int index) {
    curuntPage.value = index;
  }
}
