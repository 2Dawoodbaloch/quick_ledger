import 'package:flutter/material.dart';
import 'package:quick_ledger/common/widgets/text_field.dart/field_label.dart';
import 'package:quick_ledger/utils/constants/colors.dart';

class GDropdownField<T> extends StatelessWidget {
  const GDropdownField({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
  });

  final String label;
  final T value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GFieldLabel(label),
        DropdownButtonFormField<T>(
          dropdownColor: GColors.white,
          initialValue: value,
          items: items,
          onChanged: onChanged,
        ),
      ],
    );
  }
}