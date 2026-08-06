import 'package:flutter/material.dart';
import 'package:quick_ledger/features/ledger/model/reports/general_ledger/general_ledger_item_model.dart';
import 'package:quick_ledger/utils/constants/colors.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/helpers/helper_functions.dart';

class GGeneralLedgerCard extends StatelessWidget {
  const GGeneralLedgerCard({
    super.key,
    required this.item,
    required this.onTap,
  });

  final GeneralLedgerItemModel item;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);

    return InkWell(
      borderRadius: BorderRadius.circular(GSizes.cardRadiusLg),
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: GSizes.spaceBtwItems),
        padding: const EdgeInsets.all(GSizes.md),
        decoration: BoxDecoration(
          color: Theme.of(context).cardTheme.color,
          borderRadius: BorderRadius.circular(GSizes.cardRadiusLg),
          border: Border.all(
            color: dark ? GColors.borderDark : GColors.grey,
            width: .5,
          ),
        ),

        child: Row(
          children: [

            /// Icon
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                color: dark
                    ? GColors.dark
                    : GColors.light,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.account_balance),
            ),

            const SizedBox(width: GSizes.md),

            /// Name + Entry Count
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    item.accountName,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),

                  const SizedBox(height: 4),

                  Text(
                    "${item.transactionCount} Entries",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),

            /// Balance
            Text(
              "RS${item.currentBalance.toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.titleMedium,
            ),

            const SizedBox(width: 8),

            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}