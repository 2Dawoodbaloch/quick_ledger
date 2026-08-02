import 'dart:developer';

import 'package:get/get.dart';
import 'package:quick_ledger/features/ledger/controllers/accounts/controller.dart';
import 'package:quick_ledger/features/ledger/model/reports/trial_balance/trial_balance_item_model.dart';
import 'package:quick_ledger/utils/constants/enum.dart';

class TrialBalanceController extends GetxController {
  static TrialBalanceController get instance => Get.find();

  ///-------------------------------------------------------------
  /// Trial Balance is always built from the latest Account balances.
  /// No stored list, no reload(), no onInit().
  ///-------------------------------------------------------------
  List<TrialBalanceItemModel> get items {
    final accounts = AccountController.instance.allAccounts;

    log("========== BUILD TRIAL BALANCE ==========");

    final result = accounts.map((account) {
      double debit = 0;
      double credit = 0;

      switch (account.type) {
        case AccountType.asset:
        case AccountType.expense:
          debit = account.currentBalance;
          break;

        case AccountType.liability:
        case AccountType.equity:
        case AccountType.income:
          credit = account.currentBalance;
          break;
      }

      log('''
---------------------------------------
Account : ${account.name}
Code    : ${account.code}
Type    : ${account.type}
Balance : ${account.currentBalance}

Debit   : $debit
Credit  : $credit
''');

      return TrialBalanceItemModel(
        accountId: account.id,
        accountCode: account.code,
        accountName: account.name,
        accountType: account.type,
        debit: debit,
        credit: credit,
      );
    }).toList();

    log("========== TRIAL BALANCE READY ==========");

    return result;
  }

  double get totalDebit =>
      items.fold(0.0, (sum, item) => sum + item.debit);

  double get totalCredit =>
      items.fold(0.0, (sum, item) => sum + item.credit);

  bool get isBalanced =>
      totalDebit == totalCredit;

  double get difference =>
      (totalDebit - totalCredit).abs();
}