import 'package:flutter/material.dart';
import 'package:quick_ledger/utils/constants/colors.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';
import 'package:quick_ledger/utils/helpers/helper_functions.dart';

/// The green "Balanced" / red "Entry doesn't balance" banner above
/// the Save/Post buttons. Presentational — takes the already-computed
/// isBalanced flag and formatted amounts, doesn't do any math itself.
class GBalanceBanner extends StatelessWidget {
  const GBalanceBanner({
    super.key,
    required this.isBalanced,
    required this.totalDebit,
    required this.totalCredit,
    this.difference,
  });

  final bool isBalanced;
  final String totalDebit;
  final String totalCredit;
  final String? difference;

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    final color = isBalanced ? GColors.balanced : GColors.unbalanced;
    final bgColor = dark
        ? (isBalanced ? GColors.incomeBgDark : GColors.expenseBgDark)
        : (isBalanced ? GColors.balancedBg : GColors.unbalancedBg);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: GSizes.md, vertical: GSizes.sm),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(GSizes.radiusMd),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                isBalanced ? Icons.check : Icons.warning_amber_rounded,
                size: GSizes.iconSm,
                color: color,
              ),
              const SizedBox(width: GSizes.xs),
              Expanded(
                child: Text(
                  isBalanced ? GTexts.balanced : GTexts.entryDoesntBalance,
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: color),
                ),
              ),
              Text(
                'totalDebit = totalCredit',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: color),
              ),
            ],
          ),
          if (!isBalanced && difference != null) ...[
            const SizedBox(height: 2),
            Text(
              'Difference $difference',
              style: TextStyle(fontSize: 11, color: color),
            ),
          ],
        ],
      ),
    );
  }
}