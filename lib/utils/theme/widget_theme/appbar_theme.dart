import 'package:flutter/material.dart';
import '../../constants/colors.dart';

/// Used on every screen except Home (which has its own custom greeting
/// header instead of a standard AppBar) — Journals, Accounts, Reports,
/// New Journal Entry, New Account, Account Detail, Journal Entry Detail.
class GAppBarTheme {
  GAppBarTheme._();

  static const lightAppBarTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: GColors.light,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: GColors.dark, size: 20),
    actionsIconTheme: IconThemeData(color: GColors.dark, size: 20),
    titleTextStyle: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: GColors.dark,
    ),
  );

  static const darkAppBarTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    backgroundColor: GColors.scaffoldDark,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: GColors.textPrimaryDark, size: 20),
    actionsIconTheme: IconThemeData(color: GColors.textPrimaryDark, size: 20),
    titleTextStyle: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: GColors.textPrimaryDark,
    ),
  );
}
