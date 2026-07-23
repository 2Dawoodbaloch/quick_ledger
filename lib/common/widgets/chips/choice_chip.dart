import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quick_ledger/utils/constants/colors.dart';

class GChoiceChip extends StatelessWidget {
  const GChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    required this.onSelected,
  });

  final String text;
  final bool selected;
  final ValueChanged<bool>? onSelected;

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Text(text),
      selected: selected,
      onSelected: onSelected,
      showCheckmark: false,
      selectedColor: GColors.primary,
      backgroundColor: GColors.white,
      side: BorderSide(
        color: selected
            ? GColors.primary
            : GColors.grey,
      ),
      labelStyle: TextStyle(
        color: selected ? GColors.dark : GColors.white,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}