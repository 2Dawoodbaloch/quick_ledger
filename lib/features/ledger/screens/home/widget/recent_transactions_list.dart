import 'package:flutter/material.dart';
import 'package:quick_ledger/features/ledger/model/home/transactions_model.dart';
import 'package:quick_ledger/features/ledger/screens/home/widget/transactions_tile.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';

class GRecentTransactionsList extends StatelessWidget {
  const GRecentTransactionsList({
    super.key,
    required this.transactions,
    this.onTransactionTap,
  });

  final List<TransactionModel> transactions;
  final void Function(TransactionModel transaction)? onTransactionTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: transactions.length,
      separatorBuilder: (_, __) => const SizedBox(height: GSizes.spaceBtwItems),
      itemBuilder: (context, index) {
        final transaction = transactions[index];
        return GTransactionTile(
          transaction: transaction,
          onTap: onTransactionTap == null
              ? null
              : () => onTransactionTap!(transaction),
        );
      },
    );
  }
}