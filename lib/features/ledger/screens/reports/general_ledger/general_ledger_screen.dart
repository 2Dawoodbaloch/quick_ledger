import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_ledger/features/ledger/controllers/reports/general_ledger/general_ledger_controller.dart';
import 'package:quick_ledger/features/ledger/screens/reports/general_ledger/widget/general_ledger_card.dart';
import 'package:quick_ledger/routes/routes_name.dart';

class GeneralLedgerScreen extends StatelessWidget {
  const GeneralLedgerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(GeneralLedgerController());

    return Scaffold(
      appBar: AppBar(title: const Text('General Ledger')),

      body: Obx(() {
        if (controller.ledgerAccounts.isEmpty) {
          return const Center(child: Text('No accounts found'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.ledgerAccounts.length,
          itemBuilder: (_, index) {
            final item = controller.ledgerAccounts[index];
            return GGeneralLedgerCard(
              item: item,
              onTap: () {
                Get.toNamed(
                  RoutesName.generalLedgerDetailScreen,
                  arguments: item.accountId,
                );
              },
            );
          },
        );
      }),
    );
  }
}
