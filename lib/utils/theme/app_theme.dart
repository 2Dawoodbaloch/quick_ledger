import 'package:flutter/material.dart';
import 'package:quick_ledger/utils/theme/widget_theme/appbar_theme.dart';
import 'package:quick_ledger/utils/theme/widget_theme/bottom_navigation_bar_theme.dart';
import 'package:quick_ledger/utils/theme/widget_theme/bottom_sheet_theme.dart';
import 'package:quick_ledger/utils/theme/widget_theme/card_theme.dart';
import 'package:quick_ledger/utils/theme/widget_theme/chip_theme.dart';
import 'package:quick_ledger/utils/theme/widget_theme/dialog_theme.dart';
import 'package:quick_ledger/utils/theme/widget_theme/divider_theme.dart';
import 'package:quick_ledger/utils/theme/widget_theme/elevated_button_theme.dart';
import 'package:quick_ledger/utils/theme/widget_theme/outlined_button_theme.dart';
import 'package:quick_ledger/utils/theme/widget_theme/snackbar_theme.dart';
import 'package:quick_ledger/utils/theme/widget_theme/text_button_theme.dart';
import 'package:quick_ledger/utils/theme/widget_theme/text_form_field_theme.dart';
import 'package:quick_ledger/utils/theme/widget_theme/text_theme.dart';
import '../constants/colors.dart';

/// Only file that assembles the individual widget themes into a
/// ThemeData. Nothing else should be defined directly in here — if you
/// need to change how a specific widget looks, edit its file in
/// widget_themes/, not this one.
class GAppTheme {
  GAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter', // swap for whatever font you add to pubspec
    brightness: Brightness.light,
    primaryColor: GColors.primary,
    disabledColor: GColors.grey,
    scaffoldBackgroundColor: GColors.light,
    textTheme: GTextTheme.lightTextTheme,
    elevatedButtonTheme: GElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: GOutlinedButtonTheme.lightOutlinedButtonTheme,
    textButtonTheme: GTextButtonTheme.lightTextButtonTheme,
    chipTheme: GChipTheme.lightChipTheme,
    inputDecorationTheme: GTextFormFieldTheme.lightInputDecorationTheme,
    appBarTheme: GAppBarTheme.lightAppBarTheme,
    bottomNavigationBarTheme:
        GBottomNavigationBarTheme.lightBottomNavigationBarTheme,
    cardTheme: GCardTheme.lightCardTheme,
    dividerTheme: GDividerTheme.lightDividerTheme,
    snackBarTheme: GSnackBarTheme.lightSnackBarTheme,
    dialogTheme: GDialogTheme.lightDialogTheme,
    bottomSheetTheme: GBottomSheetTheme.lightBottomSheetTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Inter',
    brightness: Brightness.dark,
    primaryColor: GColors.primaryLight,
    disabledColor: GColors.textSecondaryDark,
    scaffoldBackgroundColor: GColors.scaffoldDark,
    textTheme: GTextTheme.darkTextTheme,
    elevatedButtonTheme: GElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: GOutlinedButtonTheme.darkOutlinedButtonTheme,
    textButtonTheme: GTextButtonTheme.darkTextButtonTheme,
    chipTheme: GChipTheme.darkChipTheme,
    inputDecorationTheme: GTextFormFieldTheme.darkInputDecorationTheme,
    appBarTheme: GAppBarTheme.darkAppBarTheme,
    bottomNavigationBarTheme:
        GBottomNavigationBarTheme.darkBottomNavigationBarTheme,
    cardTheme: GCardTheme.darkCardTheme,
    dividerTheme: GDividerTheme.darkDividerTheme,
    snackBarTheme: GSnackBarTheme.darkSnackBarTheme,
    dialogTheme: GDialogTheme.darkDialogTheme,
    bottomSheetTheme: GBottomSheetTheme.darkBottomSheetTheme,
  );
}
