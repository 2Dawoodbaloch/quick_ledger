import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/// Primary action buttons: "Post entry", "Create account",
/// "+ New journal entry". Solid fill, no shadow (flat design per mockups).
class GElevatedButtonTheme {
  GElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: GSizes.buttonElevation,
      backgroundColor: GColors.dark,
      foregroundColor: GColors.white,
      disabledBackgroundColor: GColors.lightGrey,
      disabledForegroundColor: GColors.grey,
      minimumSize: const Size(double.infinity, GSizes.buttonHeight),
      textStyle: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: GColors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(GSizes.buttonRadius),
      ),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: GSizes.buttonElevation,
      backgroundColor: GColors.textPrimaryDark,
      foregroundColor: GColors.scaffoldDark,
      disabledBackgroundColor: GColors.borderDark,
      disabledForegroundColor: GColors.textSecondaryDark,
      minimumSize: const Size(double.infinity, GSizes.buttonHeight),
      textStyle: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: GColors.scaffoldDark,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(GSizes.buttonRadius),
      ),
    ),
  );
}
