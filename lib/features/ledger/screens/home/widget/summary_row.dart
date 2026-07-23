import 'package:flutter/material.dart';
import 'package:quick_ledger/utils/constants/colors.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';
import 'summary_card.dart';

/// The Income / Expense / Profit row. This widget owns the *layout*
/// (three equal-width cards in a Row) and the *icon/color mapping* for
/// each metric — the individual card itself (GSummaryCard) knows
/// nothing about which metric it's displaying.
class GSummaryRow extends StatelessWidget {
  const GSummaryRow({
    super.key,
    required this.income,
    required this.expense,
    required this.profit,
  });

  final String income;
  final String expense;
  final String profit;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GSummaryCard(
            icon: Icons.arrow_downward,
            iconColor: GColors.income,
            label: GTexts.income,
            value: income,
          ),
        ),
        const SizedBox(width: GSizes.sm),
        Expanded(
          child: GSummaryCard(
            icon: Icons.arrow_upward,
            iconColor: GColors.expense,
            label: GTexts.expense,
            value: expense,
          ),
        ),
        const SizedBox(width: GSizes.sm),
        Expanded(
          child: GSummaryCard(
            icon: Icons.trending_up,
            iconColor: GColors.profit,
            label: GTexts.profit,
            value: profit,
          ),
        ),
      ],
    );
  }
}