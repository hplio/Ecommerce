import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:to_do/data/repositories.authentication/authentication/firebase_exception.dart';
import 'package:to_do/data/repositories.authentication/user/user_repository.dart';
import 'package:to_do/features/authentication/screens/login_page/login_screen.dart';
import 'package:to_do/features/authentication/screens/navigation_bar/bottom_navigation_screen.dart';
import 'package:to_do/features/authentication/screens/onbording/onboding_screen.dart';
import 'package:to_do/features/authentication/screens/verify_email/verify_email_screen.dart';

class AuthenticationRepo extends GetxController {
  static AuthenticationRepo get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    super.onReady();
  }

  screenRedirect() async {
    final user = _auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => const BottomNavigationBarAll());
      } else {
        Get.offAll(
          () => VerifyEmailScreen(
            email: _auth.currentUser?.email,
          ),
        );
      }
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);

      deviceStorage.read('isFirstTime') != true
          ? Get.offAll(() => const LoginScreen())
          : Get.offAll(() => const OnBordingScreen());
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw getErrorMessage(e);
    } on FormatException catch (e) {
      throw getExceptionMessage(e);
    } on PlatformException catch (e) {
      throw getExceptionMessage(e);
    } on FirebaseException catch (e) {
      throw getErrorMessage(e);
    } catch (e) {
      throw 'Something went wrong. Please try again later.';
    }
  }

  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw getErrorMessage(e);
    } on FormatException catch (e) {
      throw getExceptionMessage(e);
    } on PlatformException catch (e) {
      throw getExceptionMessage(e);
    } on FirebaseException catch (e) {
      throw getErrorMessage(e);
    } catch (e) {
      throw 'Something went wrong. Please try again later.';
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      return await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw getErrorMessage(e);
    } on FormatException catch (e) {
      throw getExceptionMessage(e);
    } on PlatformException catch (e) {
      throw getExceptionMessage(e);
    } on FirebaseException catch (e) {
      throw getErrorMessage(e);
    } catch (e) {
      throw 'Something went wrong. Please try again later.';
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw getErrorMessage(e);
    } on FormatException catch (e) {
      throw getExceptionMessage(e);
    } on PlatformException catch (e) {
      throw getExceptionMessage(e);
    } on FirebaseException catch (e) {
      throw getErrorMessage(e);
    } catch (e) {
      if (kDebugMode) print(e.toString());
      throw 'Something went wrong. Please try again later.';
    }
  }

  logOut() async {
    try {
      await GoogleSignIn().signOut();
      await _auth.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw getErrorMessage(e);
    } on FormatException catch (e) {
      throw getExceptionMessage(e);
    } on PlatformException catch (e) {
      throw getExceptionMessage(e);
    } on FirebaseException catch (e) {
      throw getErrorMessage(e);
    } catch (e) {
      throw 'Something went wrong. Please try again later.';
    }
  }

  Future<void> sendPasswordResetEmail(String email) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw getErrorMessage(e);
    } on FormatException catch (e) {
      throw getExceptionMessage(e);
    } on PlatformException catch (e) {
      throw getExceptionMessage(e);
    } on FirebaseException catch (e) {
      throw getErrorMessage(e);
    } catch (e) {
      throw 'Something went wrong. Please try again later.';
    }
  }

  Future<void> reAuthenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);

      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw getErrorMessage(e);
    } on FormatException catch (e) {
      throw getExceptionMessage(e);
    } on PlatformException catch (e) {
      throw getExceptionMessage(e);
    } on FirebaseException catch (e) {
      throw getErrorMessage(e);
    } catch (e) {
      throw 'Something went wrong. Please try again later.';
    }
  }

  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();
    } on FirebaseAuthException catch (e) {
      throw getErrorMessage(e);
    } on FormatException catch (e) {
      throw getExceptionMessage(e);
    } on PlatformException catch (e) {
      throw getExceptionMessage(e);
    } on FirebaseException catch (e) {
      throw getErrorMessage(e);
    }catch (e) {
      throw 'Something went wrong. Please try again later.';
    }
  }
}
