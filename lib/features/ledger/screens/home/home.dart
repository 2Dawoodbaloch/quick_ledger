import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:quick_ledger/common/widgets/screens/empty_state.dart';
import 'package:quick_ledger/features/ledger/controllers/accounts/controller.dart';
import 'package:quick_ledger/features/ledger/controllers/home/controller.dart';
import 'package:quick_ledger/features/ledger/screens/home/widget/account_balance_title.dart';
import 'package:quick_ledger/features/ledger/screens/home/widget/balance_card.dart';
import 'package:quick_ledger/features/ledger/screens/home/widget/home_header.dart';
import 'package:quick_ledger/features/ledger/screens/home/widget/recent_transactions_list.dart';
import 'package:quick_ledger/features/ledger/screens/home/widget/summary_row.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final controller = Get.find<HomeController>();
  final accountController = AccountController.instance;
  final currency = NumberFormat.currency(symbol: 'RS', decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    log("------ DASHBOARD ------");

    for (final account in accountController.allAccounts) {
      log(
        "${account.name} | "
        "${account.category} | "
        "${account.balance}",
      );
    }

    log("Total Cash: ${accountController.totalCash}");
    log("Total Bank: ${accountController.totalBank}");
    log("Available: ${accountController.availableBalance}");
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(GSizes.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              Obx(
                () => GHomeHeader(
                  greeting: controller.greeting,
                  userName: controller.userName.value,
                  subtitle: GTexts.ledgerOverview,
                  onAvatarTap: () {},
                ),
              ),

              const SizedBox(height: GSizes.spaceBtwSections),

              /// Net Assets Card
              Obx(
                () => GBalanceCard(
                  availableBalance: controller.availableBalance.toString(),
                  cashTotal: controller.cashTotal.toString(),
                  bankTotal: controller.bankTotal.toString(),
                  reievable: controller.cashRecievable.toString(),
                ),
              ),
              const SizedBox(height: GSizes.spaceBtwSections),

              Obx(() {
                final cashAccounts = accountController.cashAccounts;
                 

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Cash Accounts",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    const SizedBox(height: GSizes.spaceBtwItems),

                    if (cashAccounts.isEmpty)
                      const GAccountBalanceTile(
                        name: "No cash account",
                        amount: "RS0",
                      ),

                    ...cashAccounts.map(
                      (account) => GAccountBalanceTile(
                        name: account.name,
                        amount: "RS${account.balance.toStringAsFixed(0)}",
                      ),
                    ),
                  ],
                );
              }),

              const SizedBox(height: GSizes.spaceBtwSections),

              Obx(() {
                final bankAccounts = accountController.bankAccounts;
                
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bank Accounts",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),

                    const SizedBox(height: GSizes.spaceBtwItems),

                    if (bankAccounts.isEmpty)
                      const GAccountBalanceTile(
                        name: "No bank account",
                        amount: "RS0",
                      ),

                    ...bankAccounts.map(
                      (account) => GAccountBalanceTile(
                        name: account.name,
                        amount: "RS${account.balance.toStringAsFixed(0)}",
                      ),
                    ),
                  ],
                );
              }),

              // Text(
              //   "Bank Accounts",
              //   style: Theme.of(context).textTheme.titleMedium,
              // ),

              // const SizedBox(height: GSizes.spaceBtwItems),

              // GAccountBalanceTile(name: "Meezan Bank", amount: "\$12,000"),

              // GAccountBalanceTile(name: "HBL Current", amount: "\$5,620"),
              const SizedBox(height: GSizes.spaceBtwSections),

              /// Income Expense Profit
              Obx(
                () => GSummaryRow(
                  income: currency.format(controller.income.value),
                  expense: currency.format(controller.expense.value),
                  profit: currency.format(controller.profit.value),
                ),
              ),

              const SizedBox(height: GSizes.spaceBtwSections),

              Text(
                GTexts.recentTransactions,
                style: Theme.of(context).textTheme.titleMedium,
              ),

              const SizedBox(height: GSizes.spaceBtwItems),

              Obx(() {
                if (controller.recentTransactions.isEmpty) {
                  return GEmptyState(
                    icon: Icons.menu_book_outlined,
                    title: GTexts.noTransactionsYet,
                    subtitle: GTexts.noTransactionsSubtitle,
                    buttonLabel: '+ ${GTexts.newJournalEntry}',
                    onButtonTap: () {},
                  );
                }

                return GRecentTransactionsList(
                  transactions: controller.recentTransactions,
                  onTransactionTap: (transaction) {},
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
