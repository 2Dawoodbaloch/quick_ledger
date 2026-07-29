import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:quick_ledger/features/ledger/model/accounts/account_model.dart';

class JournalLineModel {
  JournalLineModel({
   AccountModel? account,
    String debit = '',
    String credit = '',
  })  : account = Rx<AccountModel?>(account),
        debitController = TextEditingController(text: debit),
        creditController = TextEditingController(text: credit);

  final Rx<AccountModel?> account;
  final TextEditingController debitController;
  final TextEditingController creditController;

  void dispose() {
    debitController.dispose();
    creditController.dispose();
  }
}