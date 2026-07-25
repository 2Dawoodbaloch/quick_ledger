import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:intl/intl.dart';
import 'package:quick_ledger/common/widgets/screens/empty_state.dart';
import 'package:quick_ledger/features/ledger/controllers/home/controller.dart';
import 'package:quick_ledger/features/ledger/screens/home/widget/balance_card.dart';
import 'package:quick_ledger/features/ledger/screens/home/widget/home_header.dart';
import 'package:quick_ledger/features/ledger/screens/home/widget/recent_transactions_list.dart';
import 'package:quick_ledger/features/ledger/screens/home/widget/summary_row.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({super.key});

  final controller = Get.put(HomeController());
  final currencyFormat = NumberFormat.currency(symbol: '\$', decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(GSizes.screenPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
               Obx(
                () => GHomeHeader(
                  greeting: controller.greeting,
                  userName: controller.userName.value,
                  subtitle: GTexts.ledgerOverview,
                  onAvatarTap: () {
                   
                  },
                ),
              ),
              const SizedBox(height: GSizes.spaceBtwSections),
              Obx(
                () => GBalanceCard(
                  label: GTexts.currentBalance,
                  amount: currencyFormat.format(controller.currentBalance.value),
                ),
              ),
 
              const SizedBox(height: GSizes.spaceBtwSections),
              Obx(
                () => GSummaryRow(
                  income: currencyFormat.format(controller.income.value),
                  expense: currencyFormat.format(controller.expense.value),
                  profit: currencyFormat.format(controller.profit.value),
                ),
              ),
 
              // Next up: quick actions grid
              const SizedBox(height: GSizes.spaceBtwSections),
              Text(
                GTexts.recentTransactions,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: GSizes.spaceBtwItems),
              Obx(() {
                // This is the whole pattern: check the data, render one
                // of two states. No separate screen, no navigation —
                // just a condition inside the same widget tree.
                if (controller.recentTransactions.isEmpty) {
                  return GEmptyState(
                    icon: Icons.menu_book_outlined,
                    title: GTexts.noTransactionsYet,
                    subtitle: GTexts.noTransactionsSubtitle,
                    buttonLabel: '+ ${GTexts.newJournalEntry}',
                    onButtonTap: () {
                     
                    },
                  );
                }
                return GRecentTransactionsList(
                  transactions: controller.recentTransactions,
                  onTransactionTap: (transaction) {
                 
                  },
                );
              }),
            
            ],
          ),
        ),
      ),
    );
  }
}
