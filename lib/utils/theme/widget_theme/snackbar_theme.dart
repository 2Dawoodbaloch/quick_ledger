import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/// Feedback after actions succeed: "Entry posted", "Account created",
/// or fail: "Couldn't save — check your connection". Floating style,
/// rounded to match the rest of the app's card language.
class GSnackBarTheme {
  GSnackBarTheme._();

  static const lightSnackBarTheme = SnackBarThemeData(
    backgroundColor: GColors.dark,
    contentTextStyle: TextStyle(fontSize: 13.0, color: GColors.white),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(GSizes.radiusMd)),
    ),
    actionTextColor: GColors.primaryLight,
  );

  static const darkSnackBarTheme = SnackBarThemeData(
    backgroundColor: GColors.cardDark,
    contentTextStyle: TextStyle(fontSize: 13.0, color: GColors.textPrimaryDark),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(GSizes.radiusMd)),
    ),
    actionTextColor: GColors.primary,
  );
}
