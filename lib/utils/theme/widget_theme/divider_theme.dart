import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

/// Hairline separators — used inside the Trial Balance table between
/// rows, and between form sections. Kept thin (0.5) to match the
/// mockups' subtle style rather than a heavy Material default divider.
class GDividerTheme {
  GDividerTheme._();

  static const lightDividerTheme = DividerThemeData(
    color: GColors.lightGrey,
    thickness: GSizes.dividerHeight,
    space: GSizes.md,
  );

  static const darkDividerTheme = DividerThemeData(
    color: GColors.borderDark,
    thickness: GSizes.dividerHeight,
    space: GSizes.md,
  );
}
