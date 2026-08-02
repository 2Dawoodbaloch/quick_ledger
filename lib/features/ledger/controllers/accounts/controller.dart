import 'dart:developer';

import 'package:get/get.dart';
import 'package:quick_ledger/features/ledger/model/accounts/account_model.dart';
import 'package:quick_ledger/features/ledger/model/journal/journal_entries_model.dart';
import 'package:quick_ledger/utils/constants/enum.dart';

class AccountController extends GetxController {
  static AccountController get instance => Get.find();

  /// Starts empty on purpose — same reasoning as JournalController.
  /// This is what makes AccountsScreen show its empty state by
  /// default for a new user.
  final RxList<AccountModel> allAccounts = <AccountModel>[].obs;

  /// Grouped in standard accounting order: Assets, Liabilities,
  /// Equity, Income, Expenses. Only non-empty groups are included, so
  /// the screen doesn't render an empty "Equity" header with nothing
  /// under it just because no equity account has been added yet.
  Map<AccountType, List<AccountModel>> get groupedAccounts {
    final Map<AccountType, List<AccountModel>> groups = {};
    for (final type in AccountType.values) {
      final accountsOfType = allAccounts.where((a) => a.type == type).toList();
      if (accountsOfType.isNotEmpty) {
        groups[type] = accountsOfType;
      }
    }
    return groups;
  }

  void addAccount(AccountModel account) {
    allAccounts.add(account);
    log("========== ALL ACCOUNTS ==========");

    for (final a in allAccounts) {
      log(
        "Code : ${a.code}"
        "Name: ${a.name} | "
        "Type: ${a.type} | "
        "Category: ${a.category} | "
        "Balance: ${a.currentBalance}",
      );
    }

    log("==================================");
  }

  // ============================================================
  // CATEGORY TOTALS — what Home's balance breakdown actually needs
  // ============================================================

  double _totalForCategory(AccountCategory category) {
    return allAccounts
        .where((a) => a.category == category)
        .fold(0.0, (sum, a) => sum + a.currentBalance);
  }

  List<AccountModel> get cashAccounts =>
      allAccounts.where((a) => a.category == AccountCategory.cash).toList();

  List<AccountModel> get bankAccounts =>
      allAccounts.where((a) => a.category == AccountCategory.bank).toList();

  List<AccountModel> get receivableAccounts => allAccounts
      .where((a) => a.category == AccountCategory.receivable)
      .toList();

  double get totalCash => _totalForCategory(AccountCategory.cash);
  double get totalBank => _totalForCategory(AccountCategory.bank);
  double get totalReceivable => _totalForCategory(AccountCategory.receivable);
  double get totalPayable => _totalForCategory(AccountCategory.payable);

  /// This is what Home's hero card should show — liquid money only.
  /// Deliberately excludes Receivable (owed but not collected yet).
  double get availableBalance => totalCash + totalBank;

  /// The REAL Net Assets figure — Assets minus Liabilities. This is
  /// what belongs on the Balance Sheet report, not Home's hero card.
  double get netAssets {
    final totalAssets = allAccounts
        .where((a) => a.type == AccountType.asset)
        .fold(0.0, (s, a) => s + a.currentBalance);
    final totalLiabilities = allAccounts
        .where((a) => a.type == AccountType.liability)
        .fold(0.0, (s, a) => s + a.currentBalance);
    return totalAssets - totalLiabilities;
  }

  void postJournal(JournalEntryModel journal) {
  log("========== POST JOURNAL ==========");

  for (final line in journal.lines) {
    // Find the account using its unique code
    final account = allAccounts.firstWhereOrNull(
      (a) => a.code == line.accountCode,
    );

    if (account == null) {
      log("❌ Account not found: ${line.accountCode}");
      continue;
    }

    log("--------------------------------");
    log("Posting Account : ${account.name}");
    log("Code            : ${account.code}");
    log("Type            : ${account.type}");
    log("Old Balance     : ${account.currentBalance}");
    log("Debit           : ${line.debit}");
    log("Credit          : ${line.credit}");

    switch (account.type) {
      // Assets: Debit ↑ Credit ↓
      case AccountType.asset:
        account.currentBalance += line.debit;
        account.currentBalance -= line.credit;
        break;

      // Liabilities: Credit ↑ Debit ↓
      case AccountType.liability:
        account.currentBalance += line.credit;
        account.currentBalance -= line.debit;
        break;

      // Equity: Credit ↑ Debit ↓
      case AccountType.equity:
        account.currentBalance += line.credit;
        account.currentBalance -= line.debit;
        break;

      // Income: Credit ↑ Debit ↓
      case AccountType.income:
        account.currentBalance += line.credit;
        account.currentBalance -= line.debit;
        break;

      // Expenses: Debit ↑ Credit ↓
      case AccountType.expense:
        account.currentBalance += line.debit;
        account.currentBalance -= line.credit;
        break;
    }

    log("New Balance     : ${account.currentBalance}");
  }

  allAccounts.refresh();

  log("========== POSTING COMPLETE ==========");
}
}
