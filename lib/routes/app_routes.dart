import 'dart:developer';
import 'package:get/get.dart';
import 'package:quick_ledger/bindings/balance_sheet_binding.dart';
import 'package:quick_ledger/bindings/general_ledger_binding.dart';
import 'package:quick_ledger/bindings/login_binding.dart';
import 'package:quick_ledger/bindings/navigation_binding.dart';
import 'package:quick_ledger/bindings/new_account_screen_binding.dart';
import 'package:quick_ledger/bindings/new_journal_entry_binding.dart';
import 'package:quick_ledger/bindings/profit_loss_binding.dart';
import 'package:quick_ledger/bindings/signup_bindings.dart';
import 'package:quick_ledger/bindings/trial_balance_binding.dart';
import 'package:quick_ledger/bottom_navigation.dart';
import 'package:quick_ledger/features/authentication/screens/login/login.dart';
import 'package:quick_ledger/features/authentication/screens/signup/signup.dart';
import 'package:quick_ledger/features/ledger/screens/accounts/accounts.dart';
import 'package:quick_ledger/features/ledger/screens/accounts/new_accounts/new_accounts.dart';
import 'package:quick_ledger/features/ledger/screens/home/home.dart';
import 'package:quick_ledger/features/ledger/screens/journals/journal.dart';
import 'package:quick_ledger/features/ledger/screens/journals/new_journal_entry/new_journal_entry.dart';
import 'package:quick_ledger/features/ledger/screens/reports/balance_sheet/balance_sheet_screen.dart';
import 'package:quick_ledger/features/ledger/screens/reports/general_ledger/general_ledger_detail_screen.dart';
import 'package:quick_ledger/features/ledger/screens/reports/general_ledger/general_ledger_screen.dart';
import 'package:quick_ledger/features/ledger/screens/reports/profit_loss/profit_loss_screen.dart';
import 'package:quick_ledger/features/ledger/screens/reports/reports.dart';
import 'package:quick_ledger/features/ledger/screens/reports/trial_balance/trial_balance.dart';
import 'package:quick_ledger/features/personalization/profiles/profile_screen.dart';
import 'package:quick_ledger/routes/routes_name.dart';

class AppRouter {
  AppRouter._();

  static final List<GetPage> pages = [


  
    GetPage(name: RoutesName.login, page: () =>  LoginScreen(),binding: LoginBinding()),
    GetPage(name: RoutesName.signup, page: () =>  SignUpScreen(),binding: SignupBinding()),

    // navigation menu
    GetPage(
      name: RoutesName.navigationMenu,
      page: () => const NavigationMenu(),
      binding: NavigationBinding(),
    ),

GetPage(
  name: RoutesName.userProfile,
  page: () =>  ProfileScreen(),
),
    // home
    GetPage(name: RoutesName.home, page: () => HomeScreen()),

    // journal
    GetPage(name: RoutesName.journal, page: () => JournalsScreen()),
    GetPage(
      name: RoutesName.newJournalEntry,
      page: () => NewJournalEntryScreen(),
      binding: NewJournalEntryBinding(),
    ),

    // account
    GetPage(name: RoutesName.accounts, page: () => AccountsScreen()),
    GetPage(
      name: RoutesName.newAccounts,
      page: () {
        log("PAGE BUILDER EXECUTED");
        return NewAccountScreen();
      },
      binding: NewAccountBinding(),
    ),

    // reports
    GetPage(name: RoutesName.reports, page: () => ReportsScreen()),
    GetPage(name: RoutesName.profitLoss, page: () => ProfitLossScreen()),

    GetPage(
      name: RoutesName.generalLedger,
      page: () => GeneralLedgerScreen(),
      binding: GeneralLedgerBinding(),
    ),
    GetPage(
      name: RoutesName.generalLedgerDetailScreen,
      page: () => GeneralLedgerDetailScreen(),
    ),

    //Trial balance
    GetPage(name: RoutesName.trialBalance, page: () => TrialBalanceScreen(),binding: TrialBalanceBinding()),
     GetPage(name: RoutesName.balanceSheet, page: () => BalanceSheetScreen(),binding: BalanceSheetBinding()),
     GetPage(name: RoutesName.profitLoss, page: () => ProfitLossScreen(),binding: ProfitLossBinding())
  ];
}
