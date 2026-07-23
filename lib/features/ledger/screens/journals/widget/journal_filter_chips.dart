import 'package:flutter/widgets.dart';
import 'package:quick_ledger/common/widgets/chips/choice_chip.dart';
import 'package:quick_ledger/utils/constants/enum.dart';

class GJournalFilterChips extends StatelessWidget {
  const GJournalFilterChips({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  final JournalType? selected;
  final ValueChanged<JournalType?> onSelect;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: [
        GChoiceChip(
          text: "All",
          selected: selected == null,
          onSelected: (_) => onSelect(null),
        ),

        ...JournalType.values.map(
          (type) => GChoiceChip(
            text: type.label,
            selected: selected == type,
            onSelected: (_) => onSelect(type),
          ),
        ),
      ],
    );
  }
}