/// Whether a journal entry is still editable (draft) or locked into
/// the ledger (posted). Drives which actions show on the detail
/// screen: Draft -> Edit/Delete, Posted -> Reverse only.
enum JournalStatus { draft, posted }

/// Which journal a transaction belongs to. Drives the filter chips on
/// the Journals screen (All / Sales / Purchase / Bank / Cash) and
/// which accounts are commonly used when creating an entry.
enum JournalType { sales, purchase, bank, cash }

enum ReportsType { profit, trial, generalLedger, balanceSheet }

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


/// Which category an account belongs to. Drives the color used
/// everywhere the account appears (list, dropdowns, reports) — see
/// GColors.assetColor / liabilityColor / etc.
enum AccountType { asset, liability, equity, income, expense }
 
extension AccountTypeX on AccountType {
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
 
/// A finer classification WITHIN an AccountType. "Bank" and "Cash"
/// are both Type=Asset, but they need to be told apart so the
/// dashboard can show separate Cash/Bank totals instead of one lump
/// "Asset" number.
enum AccountCategory {
  cash,
  bank,
  receivable,
  inventory,
  payable,
  equity,
  revenue,
  expense,
}
 
extension AccountCategoryX on AccountCategory {
  String get label {
    switch (this) {
      case AccountCategory.cash:
        return 'Cash';
      case AccountCategory.bank:
        return 'Bank';
      case AccountCategory.receivable:
        return 'Receivable';
      case AccountCategory.inventory:
        return 'Inventory';
      case AccountCategory.payable:
        return 'Payable';
      case AccountCategory.equity:
        return 'equity';
      case AccountCategory.revenue:
        return 'Revenue';
      case AccountCategory.expense:
        return 'Expense';
    }
  }
}
 
/// Category is scoped to Type — someone who picks Type=Asset should
/// only ever see Asset-relevant categories (Cash, Bank, Receivable,
/// etc.), never "Revenue" or "Payable", which don't make sense there.
/// This is the mapping the New Account form's Category dropdown reads
/// from once Type is picked.
List<AccountCategory> categoriesForType(AccountType type) {
  switch (type) {
    case AccountType.asset:
      return [
        AccountCategory.cash,
        AccountCategory.bank,
        AccountCategory.receivable,
        AccountCategory.inventory,
      ];
    case AccountType.liability:
      return [AccountCategory.payable];
    case AccountType.equity:
      return [AccountCategory.equity];
    case AccountType.income:
      return [AccountCategory.revenue];
    case AccountType.expense:
      return [AccountCategory.expense];
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
