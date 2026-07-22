import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/// Covers two different uses that share the same widget shape:
/// 1. Filter chips (All / Sales / Purchase / Bank / Cash on Journals screen)
/// 2. Status pills (Posted / Draft badges, Asset/Liability/Equity tags)
///
/// This theme sets the STRUCTURE (shape, padding, label size) that's
/// shared by both. The actual fill color for status pills is passed
/// per-instance via Chip's `backgroundColor` (e.g. GColors.postedBg),
/// since each status needs its own color — that can't live in one
/// shared ChipThemeData.
class GChipTheme {
  GChipTheme._();

  static final lightChipTheme = ChipThemeData(
    disabledColor: GColors.lightGrey,
    labelStyle: const TextStyle(fontSize: 11.0, color: GColors.dark),
    selectedColor: GColors.dark,
    padding: const EdgeInsets.symmetric(horizontal: GSizes.sm, vertical: 4),
    checkmarkColor: GColors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(GSizes.radiusSm),
      side: const BorderSide(color: GColors.lightGrey),
    ),
  );

  static final darkChipTheme = ChipThemeData(
    disabledColor: GColors.borderDark,
    labelStyle: const TextStyle(fontSize: 11.0, color: GColors.textPrimaryDark),
    selectedColor: GColors.textPrimaryDark,
    padding: const EdgeInsets.symmetric(horizontal: GSizes.sm, vertical: 4),
    checkmarkColor: GColors.scaffoldDark,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(GSizes.radiusSm),
      side: const BorderSide(color: GColors.borderDark),
    ),
  );
}
