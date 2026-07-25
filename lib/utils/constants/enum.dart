/// Whether a journal entry is still editable (draft) or locked into
/// the ledger (posted). Drives which actions show on the detail
/// screen: Draft -> Edit/Delete, Posted -> Reverse only.
enum JournalStatus { draft, posted }

/// Which journal a transaction belongs to. Drives the filter chips on
/// the Journals screen (All / Sales / Purchase / Bank / Cash) and
/// which accounts are commonly used when creating an entry.
enum JournalType { sales, purchase, bank, cash }

extension JournalStatusX on JournalStatus {
  String get label {
    switch (this) {
      case JournalStatus.draft:
        return 'Draft';
      case JournalStatus.posted:
        return 'Posted';
    }
  }
}

enum AccountType {
  asset,
  liability,
  equity,
  income,
  expense,
}

extension AccountTypeExtension on AccountType {
  String get label {
    switch (this) {
      case AccountType.asset:
        return 'Asset';

      case AccountType.liability:
        return 'Liability';

      case AccountType.equity:
        return 'Equity';

      case AccountType.income:
        return 'Income';

      case AccountType.expense:
        return 'Expense';
    }
  }
}

extension JournalTypeX on JournalType {
  String get label {
    switch (this) {
      case JournalType.sales:
        return 'Sales';
      case JournalType.purchase:
        return 'Purchase';
      case JournalType.bank:
        return 'Bank';
      case JournalType.cash:
        return 'Cash';
    }
  }
}