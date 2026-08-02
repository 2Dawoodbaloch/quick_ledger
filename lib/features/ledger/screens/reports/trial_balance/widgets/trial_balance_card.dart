import 'package:flutter/material.dart';
import 'package:quick_ledger/features/ledger/model/reports/trial_balance/trial_balance_item_model.dart';
import 'package:quick_ledger/utils/constants/colors.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/helpers/helper_functions.dart';

class GTrialBalanceCard extends StatelessWidget {
  const GTrialBalanceCard({
    super.key,
    required this.item,
  });

  final TrialBalanceItemModel item;

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.all(GSizes.md),

      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,

        borderRadius:
            BorderRadius.circular(GSizes.cardRadiusMd),

        border: Border.all(
          color: dark
              ? GColors.borderDark
              : GColors.lightGrey,
          width: .5,
        ),
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [

          Text(
            item.accountName,
            style: Theme.of(context)
                .textTheme
                .titleMedium,
          ),

          const SizedBox(height: 2),

          Text(
            item.accountCode,
            style:
                Theme.of(context).textTheme.bodySmall,
          ),

          const SizedBox(height: GSizes.md),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

            children: [

              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [

                  const Text("Debit"),

                  Text(
                    item.debit == 0
                        ? "-"
                        : item.debit.toStringAsFixed(2),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment:
                    CrossAxisAlignment.end,
                children: [

                  const Text("Credit"),

                  Text(
                    item.credit == 0
                        ? "-"
                        : item.credit.toStringAsFixed(2),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}