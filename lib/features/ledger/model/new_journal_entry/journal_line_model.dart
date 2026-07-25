import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// One row in the Lines section (e.g. "Accounts receivable — Dr 4,200").
/// accountName is reactive (Rx) so GDropdownField can bind to it the
/// same way controller.selectedJournalType.value works. Debit/credit
/// use plain TextEditingControllers since they're free-text number
/// entry, not a fixed set of options.
class JournalLineModel {
  JournalLineModel({String? accountName, String debit = '', String credit = ''})
      : accountName = Rx<String?>(accountName),
        debitController = TextEditingController(text: debit),
        creditController = TextEditingController(text: credit);

  final Rx<String?> accountName;
  final TextEditingController debitController;
  final TextEditingController creditController;

  void dispose() {
    debitController.dispose();
    creditController.dispose();
  }
}