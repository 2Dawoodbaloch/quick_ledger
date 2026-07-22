import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/// Confirmation dialogs: "Reverse this entry?", "Delete this account?".
/// Any destructive or hard-to-undo action in the app should go through
/// a dialog using this theme rather than firing immediately on tap.
class GDialogTheme {
  GDialogTheme._();

  static const lightDialogTheme = DialogThemeData(
    backgroundColor: GColors.white,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(GSizes.radiusLg)),
    ),
    titleTextStyle: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: GColors.dark,
    ),
    contentTextStyle: TextStyle(fontSize: 13.0, color: GColors.grey),
  );

  static const darkDialogTheme = DialogThemeData(
    backgroundColor: GColors.cardDark,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(GSizes.radiusLg)),
    ),
    titleTextStyle: TextStyle(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: GColors.textPrimaryDark,
    ),
    contentTextStyle: TextStyle(fontSize: 13.0, color: GColors.textSecondaryDark),
  );
}
