import 'package:flutter/material.dart';
import 'package:quick_ledger/features/ledger/model/home/transactions_model.dart';
import 'package:quick_ledger/features/ledger/screens/home/widget/transactions_tile.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';

/// Renders the list of recent transactions using ListView.builder.
///
/// Important: this list lives inside the dashboard's outer
/// SingleChildScrollView, so it can't scroll on its own — a plain
/// ListView.builder here would throw an "unbounded height" layout
/// error. `shrinkWrap: true` makes it size itself to its content
/// instead of trying to fill all available height, and
/// `NeverScrollableScrollPhysics` disables its own scrolling so the
/// outer scroll view handles scrolling for the whole page.
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