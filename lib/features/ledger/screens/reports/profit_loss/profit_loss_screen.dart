import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_ledger/features/ledger/controllers/reports/profit_loss/profit_loss_controller.dart';

class ProfitLossScreen extends StatelessWidget {
  ProfitLossScreen({super.key});

  final controller = Get.find<ProfitLossController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profit & Loss"),
      ),

      body: Obx(() {
        final income = controller.incomeAccounts;
        final expense = controller.expenseAccounts;

        return ListView(
          padding: const EdgeInsets.all(16),

          children: [

            /// -----------------------------
            /// Income
            /// -----------------------------
            Text(
              "Income",
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 12),

            ...income.map(
              (item) => ListTile(
                title: Text(item.accountName),
                trailing: Text(item.amount.toStringAsFixed(2)),
              ),
            ),

            const Divider(),

            ListTile(
              title: const Text(
                "Total Income",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                controller.totalIncome.toStringAsFixed(2),
              ),
            ),

            const SizedBox(height: 24),

            /// -----------------------------
            /// Expense
            /// -----------------------------
            Text(
              "Expenses",
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 12),

            ...expense.map(
              (item) => ListTile(
                title: Text(item.accountName),
                trailing: Text(item.amount.toStringAsFixed(2)),
              ),
            ),

            const Divider(),

            ListTile(
              title: const Text(
                "Total Expenses",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                controller.totalExpense.toStringAsFixed(2),
              ),
            ),

            const SizedBox(height: 30),

            Card(
              child: ListTile(
                title: Text(
                  controller.isProfit
                      ? "Net Profit"
                      : "Net Loss",
                ),
                trailing: Text(
                  controller.netProfit
                      .abs()
                      .toStringAsFixed(2),
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge,
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}