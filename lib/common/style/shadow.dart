import 'package:flutter/cupertino.dart';

import '../../utils/constants/colors.dart';

class GShadow {
  GShadow._();

  static List<BoxShadow> searchBarShadow = [
    BoxShadow(
      color: GColors.dark.withValues(alpha: 0.1),
      spreadRadius: 2.0,
      blurRadius: 4.0,
    ),
  ];

  static List<BoxShadow> verticalProductShadow = [
    BoxShadow(
      color: GColors.darkGrey.withValues(alpha: 0.1),
      blurRadius: 50,
      spreadRadius: 7,
      offset: const Offset(0, 2),
    ),
  ];
}
