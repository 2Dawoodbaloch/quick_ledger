import 'package:flutter/material.dart';
import '../../constants/colors.dart';

/// Typography scale for the whole app. Maps Material's TextTheme slots
/// to how they're actually used across screens:
/// headlineLarge -> hero balance figure ($25,420)
/// headlineMedium -> screen titles (Journals, Accounts, Reports)
/// titleMedium -> section titles (Recent transactions, Quick actions)
/// bodyMedium -> list item titles (Office rent, Cash in hand)
/// bodySmall -> list item subtitles (Jul 18, 2026 · Sales)
/// labelSmall -> bottom nav labels, timestamps, badges
class GTextTheme {
  GTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 28.0,
      fontWeight: FontWeight.w600,
      color: GColors.dark,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: GColors.dark,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: GColors.dark,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: GColors.dark,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: GColors.dark,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 13.0,
      fontWeight: FontWeight.w500,
      color: GColors.dark,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: GColors.dark,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 13.0,
      fontWeight: FontWeight.normal,
      color: GColors.dark,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.normal,
      color: GColors.grey,
    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: GColors.dark,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 11.0,
      fontWeight: FontWeight.normal,
      color: GColors.grey,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: 10.0,
      fontWeight: FontWeight.normal,
      color: GColors.grey,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: const TextStyle().copyWith(
      fontSize: 28.0,
      fontWeight: FontWeight.w600,
      color: GColors.textPrimaryDark,
    ),
    headlineMedium: const TextStyle().copyWith(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: GColors.textPrimaryDark,
    ),
    headlineSmall: const TextStyle().copyWith(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      color: GColors.textPrimaryDark,
    ),
    titleLarge: const TextStyle().copyWith(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: GColors.textPrimaryDark,
    ),
    titleMedium: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w600,
      color: GColors.textPrimaryDark,
    ),
    titleSmall: const TextStyle().copyWith(
      fontSize: 13.0,
      fontWeight: FontWeight.w500,
      color: GColors.textPrimaryDark,
    ),
    bodyLarge: const TextStyle().copyWith(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: GColors.textPrimaryDark,
    ),
    bodyMedium: const TextStyle().copyWith(
      fontSize: 13.0,
      fontWeight: FontWeight.normal,
      color: GColors.textPrimaryDark,
    ),
    bodySmall: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: GColors.textPrimaryDark,

    ),
    labelLarge: const TextStyle().copyWith(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: GColors.textPrimaryDark,
    ),
    labelMedium: const TextStyle().copyWith(
      fontSize: 11.0,
      fontWeight: FontWeight.normal,
      color: GColors.textSecondaryDark,
    ),
    labelSmall: const TextStyle().copyWith(
      fontSize: 10.0,
      fontWeight: FontWeight.normal,
      color: GColors.textSecondaryDark,
    ),
  );
}
