import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/// Secondary actions: "Save as draft", "Export". Bordered, transparent
/// background — visually subordinate to the ElevatedButton next to it.
class GOutlinedButtonTheme {
  GOutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: GColors.dark,
      backgroundColor: Colors.transparent,
      side: const BorderSide(color: GColors.lightGrey, width: 1),
      minimumSize: const Size(double.infinity, GSizes.buttonHeight),
      textStyle: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: GColors.dark,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(GSizes.buttonRadius),
      ),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: GColors.textPrimaryDark,
      backgroundColor: Colors.transparent,
      side: const BorderSide(color: GColors.borderDark, width: 1),
      minimumSize: const Size(double.infinity, GSizes.buttonHeight),
      textStyle: const TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: GColors.textPrimaryDark,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(GSizes.buttonRadius),
      ),
    ),
  );
}
