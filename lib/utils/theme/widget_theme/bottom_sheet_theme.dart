import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/// The quick-add sheet that opens from the center "+" button on tabs
/// other than Journals/Accounts, offering "New journal entry" /
/// "New account". Rounded only at the top, matching standard bottom
/// sheet convention.
class GBottomSheetTheme {
  GBottomSheetTheme._();

  static const lightBottomSheetTheme = BottomSheetThemeData(
    backgroundColor: GColors.white,
    modalBackgroundColor: GColors.white,
    elevation: 0,
    modalElevation: 0,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(GSizes.radiusXl)),
    ),
  );

  static const darkBottomSheetTheme = BottomSheetThemeData(
    backgroundColor: GColors.cardDark,
    modalBackgroundColor: GColors.cardDark,
    elevation: 0,
    modalElevation: 0,
    surfaceTintColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(GSizes.radiusXl)),
    ),
  );
}
