import 'package:flutter/material.dart';
import '../../constants/colors.dart';

/// Tertiary/link-style actions: "+ Add line", "Use starter template".
/// No border, no fill — reads as a link, not a button.
class GTextButtonTheme {
  GTextButtonTheme._();

  static final lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: GColors.primary,
      textStyle: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        color: GColors.primary,
      ),
    ),
  );

  static final darkTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: GColors.primaryLight,
      textStyle: const TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        color: GColors.primaryLight,
      ),
    ),
  );
}
