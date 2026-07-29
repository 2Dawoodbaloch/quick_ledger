import 'dart:developer';
import 'dart:math' hide log;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_ledger/features/ledger/controllers/accounts/controller.dart';
import 'package:quick_ledger/features/ledger/model/accounts/account_model.dart';
import 'package:quick_ledger/utils/constants/enum.dart';

class NewAccountController extends GetxController {
  final accountNameController = TextEditingController();
  final accountCodeController = TextEditingController();
  final openingBalanceController = TextEditingController();
  final descriptionController = TextEditingController();

  final selectedType = AccountType.expense.obs;

  // category
  late final Rx<AccountCategory> selectedCategory = categoriesForType(
    selectedType.value,
  ).first.obs;

  @override
  void onInit() {
    super.onInit();
    // Generate code automatically
    accountCodeController.text = generateAccountCode();
  }

  String generateAccountCode() {
    final random = Random();
    return 'ACC-${1000 + random.nextInt(9000)}';
  }

  void setAccountType(AccountType? type) {
    if (type != null) {
      selectedType.value = type;
      // Category options change with type — Asset's categories don't
      // make sense for Liability, etc. — so reset to the first valid
      // option for the new type rather than leaving a stale, now
      // invalid category selected.
      selectedCategory.value = categoriesForType(type).first;
    }
  }

  void setAccountCategory(AccountCategory? category) {
    if (category != null) selectedCategory.value = category;
  }

  /// True only once the required fields are filled — used to disable
  /// the "Create account" button, same pattern as canPost on journal
  /// entries. Description is optional, matching the mockup's label
  /// "Description (optional)".
  bool get canCreate =>
      accountNameController.text.trim().isNotEmpty &&
      accountCodeController.text.trim().isNotEmpty;
  void createAccount() {
    // if (!canCreate) return;

    final account = AccountModel(
      id: accountCodeController.text,
      category: selectedCategory.value,
      name: accountNameController.text.trim(),
      code: accountCodeController.text.trim(),
      type: selectedType.value,
      // Empty opening balance defaults to 0 rather than crashing on
      // double.parse — a brand-new account commonly starts at zero.
      balance: double.tryParse(openingBalanceController.text.trim()) ?? 0,
      description: descriptionController.text.trim().isEmpty
          ? null
          : descriptionController.text.trim(),
    );
   
    log(
      "Code : ${account.code}"
      "Name: ${account.name}, "
      "Type: ${account.type}, "
      "Category: ${account.category}",
    );
    AccountController.instance.addAccount(account);
    Get.back();
  }

  @override
  void onClose() {
    accountNameController.dispose();
    accountCodeController.dispose();
    openingBalanceController.dispose();
    descriptionController.dispose();
    super.onClose();
  }
}
