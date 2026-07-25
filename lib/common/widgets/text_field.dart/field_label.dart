import 'package:flutter/material.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';

class GFieldLabel extends StatelessWidget {
  const GFieldLabel(this.text, {super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: GSizes.xs),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge,
      ),
    );
  }
}