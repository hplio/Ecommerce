import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do/common/loader/loader.dart';
import 'package:to_do/data/repositories.authentication/authentication/repositoeies_authentication.dart';
import 'package:to_do/data/repositories.authentication/user/user_model.dart';
import 'package:to_do/data/repositories.authentication/user/user_repository.dart';
import 'package:to_do/features/authentication/screens/login_page/login_screen.dart';
import 'package:to_do/features/personalization/screens/profile/widget/re_authenticate_user.dart';
import 'package:to_do/network/network_manager.dart';
import 'package:to_do/popups/full_screen_loder.dart';
import 'package:to_do/utils/constants/colors.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final userRepos = Get.put(UserRepository());
  final Rx<bool> profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final imageUploding = false.obs;

  final hidepassword = true.obs;
  final verifyPassword = TextEditingController();
  final verifyEmail = TextEditingController();
  GlobalKey<FormState> reAuthFromKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fatchUserRecord();
  }

  Future<void> fatchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepos.fatchUserDetailees();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      await fatchUserRecord();
      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          final namePart =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final userName = UserModel.generateUsername(
              userCredential.user!.displayName ?? '');

          final user = UserModel(
              id: userCredential.user!.uid,
              firstName: namePart[0],
              lastName:
                  namePart.length > 1 ? namePart.sublist(1).join(' ') : '',
              username: userName,
              email: userCredential.user!.email ?? '',
              phoneNumber: userCredential.user!.phoneNumber ?? '',
              profilePic: userCredential.user!.photoURL ?? '');

          await userRepos.saveUserRecord(user);
        }
      }
    } catch (e) {
      KLoader.warningSnackBar(
          title: 'Data not save',
          massage:
              'Something went wrong while saving your information. you cam re-save your data in your profile');
    }
  }

  Future<void> uploadUserProfilePic() async {
    try {
      final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        // maxHeight: 512,
        // maxWidth: 512,
      );
      if (image != null) {
        imageUploding.value = true;
        final imageUrl =
            await userRepos.uplodImage('User/Images/Profile/', image);
        Map<String, dynamic> json = {
          'ProfilePicture': imageUrl,
        };
        await userRepos.updateSingleField(json);
        user.value.profilePic = imageUrl;
        user.refresh();
        KLoader.successSnackBar(
            title: 'Congratulation',
            massage: 'Your profile pic has been updated!');
      }
    } catch (e) {
      KLoader.errorSnackBar(title: 'Oh snap!', massage: e.toString());
    } finally {
      imageUploding.value = false;
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(16),
      title: 'Delete Account',
      middleText: 'Are you sure you want to delete your account parmanetly?',
      confirm: ElevatedButton(
        onPressed: () => deleteUserAccount(),
        style: ElevatedButton.styleFrom(
          backgroundColor: TColor.error,
          foregroundColor: TColor.white.withOpacity(.8),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Delete',
          ),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text(
          'Cancel',
        ),
      ),
    );
  }

  void deleteUserAccount() async {
    try {
      KFullScreenLoder.openLodingDialog(
        'Processing...',
        "assets/images/animation/animation_loading.gif",
      );
      final auth = AuthenticationRepo.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider == 'google.com') {
        await auth.signInWithGoogle();
        await auth.deleteAccount();

        KFullScreenLoder.stopLoading();
        Get.offAll(() => const LoginScreen());
      } else if (provider == 'password') {
        KFullScreenLoder.stopLoading();
        Get.to(() => const ReAuthLogInForm());
      }
    } catch (e) {
      KFullScreenLoder.stopLoading();
      KLoader.warningSnackBar(
        title: 'oh snap!',
        massage: e.toString(),
      );
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      KFullScreenLoder.openLodingDialog(
        'Processing...',
        "assets/images/animation/animation_loading.gif",
      );
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        KFullScreenLoder.stopLoading();
        return;
      }
      if (!reAuthFromKey.currentState!.validate()) {
        KFullScreenLoder.stopLoading();
        return;
      }
      await AuthenticationRepo.instance.reAuthenticateWithEmailAndPassword(
          verifyEmail.text.trim(), verifyEmail.text.trim());
      await AuthenticationRepo.instance.deleteAccount();
      KFullScreenLoder.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      KFullScreenLoder.stopLoading();
      KLoader.errorSnackBar(
        title: 'oh snap!',
        massage: e.toString(),
      );
    }
  }
}
