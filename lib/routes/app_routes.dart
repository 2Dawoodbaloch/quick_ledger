import 'dart:developer';

import 'package:get/get.dart';
import 'package:quick_ledger/bindings/navigation_binding.dart';
import 'package:quick_ledger/bindings/new_account_screen_binding.dart';
import 'package:quick_ledger/bindings/new_journal_entry_binding.dart';
import 'package:quick_ledger/bottom_navigation.dart';
import 'package:quick_ledger/features/authentication/screens/login/login.dart';
import 'package:quick_ledger/features/authentication/screens/signup/signup.dart';
import 'package:quick_ledger/features/ledger/screens/accounts/accounts.dart';
import 'package:quick_ledger/features/ledger/screens/accounts/new_accounts/new_accounts.dart';
import 'package:quick_ledger/features/ledger/screens/home/home.dart';
import 'package:quick_ledger/features/ledger/screens/journals/journal.dart';
import 'package:quick_ledger/features/ledger/screens/journals/new_journal_entry/new_journal_entry.dart';
import 'package:quick_ledger/routes/routes_name.dart';

class AppRouter {
  AppRouter._();

  static final List<GetPage> pages = [
    GetPage(name: RoutesName.login, page: () => const LoginScreen()),
    GetPage(name: RoutesName.signup, page: () => const SignUpScreen()),

    // navigation menu
    GetPage(
      name: RoutesName.navigationMenu,
      page: () => const NavigationMenu(),
      binding: NavigationBinding()
    ),

    // home
    GetPage(name: RoutesName.home, page: () => HomeScreen()),

    // journal
    GetPage(name: RoutesName.journal, page: () => JournalsScreen()),
    GetPage(
      name: RoutesName.newJournalEntry,
      page: () => NewJournalEntryScreen(),
      binding: NewJournalEntryBinding()
    ),

    GetPage(name: RoutesName.accounts, page: () => AccountsScreen()),
   GetPage(
  name: RoutesName.newAccounts,
  page: () {
    log("PAGE BUILDER EXECUTED");
    return NewAccountScreen();
  },
    binding: NewAccountBinding(),
  // binding: NewAccountBinding(),
),
  ];
}
