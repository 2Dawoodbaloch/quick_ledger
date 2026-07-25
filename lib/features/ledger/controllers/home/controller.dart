import 'package:get/get.dart';
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

  // ---- Balance card ----
  final RxDouble currentBalance = 25420.0.obs;

  // ---- Summary row ----
  final RxDouble income = 13400.0.obs;
  final RxDouble expense = 7800.0.obs;
  final RxDouble profit = 5600.0.obs;

  // ---- Recent transactions ----
  final RxList<TransactionModel> recentTransactions = <TransactionModel>[].obs;
  // final RxList<TransactionModel> recentTransactions = <TransactionModel>[
  //   TransactionModel(title: 'Office rent', amount: 1200, isIncome: false, date: 'Today'),
  //   TransactionModel(title: 'Sales revenue', amount: 4200, isIncome: true, date: 'Yesterday'),
  // ].obs;

  // Next up: quickActions
}