/// Repeated text labels used across the app. Keeping them here means
/// "Post entry" is spelled the same way everywhere, and if you add
/// localization later, this is the one file you translate.
class GTexts {
  GTexts._();

  // ============================================================
  // BOTTOM NAVIGATION
  // ============================================================
  static const String navHome = 'Home';
  static const String navJournals = 'Journals';
  static const String navReports = 'Reports';
  static const String navAccounts = 'Accounts';

  // ============================================================
  // HOME / DASHBOARD
  // ============================================================
  static const String goodMorning = 'Good morning';
  static const String goodAfternoon = 'Good afternoon';
  static const String goodEvening = 'Good evening';
  static const String ledgerOverview = "Here's your ledger overview";
  static const String currentBalance = 'Current balance';
  static const String income = 'Income';
  static const String expense = 'Expense';
  static const String profit = 'Profit';
  static const String recentTransactions = 'Recent transactions';
  static const String quickActions = 'Quick actions';
  static const String noTransactionsYet = 'No transactions yet';
  static const String noTransactionsSubtitle =
      'Record your first journal entry to start building your ledger';

  // ============================================================
  // JOURNALS
  // ============================================================
  static const String journals = 'Journals';
  static const String searchJournalEntries = 'Search journal entries';
  static const String newJournalEntry = 'New journal entry';
  static const String noJournalEntriesYet = 'No journal entries yet';
  static const String noJournalEntriesSubtitle =
      'Every transaction — sales, rent, payroll — starts as a journal entry here';
  static const String filterAll = 'All';
  static const String filterSales = 'Sales';
  static const String filterPurchase = 'Purchase';
  static const String filterBank = 'Bank';
  static const String filterCash = 'Cash';
  static const String statusPosted = 'Posted';
  static const String statusDraft = 'Draft';

  // ============================================================
  // JOURNAL ENTRY FORM
  // ============================================================
  static const String journal = 'Journal';
  static const String reference = 'Reference';
  static const String date = 'Date';
  static const String narration = 'Narration';
  static const String lines = 'Lines';
  static const String addLine = 'Add line';
  static const String debit = 'Debit';
  static const String credit = 'Credit';
  static const String balanced = 'Balanced';
  static const String entryDoesntBalance = "Entry doesn't balance";
  static const String saveAsDraft = 'Save as draft';
  static const String postEntry = 'Post entry';
  static const String reverseEntry = 'Reverse entry';

  // ============================================================
  // ACCOUNTS
  // ============================================================
  static const String accounts = 'Accounts';
  static const String newAccount = 'New account';
  static const String accountName = 'Account name';
  static const String accountCode = 'Account code';
  static const String accountType = 'Type';
  static const String openingBalance = 'Opening balance';
  static const String description = 'Description (optional)';
  static const String createAccount = 'Create account';
  static const String noAccountsYet = 'No accounts set up yet';
  static const String noAccountsSubtitle =
      'Set up a few basics to get started — cash, bank, and revenue cover most small businesses';
  static const String useStarterTemplate = 'Use starter template';

  // Account types
  static const String typeAsset = 'Asset';
  static const String typeLiability = 'Liability';
  static const String typeEquity = 'Equity';
  static const String typeIncome = 'Income';
  static const String typeExpense = 'Expense';

  // ============================================================
  // REPORTS
  // ============================================================
  static const String reports = 'Reports';
  static const String reportsSubtitle = 'Financial statements and summaries';
  static const String profitAndLoss = 'Profit & loss';
  static const String profitAndLossSubtitle = 'Income vs expenses';
  static const String trialBalance = 'Trial balance';
  static const String trialBalanceSubtitle = 'All accounts, debit vs credit';
  static const String generalLedger = 'General ledger';
  static const String balanceSheet = 'Balance sheet';
  static const String exportReport = 'Export report';
  static const String nothingToReportYet = 'Nothing to report yet';
  static const String nothingToReportSubtitle =
      'Reports build automatically once you post your first journal entry';

  // ============================================================
  // SEARCH
  // ============================================================
  static const String noResultsFor = 'No results for';
  static const String noResultsSubtitle =
      'Check the spelling, or try searching by reference number or account name';
}
