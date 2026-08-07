import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_ledger/features/authentication/models/user_model.dart';
import 'package:quick_ledger/features/personalization/controllers/user_controller.dart';

class EditProfileController extends GetxController {
  static EditProfileController get instance => Get.find();

  final formKey = GlobalKey<FormState>();

  final name = TextEditingController();
  final phone = TextEditingController();
  final businessName = TextEditingController();
  final businessType = TextEditingController();

  @override
  void onInit() {
    super.onInit();

    final user = UserController.instance.user.value;

    name.text = user.name;
    phone.text = user.phone;
    businessName.text = user.businessName;
    businessType.text = user.businessType;
  }

  Future<void> updateProfile() async {
    if (!formKey.currentState!.validate()) return;

    final oldUser = UserController.instance.user.value;

    final updatedUser = UserModel(
      id: oldUser.id,
      email: oldUser.email,
      name: name.text.trim(),
      phone: phone.text.trim(),
      businessName: businessName.text.trim(),
      businessType: businessType.text.trim(),
    );

    await UserController.instance.updateUser(updatedUser);

   Navigator.of(Get.context!).pop();
  }

  @override
  void onClose() {
    name.dispose();
    phone.dispose();
    businessName.dispose();
    businessType.dispose();
    super.onClose();
  }
}
