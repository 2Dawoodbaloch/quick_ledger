import 'package:flutter/material.dart';
import 'package:quick_ledger/utils/constants/enum.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';

/// The filter chip row on the Journals screen: All / Sales / Purchase
/// / Bank / Cash. `null` in JournalType? represents "All".
class GJournalFilterChips extends StatelessWidget {
  const GJournalFilterChips({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  final JournalType? selected;
  final void Function(JournalType? type) onSelect;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _chip(context, label: GTexts.filterAll, value: null),
          const SizedBox(width: GSizes.xs),
          _chip(context, label: GTexts.filterSales, value: JournalType.sales),
          const SizedBox(width: GSizes.xs),
          _chip(context, label: GTexts.filterPurchase, value: JournalType.purchase),
          const SizedBox(width: GSizes.xs),
          _chip(context, label: GTexts.filterBank, value: JournalType.bank),
          const SizedBox(width: GSizes.xs),
          _chip(context, label: GTexts.filterCash, value: JournalType.cash),
        ],
      ),
    );
  }

  Widget _chip(BuildContext context, {required String label, required JournalType? value}) {
    final isSelected = selected == value;
    return ChoiceChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (_) => onSelect(value),
      // Color/shape/padding come from GChipTheme automatically —
      // only `selected` (structural state) is set here.
    );
  }
}