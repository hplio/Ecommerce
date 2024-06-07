import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/features/shop/screens/home/home.dart';
import 'package:to_do/features/shop/screens/setting/profile.dart';
import 'package:to_do/features/shop/screens/shop/shop.dart';
import 'package:to_do/features/shop/screens/wishlist/wish_list.dart';
import 'package:to_do/utils/constants/colors.dart';

class BottomNavigationBarAll extends StatelessWidget {
  const BottomNavigationBarAll({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final bool dark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          backgroundColor: dark?TColor.black:TColor.white,
          indicatorColor: dark?TColor.grey.withOpacity(.1):TColor.black.withOpacity(.1),
          elevation: 0,
          height: 60,
          selectedIndex: controller.curruntPage.value,
          onDestinationSelected: (value) =>
              controller.curruntPage.value = value,
          destinations: const [
            NavigationDestination(
                icon: Icon(
                  Iconsax.home,
                ),
                label: 'Home'),
            NavigationDestination(
                icon: Icon(
                  Iconsax.shop,
                ),
                label: 'Shop'),
            NavigationDestination(
                icon: Icon(
                  Iconsax.heart,
                ),
                label: 'Wishlist'),
            NavigationDestination(
                icon: Icon(
                  Iconsax.user,
                ),
                label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.conatainer[controller.curruntPage.value]),
    );
  }
}

class NavigationController extends GetxController {
  final Rx<int> curruntPage = 0.obs;

  final conatainer = [
    const HomeScreen(),
    const Store(),
    const WishList(),
    const ProfileScreen(),
  ];
}
