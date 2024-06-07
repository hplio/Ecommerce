import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/common/custom_appbar/custom_appbar.dart';
import 'package:to_do/common/loader/shimmer.dart';
import 'package:to_do/common/widgets/img_container/circuler_img_container.dart';
import 'package:to_do/common/widgets/text/heading_text.dart';
import 'package:to_do/features/personalization/controllers/user_controller/user_controller.dart';
import 'package:to_do/features/personalization/screens/profile/widget/change_name.dart';
import 'package:to_do/features/personalization/screens/profile/widget/profile_info_tile.dart';
import 'package:to_do/utils/constants/colors.dart';

class ProfileSettingScreen extends StatelessWidget {
  const ProfileSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    final controller = UserController.instance;
    return Scaffold(
      appBar: CAppBar(
        leading: true,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium!.apply(
                color: dark ? TColor.white : TColor.black,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePic;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : 'assets/images/Profile_img/User-img.png';
                      return controller.imageUploding.value
                          ? const KShimmerEffect(
                              hight: 85,
                              width: 85,
                              radius: 85,
                            )
                          : KCirculerImage(
                              hight: 85,
                              width: 85,
                              imgString: image,
                              isNetworkImg: networkImage.isNotEmpty,
                            );
                    }),
                    TextButton(
                        onPressed: () => controller.uploadUserProfilePic(),
                        child: const Text('Change profile picture'))
                  ],
                ),
              ),
              const SizedBox(
                height: 16 / 2,
              ),
              const Divider(),
              const SizedBox(
                height: 16,
              ),
              const KSectionHeading(
                padding: EdgeInsets.symmetric(horizontal: 0),
                title: 'Profile Information',
                showTextButton: false,
              ),
              const SizedBox(
                height: 16,
              ),
              KProfileInfoTile(
                title: 'Name',
                // subTitle: 'HarshilPatel',
                subTitle: controller.user.value.fullName,
                onPress: () => Get.to(() => const ChangeNameScreen()),
              ),
              KProfileInfoTile(
                title: 'Username',
                subTitle: controller.user.value.username,
                onPress: () {},
              ),
              const SizedBox(
                height: 16,
              ),
              const Divider(),
              const SizedBox(
                height: 16,
              ),
              const KSectionHeading(
                title: 'Personal Information',
                showTextButton: false,
              ),
              const SizedBox(
                height: 16,
              ),
              KProfileInfoTile(
                title: 'User Id',
                subTitle: controller.user.value.id,
                iconData: Iconsax.copy,
                onPress: () {},
              ),
              KProfileInfoTile(
                title: 'E-mail',
                subTitle: controller.user.value.email,
                onPress: () {},
              ),
              KProfileInfoTile(
                title: 'Phone Number',
                subTitle: controller.user.value.phoneNumber,
                onPress: () {},
              ),
              KProfileInfoTile(
                title: 'Gender',
                subTitle: 'Male',
                onPress: () {},
              ),
              KProfileInfoTile(
                title: 'Date of Birth',
                subTitle: '20 Oct,2003',
                onPress: () {},
              ),
              const SizedBox(
                height: 16,
              ),
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    'Clear Data',
                    style: TextStyle(
                      color: TColor.error,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// ds-24 sbi-16