import 'package:flutter/material.dart';
import 'package:quick_ledger/features/ledger/screens/home/widget/balance_section.dart';
import 'package:quick_ledger/utils/constants/colors.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/helpers/helper_functions.dart';

class GBalanceCard extends StatelessWidget {
  const GBalanceCard({
    super.key,
    required this.netAssets,
    required this.cashTotal,
    required this.bankTotal,
    required this.reievable
  });

  final String netAssets;

  final String reievable;

  final String cashTotal;

  final String bankTotal;



  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(GSizes.lg),

      decoration: BoxDecoration(
        color: dark
            ? GColors.primary.withValues(alpha: .2)
            : GColors.primary.withValues(alpha:.2),
        borderRadius: BorderRadius.circular(GSizes.radiusLg),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Net Assets

          Text(
            'Available Balance',
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: dark
                      ? GColors.primaryLight
                      : GColors.dark,
                ),
          ),

          const SizedBox(height: GSizes.xs),

          Text(
            netAssets,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),

          const SizedBox(height:  GSizes.spaceBtwItems,),

          GBalanceSection(
            title: 'Cash',
            total: cashTotal,
          ),

          /// Bank

          GBalanceSection(
            title: 'Bank',
            total: bankTotal,
  
          ),
           GBalanceSection(
            title: 'Recievable',
            total: reievable
  
          ),
        ],
      ),
    );
  }
}