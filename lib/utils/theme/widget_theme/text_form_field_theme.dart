import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/// Every text input in the app: journal entry lines (debit/credit),
/// new account form, search bars, narration fields. One consistent
/// look everywhere — hairline border, no fill, label above the field.
class GTextFormFieldTheme {
  GTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
      // Add these
  filled: true,
  fillColor: GColors.white,
    errorMaxLines: 3,
    prefixIconColor: GColors.grey,
    suffixIconColor: GColors.grey,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: GSizes.md,
      vertical: 12,
    ),
    labelStyle: const TextStyle(fontSize: 12.0, color: GColors.dark),
    hintStyle: const TextStyle(fontSize: 13.0, color: GColors.darkGrey),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(GSizes.inputFieldRadius),
      borderSide: const BorderSide(color: GColors.lightGrey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(GSizes.inputFieldRadius),
      borderSide: const BorderSide(color: GColors.lightGrey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(GSizes.inputFieldRadius),
      borderSide: const BorderSide(color: GColors.primary, width: 1.2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(GSizes.inputFieldRadius),
      borderSide: const BorderSide(color: GColors.expense),
    ),
    // Used on the unbalanced-entry journal lines — red border, no fill
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(GSizes.inputFieldRadius),
      borderSide: const BorderSide(color: GColors.lightGrey),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: GColors.textSecondaryDark,
    suffixIconColor: GColors.textSecondaryDark,
    contentPadding: const EdgeInsets.symmetric(
      horizontal: GSizes.md,
      vertical: 12,
    ),
    labelStyle: const TextStyle(fontSize: 12.0, color: GColors.textSecondaryDark),
    hintStyle: const TextStyle(fontSize: 13.0, color: GColors.textSecondaryDark),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(GSizes.inputFieldRadius),
      borderSide: const BorderSide(color: GColors.borderDark),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(GSizes.inputFieldRadius),
      borderSide: const BorderSide(color: GColors.borderDark),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(GSizes.inputFieldRadius),
      borderSide: const BorderSide(color: GColors.primaryLight, width: 1.2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(GSizes.inputFieldRadius),
      borderSide: const BorderSide(color: GColors.expense),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(GSizes.inputFieldRadius),
      borderSide: const BorderSide(color: GColors.borderDark),
    ),
  );
}
