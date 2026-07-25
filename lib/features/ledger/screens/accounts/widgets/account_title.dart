import 'package:flutter/material.dart';
import 'package:quick_ledger/features/ledger/model/accounts/account_model.dart';
import 'package:quick_ledger/utils/constants/colors.dart';
import 'package:quick_ledger/utils/constants/enum.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/helpers/helper_functions.dart';

class GAccountTile extends StatelessWidget {
  const GAccountTile({super.key, required this.account, this.onTap});

  final AccountModel account;
  final VoidCallback? onTap;

  ({IconData icon, Color color, Color bg}) _styleFor(AccountType type, bool dark) {
    switch (type) {
      case AccountType.asset:
        return (
          icon: Icons.account_balance_wallet_outlined,
          color: GColors.assetColor,
          bg: dark ? GColors.assetColor.withValues(alpha: 0.18) : GColors.assetBg,
        );
      case AccountType.liability:
        return (
          icon: Icons.receipt_long_outlined,
          color: GColors.liabilityColor,
          bg: dark ? GColors.liabilityColor.withValues(alpha: 0.18) : GColors.liabilityBg,
        );
      case AccountType.equity:
        return (
          icon: Icons.pie_chart_outline,
          color: GColors.equityColor,
          bg: dark ? GColors.equityColor.withValues(alpha: 0.18) : GColors.equityBg,
        );
      case AccountType.income:
        return (
          icon: Icons.trending_up,
          color: GColors.incomeAccountColor,
          bg: dark ? GColors.incomeBgDark : GColors.incomeAccountBg,
        );
      case AccountType.expense:
        return (
          icon: Icons.trending_down,
          color: GColors.expenseAccountColor,
          bg: dark ? GColors.expenseBgDark : GColors.expenseAccountBg,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    final style = _styleFor(account.type, dark);

    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(GSizes.cardRadiusSm),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: GSizes.md, vertical: GSizes.sm),
          child: Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(color: style.bg, borderRadius: BorderRadius.circular(8)),
                child: Center(child: Icon(style.icon, size: GSizes.iconSm, color: style.color)),
              ),
              const SizedBox(width: GSizes.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(account.name, style: Theme.of(context).textTheme.bodyLarge),
                    Text(account.code, style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
              Text(
                '\$${account.balance.toStringAsFixed(0)}',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}