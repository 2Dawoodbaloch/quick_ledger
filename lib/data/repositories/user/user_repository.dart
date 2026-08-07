import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quick_ledger/data/repositories/authentication_repository.dart';
import 'package:quick_ledger/features/authentication/models/user_model.dart';
import 'package:quick_ledger/utils/constants/keys/keys.dart';
import 'package:quick_ledger/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:quick_ledger/utils/exceptions/firebase_exceptions.dart';
import 'package:quick_ledger/utils/exceptions/format_exceptions.dart';
import 'package:quick_ledger/utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  

  // varibales
  final _db = FirebaseFirestore.instance;

  // function to store user data to firestore
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db
          .collection(GKeys.userCollection)
          .doc(user.id)
          .set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw GFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw GFormatException();
    } on PlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  Future<UserModel> fetchUserRecord() async {
    try {
      final documentSnapshot = await _db
          .collection(GKeys.userCollection)
          .doc(AuthenticationRepository.instance.currentUser!.uid)
          .get();

      if (documentSnapshot.exists) {
        UserModel user = UserModel.fromSnapshot(documentSnapshot);
        return user;
      }

      return UserModel.empty();
    } on FirebaseAuthException catch (e) {
      throw GFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw GFormatException();
    } on PlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong, Please try again';
    }
  }

  // UPDATE USER PROFILE
  Future<void> updateUserRecord(UserModel user) async {
  try {
    await _db
        .collection(GKeys.userCollection)
        .doc(user.id)
        .update(user.toJson());
  } on FirebaseAuthException catch (e) {
    throw GFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw GFirebaseException(e.code).message;
  } on FormatException {
    throw GFormatException();
  } on PlatformException catch (e) {
    throw GPlatformException(e.code).message;
  } catch (e) {
    throw 'Something went wrong, Please try again';
  }
}
}
