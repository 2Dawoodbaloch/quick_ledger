import 'package:flutter/material.dart';
import '../../constants/colors.dart';

/// Your 5-tab bar: Home, Journals, + (center), Reports, Accounts.
/// Note: the center "+" is a separate FloatingActionButton layered on
/// top, not part of BottomNavigationBar itself — see GFabTheme note
/// in app_theme.dart if you add a dedicated FAB theme later.
class GBottomNavigationBarTheme {
  GBottomNavigationBarTheme._();

  static const lightBottomNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: GColors.white,
    elevation: 0,
    selectedItemColor: GColors.primary,
    unselectedItemColor: GColors.grey,
    selectedLabelStyle: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500),
    unselectedLabelStyle: TextStyle(fontSize: 10.0),
    type: BottomNavigationBarType.fixed,
  );

  static const darkBottomNavigationBarTheme = BottomNavigationBarThemeData(
    backgroundColor: GColors.cardDark,
    elevation: 0,
    selectedItemColor: GColors.primaryLight,
    unselectedItemColor: GColors.textSecondaryDark,
    selectedLabelStyle: TextStyle(fontSize: 10.0, fontWeight: FontWeight.w500),
    unselectedLabelStyle: TextStyle(fontSize: 10.0),
    type: BottomNavigationBarType.fixed,
  );
}
