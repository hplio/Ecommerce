import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do/common/custom_appbar/custom_appbar.dart';
import 'package:to_do/common/loader/shimmer.dart';
import 'package:to_do/common/widgets/custom_shoppin_icon/custom_shopping_icon.dart';
import 'package:to_do/features/personalization/controllers/user_controller/user_controller.dart';
import 'package:to_do/features/shop/screens/cart/cart_screen.dart';
import 'package:to_do/utils/constants/colors.dart';
import 'package:to_do/utils/constants/text.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return CAppBar(
      leading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            KtextString.homeAppBarTitle,
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .apply(color: TColor.grey),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              return const KShimmerEffect(hight: 80, width: 15);
            } else {
              return Text(
                controller.user.value.fullName,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .apply(color: TColor.white),
              );
            }
          }),
        ],
      ),
      action: [
        CShoppingIcon(
          onPress: () => Get.to(() => const CartScreen()),
          iconColor: TColor.white,
        ),
      ],
    );
  }
}
