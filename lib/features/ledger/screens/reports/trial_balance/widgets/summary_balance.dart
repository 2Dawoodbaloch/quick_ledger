import 'package:flutter/material.dart';
import 'package:quick_ledger/features/ledger/controllers/reports/trial_balance/trial_balance_controller.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';

class SummaryBalance extends StatelessWidget {
  const SummaryBalance({
    super.key,
    required this.controller,
  });

  final TrialBalanceController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(GSizes.md),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
    
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total Debit"),
              Text(controller.totalDebit.toStringAsFixed(2)),
            ],
          ),
    
          const SizedBox(height: 8),
    
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
              const Text("Total Credit"),
              Text(controller.totalCredit.toStringAsFixed(2)),
            ],
          ),
    
          const Divider(height: 24),
    
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [
    
              Text(
                controller.isBalanced
                    ? "Balanced"
                    : "Difference",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
    
              Text(
                controller.isBalanced
                    ? "✓"
                    : controller.difference.toStringAsFixed(2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}