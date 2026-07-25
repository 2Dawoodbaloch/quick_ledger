import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
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

  void createAccount() {
    // TODO
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