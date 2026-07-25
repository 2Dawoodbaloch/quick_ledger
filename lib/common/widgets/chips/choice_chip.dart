import 'package:flutter/material.dart';
import 'package:quick_ledger/utils/constants/colors.dart';
import 'package:quick_ledger/utils/helpers/helper_functions.dart';

class GChoiceChip extends StatelessWidget {
  const GChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  final String label;
  final bool selected;
  final ValueChanged<bool>? onSelected;

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);

    return ChoiceChip(
      label: Text(
        label,
        style: Theme.of(context).chipTheme.labelStyle?.copyWith(
              color: selected
                  ? (dark ? GColors.dark : GColors.white)
                  : null,
            ),
      ),
      selected: selected,
      onSelected: onSelected,
      showCheckmark: false,
    );
  }
}