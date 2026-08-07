import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_ledger/data/repositories/authentication_repository.dart';
import 'package:quick_ledger/utils/popups/snackbar_helpers.dart';

class ChangePasswordController extends GetxController {
  static ChangePasswordController get instance => Get.find();

  final currentPassword = TextEditingController();
  final newPassword = TextEditingController();
  final confirmPassword = TextEditingController();

  final hideCurrent = true.obs;
  final hideNew = true.obs;
  final hideConfirm = true.obs;

  final formKey = GlobalKey<FormState>();

  Future<void> changePassword() async {
    try {
      if (!formKey.currentState!.validate()) return;

      if (newPassword.text.trim() != confirmPassword.text.trim()) {
        GSnackBarHelpers.errorSnackBar(
          title: "Error",
          message: "Passwords do not match",
        );
        return;
      }

      await AuthenticationRepository.instance.changePassword(
        currentPassword: currentPassword.text.trim(),
        newPassword: newPassword.text.trim(),
      );

      GSnackBarHelpers.successSnackBar(
        title: "Success",
        message: "Password updated successfully",
      );

      Get.back();

    } catch (e) {
      GSnackBarHelpers.errorSnackBar(
        title: "Error",
        message: e.toString(),
      );
    }
  }

  @override
  void onClose() {
    currentPassword.dispose();
    newPassword.dispose();
    confirmPassword.dispose();
    super.onClose();
  }
}