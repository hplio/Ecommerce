import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/common/custom_appbar/custom_appbar.dart';
import 'package:to_do/common/widgets/icon_btn_container/icon_btn_container.dart';
import 'package:to_do/common/widgets/layout/grid_layout.dart';
import 'package:to_do/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:to_do/features/shop/screens/home/home.dart';

class WishList extends StatelessWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(
        isLeadingShow: false,
        leading: false,
        title: Text(
          'WishList',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        action: [
          KIconContainer(
            iconInfo: Iconsax.add,
            onPress: () => Get.to(const HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              GridLayOut(
                  itemCount: 6,
                  itemBuilder: (_, index) => const ProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}

// ds-24