import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/common/custom_appbar/custom_appbar.dart';
import 'package:to_do/common/custom_shap/primary_header_container.dart';
import 'package:to_do/common/widgets/list_tile/setting_list_tile.dart';
import 'package:to_do/common/widgets/list_tile/user_profile_tile.dart';
import 'package:to_do/common/widgets/text/heading_text.dart';
import 'package:to_do/data/repositories.authentication/authentication/repositoeies_authentication.dart';
import 'package:to_do/features/personalization/screens/address/address.dart';
import 'package:to_do/features/shop/screens/cart/cart_screen.dart';
import 'package:to_do/features/shop/screens/order/order_screen.dart';
import 'package:to_do/utils/constants/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  CAppBar(
                    isLeadingShow: false,
                    leading: false,
                    title: Text(
                      'Account',
                      style: Theme.of(context).textTheme.headlineMedium!.apply(
                            color: TColor.white,
                          ),
                    ),
                  ),
                  const KUserProfileTile(),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const KSectionHeading(
                    title: 'Account setting',
                    showTextButton: false,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SettingTile(
                    onTap: () => Get.to(() => const AddressPage()),
                    title: 'My Address',
                    subTitle: 'Set shopping delivery address',
                    iconData: Iconsax.home_14,
                  ),
                   SettingTile(
                     onTap: () => Get.to(() => const CartScreen()),
                    title: 'My Cart',
                    subTitle: 'Add remove products and move to checkout',
                    iconData: Iconsax.shopping_cart,
                  ),
                  SettingTile(
                    onTap: () => Get.to(() => const OrderScreen()),
                    title: 'My Order',
                    subTitle: 'In-progress and completed order',
                    iconData: Iconsax.bag_tick,
                  ),
                  const SettingTile(
                    title: 'Bank Account',
                    subTitle: 'Withdraw balance to registered bank account',
                    iconData: Iconsax.bank,
                  ),
                  const SettingTile(
                    title: 'My Coupons',
                    subTitle: 'List of all discount coupons',
                    iconData: Iconsax.discount_shape,
                  ),
                  const SettingTile(
                    title: 'Notifications',
                    subTitle: 'Set any kind of notification massage',
                    iconData: Iconsax.notification,
                  ),
                  const SettingTile(
                    title: 'Account Privacy',
                    subTitle: 'Manage data usage and connected accounts',
                    iconData: Iconsax.security_card,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const KSectionHeading(
                    title: 'App Setting',
                    showTextButton: false,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const SettingTile(
                    title: 'Load Data',
                    subTitle: 'Upload Data to Your cloud Firebase',
                    iconData: Iconsax.document_upload,
                  ),
                  SettingTile(
                    title: 'Geolocation',
                    subTitle: 'Set recommendation based on location',
                    iconData: Iconsax.location,
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  SettingTile(
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all age',
                    iconData: Iconsax.security_user,
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  SettingTile(
                    title: 'HD Image Quality',
                    subTitle: 'Set image quality to the seen',
                    iconData: Iconsax.image,
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: TColor.darkerGrey)),
                      onPressed: ()=>AuthenticationRepo.instance.logOut(),
                      child: const Text('LogOut'),
                    ),
                  ),
                  const SizedBox(
                    height: 16 * 2.5,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
