import 'package:get/get.dart';
import 'package:quick_ledger/features/ledger/controllers/accounts/controller.dart';
import 'package:quick_ledger/features/ledger/model/home/balance_account_model.dart';
import 'package:quick_ledger/features/ledger/model/home/transactions_model.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();

  // ---- Header ----
  final RxString userName = 'Ahmed'.obs;

  String get greeting {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning';
    if (hour < 17) return 'Good afternoon';
    return 'Good evening';
  }

  double get availableBalance => AccountController.instance.availableBalance;

  // final currentBalance = '\$25,420'.obs;
  final cashTotal = '\$4,000'.obs;
  final cashRecievable = '\$96,000'.obs;
  final bankTotal = '\$21,420'.obs;

  final cashAccounts = <BalanceAccountModel>[
    BalanceAccountModel(name: 'Cash in Hand', amount: 4444.0),
    BalanceAccountModel(name: 'Petty Cash', amount: 5500.0),
  ].obs;

  final bankAccounts = <BalanceAccountModel>[
    BalanceAccountModel(name: 'Meezan Bank', amount: 3000.0),
    BalanceAccountModel(name: 'HBL Current', amount: 2200.0),
  ].obs;

  // ---- Balance card ----
  // final RxDouble currentBalance = 25420.0.obs;

  // ---- Summary row ----
  final RxDouble income = 13400.0.obs;
  final RxDouble expense = 7800.0.obs;
  final RxDouble profit = 5600.0.obs;

  // double get profit => income.value - expense.value;

  // ---- Recent transactions ----
  final RxList<TransactionModel> recentTransactions = <TransactionModel>[].obs;
  // final RxList<TransactionModel> recentTransactions = <TransactionModel>[
  //   TransactionModel(title: 'Office rent', amount: 1200, isIncome: false, date: 'Today'),
  //   TransactionModel(title: 'Sales revenue', amount: 4200, isIncome: true, date: 'Yesterday'),
  // ].obs;

  // Next up: quickActions
}
