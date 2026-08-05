import 'dart:developer';

import 'package:get/get.dart';
import 'package:quick_ledger/features/ledger/controllers/accounts/account_controller.dart';
import 'package:quick_ledger/features/ledger/controllers/reports/profit_loss/profit_loss_controller.dart';
import 'package:quick_ledger/features/ledger/model/reports/balance_sheet/balance_sheet_item_model.dart';
import 'package:quick_ledger/utils/constants/enum.dart';

class BalanceSheetController extends GetxController {
  static BalanceSheetController get instance => Get.find();

  final accountController = AccountController.instance;
  final profitLossController = ProfitLossController.instance;

  /// ---------------------------------------------------------
  /// ASSETS
  /// ---------------------------------------------------------

  List<BalanceSheetItemModel> get assets {
    log("========== BUILD ASSETS ==========");

    return accountController.allAccounts
        .where((a) => a.type == AccountType.asset)
        .map((account) {
      log(
'''
Asset : ${account.name}
Balance : ${account.currentBalance}
''');

      return BalanceSheetItemModel(
        accountId: account.id,
        accountName: account.name,
        balance: account.currentBalance,
      );
    }).toList();
  }

  /// ---------------------------------------------------------
  /// LIABILITIES
  /// ---------------------------------------------------------

  List<BalanceSheetItemModel> get liabilities {
    log("========== BUILD LIABILITIES ==========");

    return accountController.allAccounts
        .where((a) => a.type == AccountType.liability)
        .map((account) {
      log(
'''
Liability : ${account.name}
Balance : ${account.currentBalance}
''');

      return BalanceSheetItemModel(
        accountId: account.id,
        accountName: account.name,
        balance: account.currentBalance,
      );
    }).toList();
  }

  /// ---------------------------------------------------------
  /// EQUITY
  /// ---------------------------------------------------------

  List<BalanceSheetItemModel> get equity {
    log("========== BUILD EQUITY ==========");

    return accountController.allAccounts
        .where((a) => a.type == AccountType.equity)
        .map((account) {
      log(
'''
Equity : ${account.name}
Balance : ${account.currentBalance}
''');

      return BalanceSheetItemModel(
        accountId: account.id,
        accountName: account.name,
        balance: account.currentBalance,
      );
    }).toList();
  }

  /// ---------------------------------------------------------
  /// TOTALS
  /// ---------------------------------------------------------

  double get totalAssets =>
      assets.fold(0, (sum, item) => sum + item.balance);

  double get totalLiabilities =>
      liabilities.fold(0, (sum, item) => sum + item.balance);

  double get ownerEquity =>
      equity.fold(0, (sum, item) => sum + item.balance);

  /// Current year's profit from Profit & Loss

  double get currentProfit =>
      profitLossController.netProfit;

  double get totalEquity =>
      ownerEquity + currentProfit;

  /// ---------------------------------------------------------
  /// ACCOUNTING EQUATION
  /// ---------------------------------------------------------

  bool get isBalanced =>
      (totalAssets - (totalLiabilities + totalEquity)).abs() < 0.01;
}