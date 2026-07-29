import 'package:flutter/widgets.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class JournalLineModel {
  JournalLineModel({
    String? accountCode,
    String? accountName,
    String debit = '',
    String credit = '',
  })  : accountCode = Rx<String?>(accountCode),
        accountName = Rx<String?>(accountName),
        debitController = TextEditingController(text: debit),
        creditController = TextEditingController(text: credit);

  final Rx<String?> accountCode;
  final Rx<String?> accountName;

  final TextEditingController debitController;
  final TextEditingController creditController;

  void dispose() {
    debitController.dispose();
    creditController.dispose();
  }
}