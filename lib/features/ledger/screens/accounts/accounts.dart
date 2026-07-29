import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_ledger/common/widgets/screens/empty_state.dart';
import 'package:quick_ledger/features/ledger/controllers/accounts/controller.dart';
import 'package:quick_ledger/features/ledger/screens/accounts/widgets/account_title.dart';
import 'package:quick_ledger/routes/routes_name.dart';
import 'package:quick_ledger/utils/constants/enum.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';

/// No Scaffold here — same reasoning as JournalsScreen. NavigationMenu
/// owns the single Scaffold/bottomNavigationBar/FAB for the whole
/// tab shell; this is just the body content for the Accounts tab.
class AccountsScreen extends StatelessWidget {
  AccountsScreen({super.key});

  final controller = Get.find<AccountController>();


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
                  GTexts.accounts,
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
                        onSecondaryTap: () {
                              // Get.to(() => NewAccountScreen());
                         
                              //     Get.toNamed(RoutesName.newAccounts);
                        },
                        onButtonTap: () {
                          Get.toNamed(RoutesName.newAccounts);
          
                        },
                      ),
                    ),
                  );
                }

                return ListView(
                  padding: const EdgeInsets.only(
                    bottom: GSizes.centerFabSize + GSizes.md,
                  ),
                  children: controller.groupedAccounts.entries.expand((group) {
                    return [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: GSizes.xs,
                        ),
                        child: Text(
                          _sectionTitle(group.key),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ),
                      ...group.value.map(
                        (account) => Padding(
                          padding: const EdgeInsets.only(
                            bottom: GSizes.spaceBtwItems,
                          ),
                          child: GAccountTile(account: account, onTap: () {}),
                        ),
                      ),
                      const SizedBox(height: GSizes.xs),
                    ];
                  }).toList(),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  String _sectionTitle(AccountType type) {
    switch (type) {
      case AccountType.asset:
        return 'Assets';
      case AccountType.liability:
        return 'Liabilities';
      case AccountType.equity:
        return 'Equity';
      case AccountType.income:
        return 'Income';
      case AccountType.expense:
        return 'Expenses';
    }
  }
}
