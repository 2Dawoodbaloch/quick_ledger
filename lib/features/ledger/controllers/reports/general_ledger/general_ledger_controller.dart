import 'dart:developer';

import 'package:get/get.dart';
import 'package:quick_ledger/features/ledger/controllers/accounts/account_controller.dart';
import 'package:quick_ledger/features/ledger/controllers/journal/controller.dart';
import 'package:quick_ledger/features/ledger/model/reports/general_ledger/general_ledger_item_model.dart';

class GeneralLedgerController extends GetxController {
  static GeneralLedgerController get instance => Get.find();

  /// No stored list. No onInit. No manual "reload" step to remember.
  /// This recalculates from AccountController + JournalController
  /// EVERY time it's accessed — that's what makes it automatically
  /// correct after any future account or journal change, not just
  /// whatever existed at the moment the controller was created.
  List<GeneralLedgerItemModel> get ledgerAccounts {
    log("========== BUILD GENERAL LEDGER ==========");

    final accounts = AccountController.instance.allAccounts;
    final journals = JournalController.instance.allEntries;

    log("Accounts Found : ${accounts.length}");
    log("Journal Entries: ${journals.length}");

    final ledger = accounts.map((account) {
      final transactionCount = journals.where((journal) {
        return journal.lines.any((line) => line.accountId == account.id);
      }).length;

      log('''
----------------------------------------
Account Name : ${account.name}
Account Code : ${account.code}
Current Bal. : ${account.currentBalance}
Transactions : $transactionCount
----------------------------------------
''');

      return GeneralLedgerItemModel(
        accountId: account.id,
        accountName: account.name,
        accountCode: account.code,
        currentBalance: account.currentBalance,
        transactionCount: transactionCount,
      );
    }).toList();

    log("Ledger Accounts Built : ${ledger.length}");
    log("========== GENERAL LEDGER READY ==========");

    return ledger;
  }
}
