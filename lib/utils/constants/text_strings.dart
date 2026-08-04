/// Repeated text labels used across the app. Keeping them here means
/// "Post entry" is spelled the same way everywhere, and if you add
/// localization later, this is the one file you translate.
class GTexts {
  GTexts._();

  // ============================================================
  // LOGIN
  // ============================================================
  static const String welcomeBack = 'Welcome back';
  static const String logInSubtitle = 'Log in to your ledger';
  static const String email = 'Email';
  static const String emailHint = 'you@company.com';
  static const String password = 'Password';
  static const String passwordHint = '••••••••';
  static const String forgotPassword = 'Forgot password?';
  static const String logIn = 'Log in';
  static const String orContinueWith = 'or continue with';
  static const String continueWithGoogle = 'Google';
  static const String continueWithApple = 'Apple';
  static const String rememberMe = "remember Me";
  static const String dontHaveAccount = "Don't have an account?";
  static const String signUp = 'Sign up';

  // ============================================================
  // SIGNUP
  // ============================================================
  static const String createYourAccount = 'Create your account';
  static const String signUpSubtitle = 'Set up your ledger in a few steps';

  // Forget Password Screen
  static const String forgetPasswordTitle = 'Forget Password';
  static const String forgetPasswordSubTitle =
      'No worries! Enter your registered email address, and we’ll help you reset your password';
  static const String submit = 'Submit';

  // Reset Password Screen
  static const String resetPasswordTitle = 'Password Reset Email Sent';
  static const String resetPasswordSubTitle =
      'We’ve sent a password reset link to your email. Please check your inbox and follow the instructions to reset your password';
  static const String done = 'Done';

  // Verify Email Screen
  static const String verifyEmailTitle = 'Verify your email address!';
  static const String verifyEmailSubTitle =
      'We’ve sent a verification link to your email. Please check your inbox and click the link to verify your account';
  static const String uContinue = 'Continue';
  static const String resendEmail = 'Resend Email';

  // Account Created Successfully Screen
  static const String accountCreatedTitle = 'Your account successfully created';
  static const String accountCreatedSubTitle =
      'Congratulations! Your account has been successfully created. You can now explore all the amazing features, start personalizing your experience, and enjoy seamless access to our services. Let’s get started!';

  static const String homeAppBarTitle = 'Good Morning';
  static const String homeAppBarSubTitle = 'Unknown Pro';
  static const String searchBarTitle = 'Search in Store';
  static const String popularCategories = 'Popular Categories';

  // Personal details
  static const String fullName = 'Full name';
  static const String fullNameHint = 'Ahmed Raza';
  static const String phoneNumber = 'Phone number';
  static const String phoneNumberHint = '+92 300 1234567';

  // Business details
  static const String businessDetails = 'Business details';
  static const String businessName = 'Business name';
  static const String businessNameHint = 'Raza Traders';
  static const String businessType = 'Business type';

  // Business type options — kept as a list here; consider promoting
  // to a BusinessType enum once this feeds real logic (e.g. choosing
  // a starter Chart of Accounts template per business type)
  static const List<String> businessTypeOptions = [
    'Retail',
    'Services',
    'Manufacturing',
    'Wholesale / trading',
    'Other',
  ];

  static const String privacyPolicy = 'Privacy Policy';
  static const String and = 'and';
  static const String termsOfUse = 'Terms of use';
  static const String createAccount = 'Create account';
  static const String alreadyHaveAccount = 'Already have an account?';

  // ============================================================
  // VALIDATION MESSAGES
  // ============================================================
  static const String fieldRequired = 'This field is required';
  static const String invalidEmail = 'Enter a valid email address';
  static const String invalidPhone = 'Enter a valid phone number';
  static const String passwordTooShort =
      'Password must be at least 8 characters';
  static const String mustAgreeToTerms =
      'You must agree to the terms to continue';

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
  static const String netBalance = "Net balance";
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
  static const String journalEntry = 'New journal entry';
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
  static const String accountCategory = 'Category';
  static const String openingBalance = 'Opening balance';
  static const String description = 'Description (optional)';
  static const String createsAccount = 'Create account';
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
