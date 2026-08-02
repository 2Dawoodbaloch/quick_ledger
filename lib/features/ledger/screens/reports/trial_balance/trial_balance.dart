import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_ledger/features/ledger/controllers/reports/trial_balance/trial_balance_controller.dart';
import 'package:quick_ledger/features/ledger/screens/reports/trial_balance/widgets/trial_balance_card.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';

class TrialBalanceScreen extends StatelessWidget {
  const TrialBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TrialBalanceController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Trial Balance"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(GSizes.defaultSpace),

        child: Column(
          children: [

            ///-------------------------
            /// Summary
            ///-------------------------
            Container(
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
            ),

            const SizedBox(height: GSizes.spaceBtwSections),

            Expanded(
              child: ListView.separated(
                itemCount: controller.items.length,

                separatorBuilder: (_, __) =>
                    const SizedBox(height: GSizes.spaceBtwItems),

                itemBuilder: (_, index) {

                  return GTrialBalanceCard(
                    item: controller.items[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}