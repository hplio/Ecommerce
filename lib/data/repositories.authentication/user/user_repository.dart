import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:to_do/data/repositories.authentication/authentication/firebase_exception.dart';
import 'package:to_do/data/repositories.authentication/authentication/repositoeies_authentication.dart';
import 'package:to_do/data/repositories.authentication/user/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  final authController = Get.put(AuthenticationRepo());

  // Fuunction to save user data

  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('User').doc(user.id).set(user.toJson());
    } on FirebaseException catch (e) {
      throw getErrorMessage(e);
    } on FormatException catch (e) {
      throw getExceptionMessage(e);
    } on PlatformException catch (e) {
      throw getExceptionMessage(e);
    } catch (e) {
      throw 'Somthing went wrong. Pleease try againg later';
    }
  }

  Future<UserModel> fatchUserDetailees() async {
    try {
      final documentSnapshot =
          await _db.collection('User').doc(authController.authUser?.uid).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseException catch (e) {
      throw getErrorMessage(e);
    } on FormatException catch (e) {
      throw getExceptionMessage(e);
    } on PlatformException catch (e) {
      throw getExceptionMessage(e);
    } catch (e) {
      throw 'Somthing went wrong. Pleease try againg later';
    }
  }

  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db
          .collection('User')
          .doc(updateUser.id)
          .update(updateUser.toJson());
    } on FirebaseException catch (e) {
      throw getErrorMessage(e);
    } on FormatException catch (e) {
      throw getExceptionMessage(e);
    } on PlatformException catch (e) {
      throw getExceptionMessage(e);
    } catch (e) {
      throw 'Somthing went wrong. Pleease try againg later';
    }
  }

  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection('User')
          .doc(authController.authUser?.uid)
          .update(json);
    } on FirebaseException catch (e) {
      throw getErrorMessage(e);
    } on FormatException catch (e) {
      throw getExceptionMessage(e);
    } on PlatformException catch (e) {
      throw getExceptionMessage(e);
    } catch (e) {
      throw 'Somthing went wrong. Pleease try againg later';
    }
  }

  Future<void> removeRecord(String userId) async {
    try {
      await _db.collection('User').doc(userId).delete();
    } on FirebaseException catch (e) {
      throw getErrorMessage(e);
    } on FormatException catch (e) {
      throw getExceptionMessage(e);
    } on PlatformException catch (e) {
      throw getExceptionMessage(e);
    } catch (e) {
      throw 'Somthing went wrong. Pleease try againg later';
    }
  }

  Future<String> uplodImage(String path, XFile image) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw getErrorMessage(e);
    } on FormatException catch (e) {
      throw getExceptionMessage(e);
    } on PlatformException catch (e) {
      throw getExceptionMessage(e);
    } catch (e) {
      throw 'Somthing went wrong. Pleease try againg later';
    }
  }
}
