import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/// Every row-style card across the app: transaction rows on Home,
/// journal entry rows on Journals, account rows on Accounts, report
/// summary cards on Reports. Flat design — no shadow, hairline border
/// instead, matching the mockups.
class GCardTheme {
  GCardTheme._();

  static CardThemeData lightCardTheme = CardThemeData(
    color: GColors.cardLight,
    elevation: GSizes.cardElevation,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(GSizes.cardRadiusSm),
      side: const BorderSide(color: GColors.lightGrey, width: 0.5),
    ),
  );

  static CardThemeData darkCardTheme = CardThemeData(
    color: GColors.cardDark,
    elevation: GSizes.cardElevation,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(GSizes.cardRadiusSm),
      side: const BorderSide(color: GColors.borderDark, width: 0.5),
    ),
  );
}
