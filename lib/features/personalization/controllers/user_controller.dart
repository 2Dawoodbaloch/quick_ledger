//

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:quick_ledger/data/repositories/user/user_repository.dart';
import 'package:quick_ledger/features/authentication/models/user_model.dart';
import 'package:quick_ledger/utils/popups/snackbar_helpers.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();
  final _userRepository = Get.put(UserRepository());

  /// Logged-in user's data
  final Rx<UserModel> user = UserModel.empty().obs;
  RxBool prfofileLoading = false.obs;

  @override
  void onInit() {
    fetchUserRecord();
    super.onInit();
  }

  //===========================================================
  // SAVE USER
  //===========================================================

  Future<void> saveUserRecord(UserCredential userCredential) async {
    try {
      final username = userCredential.user!.displayName ?? '';

      final newUser = UserModel(
        id: userCredential.user!.uid,
        name: username,
        email: userCredential.user!.email ?? '',
        phone: userCredential.user!.phoneNumber ?? '',
        businessName: '',
        businessType: '',
      );

      await _userRepository.saveUserRecord(newUser);
    } catch (e) {
      GSnackBarHelpers.warningSnackBar(
        title: 'Data not saved',
        message: 'Something went wrong while saving user.',
      );
    }
  }

Future<void> updateUser(UserModel updatedUser) async {
  try {


    await _userRepository.updateUserRecord(updatedUser);



    user.value = updatedUser;

  

    GSnackBarHelpers.successSnackBar(
      title: "Success",
      message: "Profile updated successfully",
    );


  } catch (e) {
    log(e.toString());
  }
}


// Fetch User

  Future<void> fetchUserRecord() async {
    try {
      prfofileLoading.value = true;
      UserModel user = await _userRepository.fetchUserRecord();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
       prfofileLoading.value = false;
    }
  }
}
