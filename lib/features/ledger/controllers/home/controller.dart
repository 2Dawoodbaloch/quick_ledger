import 'package:get/get.dart';
import 'package:quick_ledger/features/ledger/controllers/accounts/controller.dart';
import 'package:quick_ledger/features/ledger/controllers/journal/controller.dart';
import 'package:quick_ledger/features/ledger/model/home/transactions_model.dart';
import 'package:quick_ledger/features/ledger/model/journal/journal_entries_model.dart';
import 'package:quick_ledger/utils/constants/enum.dart';

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
  double get cashTotal => AccountController.instance.totalCash;
  double get cashRecievable => AccountController.instance.totalReceivable;
  double get bankTotal => AccountController.instance.totalBank;



  // ---- Summary row ----
  final RxDouble income = 13400.0.obs;
  final RxDouble expense = 7800.0.obs;
  final RxDouble profit = 5600.0.obs;

  // double get profit => income.value - expense.value;

   // ============================================================
  // RECENT TRANSACTIONS — no data of its own. Derived from
  // JournalController's posted entries, same "Reports has no data
  // of its own" pattern used everywhere else.
  // ============================================================
 
  List<TransactionModel> get recentTransactions {
    final posted = JournalController.instance.allEntries
        .where((e) => e.status == JournalStatus.posted)
        .toList();
 
    // Newest first — allEntries is already inserted at index 0 on
    // post, but sorting explicitly by date is safer than relying on
    // insertion order alone.
    posted.sort((a, b) => b.date.compareTo(a.date));
 
    return posted.take(4).map(_toTransactionModel).toList();
  }
 
  /// Converts one journal entry into a single displayable row by
  /// looking at its effect on Asset (Cash/Bank) accounts — did this
  /// entry put money IN or take money OUT? That's what "Office rent
  /// -$1,200" / "Sales revenue +$4,200" actually mean on Home: a
  /// cash-flow view, not a literal debit/credit view.
  TransactionModel _toTransactionModel(JournalEntryModel entry) {
    double assetDelta = 0;
    for (final line in entry.lines) {
      if (line.accountType == AccountType.asset) {
        assetDelta += line.debit - line.credit;
      }
    }
 
    // Fallback for entries with no Asset line at all (rare — e.g. a
    // pure equity adjustment): treat Income-credit as "in", anything
    // else as "out", so the list never breaks even for edge cases.
    if (assetDelta == 0) {
      final hasIncomeCredit = entry.lines.any(
        (l) => l.accountType == AccountType.income && l.credit > 0,
      );
      return TransactionModel(
        title: entry.narration,
        amount: entry.amount,
        isIncome: hasIncomeCredit,
        date: _formatRelativeDate(entry.date),
      );
    }
 
    return TransactionModel(
      title: entry.narration,
      amount: assetDelta.abs(),
      isIncome: assetDelta > 0,
      date: _formatRelativeDate(entry.date),
    );
  }
 
  String _formatRelativeDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final entryDay = DateTime(date.year, date.month, date.day);
    final diff = today.difference(entryDay).inDays;
 
    if (diff == 0) return 'Today';
    if (diff == 1) return 'Yesterday';
    return '${date.day}/${date.month}/${date.year}';
  }
 
  // Next up: quickActions

  // Next up: quickActions
}
