import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_ledger/features/ledger/controllers/reports/balance_sheet/balance_sheet_controller.dart';

class BalanceSheetScreen extends StatelessWidget {
  BalanceSheetScreen({super.key});

  final controller = Get.find<BalanceSheetController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Balance Sheet"),
      ),

      body: Obx(() {
        final assets = controller.assets;
        final liabilities = controller.liabilities;
        final equity = controller.equity;

        return ListView(
          padding: const EdgeInsets.all(16),

          children: [

            ///===========================
            /// Assets
            ///===========================

            Text(
              "Assets",
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 10),

            ...assets.map(
              (item) => ListTile(
                title: Text(item.accountName),
                trailing: Text(
                  item.balance.toStringAsFixed(2),
                ),
              ),
            ),

            const Divider(),

            ListTile(
              title: const Text(
                "Total Assets",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                controller.totalAssets.toStringAsFixed(2),
              ),
            ),

            const SizedBox(height: 20),

            ///===========================
            /// Liabilities
            ///===========================

            Text(
              "Liabilities",
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 10),

            ...liabilities.map(
              (item) => ListTile(
                title: Text(item.accountName),
                trailing: Text(
                  item.balance.toStringAsFixed(2),
                ),
              ),
            ),

            const Divider(),

            ListTile(
              title: const Text(
                "Total Liabilities",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                controller.totalLiabilities.toStringAsFixed(2),
              ),
            ),

            const SizedBox(height: 20),

            ///===========================
            /// Equity
            ///===========================

            Text(
              "Equity",
              style: Theme.of(context).textTheme.titleLarge,
            ),

            const SizedBox(height: 10),

            ...equity.map(
              (item) => ListTile(
                title: Text(item.accountName),
                trailing: Text(
                  item.balance.toStringAsFixed(2),
                ),
              ),
            ),

            ListTile(
              title: const Text("Current Profit"),
              trailing: Text(
                controller.currentProfit.toStringAsFixed(2),
              ),
            ),

            const Divider(),

            ListTile(
              title: const Text(
                "Total Equity",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                controller.totalEquity.toStringAsFixed(2),
              ),
            ),

            const SizedBox(height: 30),

            Card(
              child: ListTile(
                leading: Icon(
                  controller.isBalanced
                      ? Icons.check_circle
                      : Icons.error,
                ),
                title: Text(
                  controller.isBalanced
                      ? "Assets = Liabilities + Equity"
                      : "Balance Sheet is not balanced",
                ),
                trailing: Text(
                  controller.totalAssets.toStringAsFixed(2),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}