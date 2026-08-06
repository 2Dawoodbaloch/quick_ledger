import 'package:flutter/material.dart';
import 'package:quick_ledger/features/ledger/model/home/transactions_model.dart';
import 'package:quick_ledger/utils/constants/colors.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/helpers/helper_functions.dart';

class GTransactionTile extends StatelessWidget {
  const GTransactionTile({
    super.key,
    required this.transaction,
    this.onTap,
  });

  final TransactionModel transaction;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);
    final isIncome = transaction.isIncome;

    final color = isIncome ? GColors.income : GColors.expense;
    final bgColor = dark
        ? (isIncome ? GColors.incomeBgDark : GColors.expenseBgDark)
        : (isIncome ? GColors.incomeBg : GColors.expenseBg);

    return Card(
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: GSizes.md,
          vertical: 2,
        ),
        leading: CircleAvatar(
          backgroundColor: bgColor,
          child: Icon(
            isIncome ? Icons.south_west : Icons.north_east,
            color: color,
            size: GSizes.iconSm,
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        subtitle: Text(
          transaction.date,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        trailing: Text(
          '${isIncome ? '+' : '-'}RS${transaction.amount.toStringAsFixed(0)}',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: color,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}