import 'dart:developer';

import 'package:get/get.dart';
import 'package:quick_ledger/features/ledger/controllers/accounts/account_controller.dart';
import 'package:quick_ledger/features/ledger/model/reports/profit_loss/profit_loss_item_model.dart';
import 'package:quick_ledger/utils/constants/enum.dart';

class ProfitLossController extends GetxController {
  static ProfitLossController get instance => Get.find();
  

  /// ---------------------------------------------------------
  /// INCOME ACCOUNTS
  ///
  /// Reads all accounts and keeps only Income accounts.
  /// ---------------------------------------------------------
  List<ProfitLossItemModel> get incomeAccounts {
    log("========== BUILD INCOME ==========");

    final accounts = AccountController.instance.allAccounts;

    return accounts
        .where((account) => account.type == AccountType.income)
        .map((account) {
      log(
'''
Income Account : ${account.name}
Balance        : ${account.currentBalance}
''',
      );

      return ProfitLossItemModel(
        accountId: account.id,
        accountName: account.name,
        amount: account.currentBalance,
      );
    }).toList();
  }

  /// ---------------------------------------------------------
  /// EXPENSE ACCOUNTS
  /// ---------------------------------------------------------
  List<ProfitLossItemModel> get expenseAccounts {
    log("========== BUILD EXPENSE ==========");

    final accounts = AccountController.instance.allAccounts;

    return accounts
        .where((account) => account.type == AccountType.expense)
        .map((account) {
      log(
'''
Expense Account : ${account.name}
Balance         : ${account.currentBalance}
''',
      );

      return ProfitLossItemModel(
        accountId: account.id,
        accountName: account.name,
        amount: account.currentBalance,
      );
    }).toList();
  }

  /// ---------------------------------------------------------
  /// TOTAL INCOME
  /// ---------------------------------------------------------
  double get totalIncome {
    final total = incomeAccounts.fold(
      0.0,
      (sum, item) => sum + item.amount,
    );

    log("Total Income : $total");

    return total;
  }

  /// ---------------------------------------------------------
  /// TOTAL EXPENSE
  /// ---------------------------------------------------------
  double get totalExpense {
    final total = expenseAccounts.fold(
      0.0,
      (sum, item) => sum + item.amount,
    );

    log("Total Expense : $total");

    return total;
  }

  /// ---------------------------------------------------------
  /// NET PROFIT
  /// ---------------------------------------------------------
  double get netProfit {
    final profit = totalIncome - totalExpense;

    log("Net Profit : $profit");

    return profit;
  }

  /// ---------------------------------------------------------
  /// LOSS CHECK
  /// ---------------------------------------------------------
  bool get isProfit => netProfit >= 0;
}