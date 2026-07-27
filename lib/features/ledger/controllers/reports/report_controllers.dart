import 'package:get/get.dart';
import 'package:quick_ledger/features/ledger/controllers/journal/controller.dart';
import 'package:quick_ledger/features/ledger/model/journal/journal_entries_model.dart';
import 'package:quick_ledger/utils/constants/enum.dart';

/// Reports has no data of its own — every number here is DERIVED from
/// JournalController.allEntries (specifically, the line snapshots
/// captured when each entry was posted). Nothing ever gets "added" to
/// Reports directly; it just recalculates whenever the underlying
/// journal data changes.
class ReportsController extends GetxController {
  static ReportsController get instance => Get.find();

  final Rx<DateTime> rangeStart =
      DateTime.now().subtract(const Duration(days: 21)).obs;
  final Rx<DateTime> rangeEnd = DateTime.now().obs;

  void setRange(DateTime start, DateTime end) {
    rangeStart.value = start;
    rangeEnd.value = end;
  }

  /// Only POSTED entries count for reporting — drafts aren't final
  /// yet, so including them would make reports lie about the real
  /// state of the books. Also filtered to the selected date range.
  List<JournalEntryModel> get entriesInRange {
    return JournalController.instance.allEntries.where((entry) {
      final isPosted = entry.status == JournalStatus.posted;
      final inRange = !entry.date.isBefore(rangeStart.value) &&
          !entry.date.isAfter(rangeEnd.value);
      return isPosted && inRange;
    }).toList();
  }

  bool get hasAnyPostedEntries =>
      JournalController.instance.allEntries.any((e) => e.status == JournalStatus.posted);

  // ============================================================
  // PROFIT & LOSS
  // ============================================================

  /// Income = credits to Income-type accounts. Expense = debits to
  /// Expense-type accounts. This only works correctly because each
  /// line now carries its real AccountType, captured at posting time
  /// — without that, this would just be a guess.
  double get totalIncome {
    double sum = 0;
    for (final entry in entriesInRange) {
      for (final line in entry.lines) {
        if (line.accountType == AccountType.income) sum += line.credit;
      }
    }
    return sum;
  }

  double get totalExpense {
    double sum = 0;
    for (final entry in entriesInRange) {
      for (final line in entry.lines) {
        if (line.accountType == AccountType.expense) sum += line.debit;
      }
    }
    return sum;
  }

  double get profit => totalIncome - totalExpense;

  // ============================================================
  // TRIAL BALANCE
  // ============================================================

  /// Sums debit/credit across every line of every posted entry —
  /// NOT filtered by date range, since Trial Balance is a snapshot of
  /// the whole ledger's current state, not a period report.
  double get trialTotalDebit {
    double sum = 0;
    for (final entry in JournalController.instance.allEntries) {
      if (entry.status != JournalStatus.posted) continue;
      for (final line in entry.lines) {
        sum += line.debit;
      }
    }
    return sum;
  }

  double get trialTotalCredit {
    double sum = 0;
    for (final entry in JournalController.instance.allEntries) {
      if (entry.status != JournalStatus.posted) continue;
      for (final line in entry.lines) {
        sum += line.credit;
      }
    }
    return sum;
  }

  /// This should ALWAYS be true if the app is working correctly —
  /// every posted entry was already validated balanced before it
  /// could be posted (see canPost in NewJournalEntryController). If
  /// this is ever false, it means a bug let an unbalanced entry
  /// through, not that the user did something wrong.
  bool get isTrialBalanced => trialTotalDebit == trialTotalCredit;

  // ============================================================
  // GENERAL LEDGER
  // ============================================================

  int get postedEntryCount =>
      JournalController.instance.allEntries.where((e) => e.status == JournalStatus.posted).length;
}