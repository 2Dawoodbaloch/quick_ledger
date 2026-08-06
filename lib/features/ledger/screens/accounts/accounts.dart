import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_ledger/common/widgets/screens/empty_state.dart';
import 'package:quick_ledger/features/ledger/controllers/accounts/account_controller.dart';
import 'package:quick_ledger/features/ledger/model/accounts/account_model.dart';
import 'package:quick_ledger/features/ledger/screens/accounts/widgets/account_title.dart';
import 'package:quick_ledger/routes/routes_name.dart';
import 'package:quick_ledger/utils/constants/colors.dart';
import 'package:quick_ledger/utils/constants/enum.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';


class AccountsScreen extends StatelessWidget {
  AccountsScreen({super.key});

  final controller = AccountController.instance;

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
                          child: GAccountTile(
                            account: account,
                            onTap: () {},
                            onLongPress: () {
                              _showAccountOptions(context, account);
                            },
                          ),
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

void _showAccountOptions(BuildContext context, AccountModel account) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (_) {
      return SafeArea(
        child: Wrap(
          children: [
            ListTile(
              leading: const Icon(Icons.edit_outlined),
              title: const Text("Edit Account"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.delete_outline, color: Colors.red),
              title: const Text(
                "Delete Account",
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {
                Navigator.pop(context);
                _showDeleteDialog(context, account);
              },
            ),
          ],
        ),
      );
    },
  );
}

void _showDeleteDialog(BuildContext context, AccountModel account) {
  Get.defaultDialog(
    backgroundColor: GColors.white,
    title: "Delete Account",middleTextStyle: TextStyle(color: GColors.expense),
    middleText: "Are you sure you want to delete '${account.name}'?",titleStyle: Theme.of(context).textTheme.bodyMedium,
    textCancel: "Cancel",
    textConfirm: "Delete",
    confirmTextColor: Colors.white,
    onConfirm: () async {
      Get.back();

      await AccountController.instance.deleteAccount(account.id);
    },
  );
}
