import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:to_do/features/personalization/controllers/user_controller/user_controller.dart';
import 'package:to_do/features/personalization/screens/profile/pofile_setting.dart';
import 'package:to_do/utils/constants/colors.dart';

class KUserProfileTile extends StatelessWidget {
  const KUserProfileTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: const Image(
        image: AssetImage('assets/images/Profile_img/User-img.png'),
      ),
      title: Text(
        // 'Harshil Patel',
        controller.user.value.fullName,
        style: Theme.of(context).textTheme.headlineSmall!.apply(
              color: TColor.white,
            ),
      ),
      subtitle: Text(
        // 'hplion02@gmail.com',
        controller.user.value.email,
        style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: TColor.white,
            ),
      ),
      trailing: IconButton(
        onPressed: () => Get.to(const ProfileSettingScreen()),
        icon: const Icon(
          Iconsax.edit,
          color: TColor.white,
        ),
      ),
    );
  }
}
