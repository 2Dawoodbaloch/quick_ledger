import 'package:flutter/material.dart';
import 'package:quick_ledger/common/widgets/text_field.dart/field_label.dart';

class GDateField extends StatelessWidget {
  const GDateField({
    super.key,
    required this.label,
    required this.value,
    required this.onTap,
  });

  final String label;
  final String value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GFieldLabel(label),

        InkWell(
          onTap: onTap,
          child: InputDecorator(
            decoration: const InputDecoration(),
            child: Text(value),
          ),
        ),
      ],
    );
  }
}