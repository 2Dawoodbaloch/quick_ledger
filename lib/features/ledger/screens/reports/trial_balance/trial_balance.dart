import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_ledger/features/ledger/controllers/reports/trial_balance/trial_balance_controller.dart';
import 'package:quick_ledger/features/ledger/screens/reports/trial_balance/widgets/summary_balance.dart';
import 'package:quick_ledger/features/ledger/screens/reports/trial_balance/widgets/trial_balance_card.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';

class TrialBalanceScreen extends StatelessWidget {
  const TrialBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TrialBalanceController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Trial Balance")),

      body: Padding(
        padding: const EdgeInsets.all(GSizes.defaultSpace),

        child: Column(
          children: [
            ///-------------------------
            /// Summary
            ///-------------------------
            SummaryBalance(controller: controller),

            const SizedBox(height: GSizes.spaceBtwSections),
            Expanded(
              child: ListView.separated(
                itemCount: controller.items.length,

                separatorBuilder: (_, __) =>
                    const SizedBox(height: GSizes.spaceBtwItems),

                itemBuilder: (_, index) {
                  return GTrialBalanceCard(item: controller.items[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
