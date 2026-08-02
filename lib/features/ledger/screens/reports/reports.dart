import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_ledger/common/widgets/screens/empty_state.dart';
import 'package:quick_ledger/features/ledger/controllers/accounts/controller.dart';
import 'package:quick_ledger/features/ledger/controllers/reports/reports_controller.dart';
import 'package:quick_ledger/features/ledger/screens/accounts/new_accounts/new_accounts.dart';
import 'package:quick_ledger/features/ledger/screens/reports/widgets/report_card.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';

/// No Scaffold here — same reasoning as JournalsScreen. NavigationMenu
/// owns the single Scaffold/bottomNavigationBar/FAB for the whole
/// tab shell; this is just the body content for the Accounts tab.
class ReportsScreen extends StatelessWidget {
  ReportsScreen({super.key});

  final controller = Get.find<AccountController>();
  final reportController = Get.find<ReportsController>();

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
                        title: GTexts.noAccountsYet,
                        subtitle: GTexts.noAccountsSubtitle,
                        buttonLabel: '+ ${GTexts.newAccount}',
                        secondaryLabel: GTexts.useStarterTemplate,
                        onSecondaryTap: () {},
                        onButtonTap: () {
                          Get.to(() => NewAccountScreen());
                          // Get.toNamed(RoutesName.newAccounts);
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
