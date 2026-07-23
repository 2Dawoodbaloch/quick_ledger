import 'package:flutter/material.dart';
import 'package:quick_ledger/utils/constants/colors.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/helpers/helper_functions.dart';

/// Hero card at the top of Home showing the current ledger balance.
/// Presentational only — pass the already-formatted amount string in
/// (e.g. "$25,420") so this widget doesn't need to know about currency
/// formatting or the intl package at all.
class GBalanceCard extends StatelessWidget {
  const GBalanceCard({
    super.key,
    required this.label,
    required this.amount,
  });

  final String label;
  final String amount;

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(GSizes.lg),
      decoration: BoxDecoration(
        color: dark ? GColors.primary.withValues(alpha: 0.18) : GColors.primaryLight,
        borderRadius: BorderRadius.circular(GSizes.radiusLg),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: GSizes.fontSizeSm,
              color: dark ? GColors.primaryLight : GColors.primary,
            ),
          ),
          const SizedBox(height: GSizes.xs),
          Text(
            amount,
            style: TextStyle(
              fontSize: GSizes.fontSizeXxl,
              fontWeight: FontWeight.w600,
              color: dark ? GColors.textPrimaryDark : GColors.dark,
            ),
          ),
        ],
      ),
    );
  }
}