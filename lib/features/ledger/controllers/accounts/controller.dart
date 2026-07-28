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
    print("========== ALL ACCOUNTS ==========");

    for (final a in allAccounts) {
      print(
        "Name: ${a.name} | "
        "Type: ${a.type} | "
        "Category: ${a.category} | "
        "Balance: ${a.balance}",
      );
    }

    print("==================================");
  }

  // ============================================================
  // CATEGORY TOTALS — what Home's balance breakdown actually needs
  // ============================================================

  double _totalForCategory(AccountCategory category) {
    return allAccounts
        .where((a) => a.category == category)
        .fold(0.0, (sum, a) => sum + a.balance);
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
        .fold(0.0, (s, a) => s + a.balance);
    final totalLiabilities = allAccounts
        .where((a) => a.type == AccountType.liability)
        .fold(0.0, (s, a) => s + a.balance);
    return totalAssets - totalLiabilities;
  }


void postJournal(JournalEntryModel journal) {
  for (final line in journal.lines) {
    // Find the real account
    final account = allAccounts.firstWhereOrNull(
      (a) => a.name == line.accountName,
    );

    if (account == null) {
      print("Account not found: ${line.accountName}");
      continue;
    }

    print("--------------------------------");
    print("Posting to: ${account.name}");
    print("Type: ${account.type}");
    print("Old Balance: ${account.balance}");
    print("Debit: ${line.debit}");
    print("Credit: ${line.credit}");

    switch (account.type) {
      case AccountType.asset:
        account.balance += line.debit;
        account.balance -= line.credit;
        break;

      case AccountType.income:
        account.balance -= line.debit;
        account.balance += line.credit;
        break;

      default:
        // We'll implement these later
        break;
    }

    print("New Balance: ${account.balance}");
  }

  // Notify GetX that balances changed
  allAccounts.refresh();
}
}
