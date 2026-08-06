import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_ledger/common/widgets/screens/empty_state.dart';
import 'package:quick_ledger/features/ledger/controllers/accounts/account_controller.dart';
import 'package:quick_ledger/features/ledger/controllers/reports/reports_controller.dart';
import 'package:quick_ledger/features/ledger/screens/accounts/new_accounts/new_accounts.dart';
import 'package:quick_ledger/features/ledger/screens/reports/widgets/report_card.dart';
import 'package:quick_ledger/routes/routes_name.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';


class ReportsScreen extends StatelessWidget {
  ReportsScreen({super.key});

  final controller = AccountController.instance;
  final reportController = ReportsController.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(GSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  GTexts.reports,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const Icon(Icons.search),
              ],
            ),
            const SizedBox(height: GSizes.spaceBtwSections),
            Expanded(
              child: Obx(() {
                if (controller.allAccounts.isEmpty) {
                  return Center(
                    child: Padding(
                      // Same FAB clearance reasoning as Journals' empty state.
                      padding: const EdgeInsets.only(
                        bottom: GSizes.centerFabSize + GSizes.md,
                      ),
                      child: GEmptyState(
                        icon: Icons.account_balance_outlined,
                        title: GTexts.nothingToReportYet,
                        subtitle: GTexts.nothingToReportSubtitle,
                        buttonLabel: '+ ${GTexts.newAccount}',
                        secondaryLabel: GTexts.useStarterTemplate,
                        onSecondaryTap: () {},
                        onButtonTap: () {
                        
                          Get.toNamed(RoutesName.newAccounts);
                        },
                      ),
                    ),
                  );
                }

                return ListView.separated(
                  padding: const EdgeInsets.only(
                    bottom: GSizes.centerFabSize + GSizes.lg,
                  ),
                  itemCount: reportController.reports.length,
                  itemBuilder: (_, index) {
                    return GReportCard(report: reportController.reports[index]);
                  },
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: GSizes.spaceBtwItems),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
