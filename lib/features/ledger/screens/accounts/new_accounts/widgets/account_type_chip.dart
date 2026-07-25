import 'package:flutter/material.dart';
import 'package:quick_ledger/utils/constants/colors.dart';
import 'package:quick_ledger/utils/constants/enum.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/helpers/helper_functions.dart';

/// Unlike GChoiceChip (used for Journal filters, where every option
/// looks the same until selected), each AccountType here has its OWN
/// permanent color — Asset is always blue, Expense is always red,
/// regardless of whether it's selected. Selection just adds a border
/// on top of that existing color. This is why it's a separate widget
/// rather than a variant of GChoiceChip: the two chips solve
/// genuinely different design problems.
class GAccountTypeChip extends StatelessWidget {
  const GAccountTypeChip({
    super.key,
    required this.type,
    required this.isSelected,
  });

  final AccountType type;
  final bool isSelected;

  ({Color color, Color bg}) _colorsFor(AccountType type, bool dark) {
    switch (type) {
      case AccountType.asset:
        return (color: GColors.assetColor, bg: dark ? GColors.assetColor.withValues(alpha: 0.18) : GColors.assetBg);
      case AccountType.liability:
        return (color: GColors.liabilityColor, bg: dark ? GColors.liabilityColor.withValues(alpha: 0.18) : GColors.liabilityBg);
      case AccountType.equity:
        return (color: GColors.equityColor, bg: dark ? GColors.equityColor.withValues(alpha: 0.18) : GColors.equityBg);
      case AccountType.income:
        return (color: GColors.incomeAccountColor, bg: dark ? GColors.incomeBgDark : GColors.incomeAccountBg);
      case AccountType.expense:
        return (color: GColors.expenseAccountColor, bg: dark ? GColors.expenseBgDark : GColors.expenseAccountBg);
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    final colors = _colorsFor(type, dark);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: GSizes.sm, vertical: 6),
      decoration: BoxDecoration(
        color: colors.bg,
        borderRadius: BorderRadius.circular(GSizes.radiusSm),
        // Only the selected chip gets a visible border, in its own
        // color — everything else stays flat. This is what makes the
        // selected type "pop" without needing a completely different
        // background treatment.
        border: isSelected ? Border.all(color: colors.color, width: 1.5) : null,
      ),
      child: Text(
        type.label,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: colors.color),
      ),
    );
  }
}