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

  void setAccountType(AccountType? type) {
    if (type != null) {
      selectedType.value = type;
    }
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

// import 'package:flutter/material.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:quick_ledger/utils/constants/enum.dart';

// class NewAccountController extends GetxController {

//   final accountNameController = TextEditingController();
//   final accountCodeController = TextEditingController();
//   final openingBalanceController = TextEditingController();
//   final descriptionController = TextEditingController();

//   final selectedType = AccountType.expense.obs;

//   void setAccountType(AccountType? type) {
//     if (type != null) {
//       selectedType.value = type;
//     }
//   }

//   void createAccount() {
//     // TODO
//   }

//   @override
//   void onClose() {
//     accountNameController.dispose();
//     accountCodeController.dispose();
//     openingBalanceController.dispose();
//     descriptionController.dispose();
//     super.onClose();
//   }
// }