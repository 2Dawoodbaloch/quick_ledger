import 'package:flutter/material.dart';

class GBalanceRow extends StatelessWidget {
  const GBalanceRow({
    super.key,
    required this.accountName,
    required this.amount,
  });

  final String accountName;
  final String amount;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(
              accountName,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),

          Text(
            amount,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}