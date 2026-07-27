import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class GCardTheme {
  GCardTheme._();

  static CardThemeData lightCardTheme = CardThemeData(
    color: GColors.cardLight,
    elevation: GSizes.cardElevation,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(GSizes.cardRadiusSm),
      side: const BorderSide(color: GColors.lightGrey, width: 1), //// width 0.5 defalult
    ),
  );

  static CardThemeData darkCardTheme = CardThemeData(
    color: GColors.cardDark,
    elevation: GSizes.cardElevation,
    margin: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(GSizes.cardRadiusSm),
      side: const BorderSide(color: GColors.borderDark, width: 1), // width 0.5 defalult
    ),
  );
}
