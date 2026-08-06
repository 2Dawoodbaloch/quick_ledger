import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:quick_ledger/features/ledger/controllers/accounts/account_controller.dart';
import 'package:quick_ledger/features/ledger/controllers/journal/journal_controller.dart';
import 'package:quick_ledger/utils/constants/colors.dart';

class GeneralLedgerDetailScreen extends StatelessWidget {
  const GeneralLedgerDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String accountId = Get.arguments as String;

    final account = AccountController.instance.allAccounts.firstWhere(
      (a) => a.id == accountId,
    );

    final journals = JournalController.instance.allEntries.where((journal) {
      return journal.lines.any((line) => line.accountId == accountId);
    }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(account.name)),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            /// Account Summary
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context).cardTheme.color,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Text(
                    account.name,
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [Text("Code "), Text(account.code)],
                  ),

                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Balance :"),
                      Text(account.currentBalance.toString()),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Transactions : "),
                      Text(journals.length.toString()),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: journals.length,

                itemBuilder: (_, index) {
                  final journal = journals[index];

                  final line = journal.lines.firstWhere(
                    (l) => l.accountId == accountId,
                  );

                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    color: GColors.white,

                    child: ListTile(
                      title: Text(journal.reference),

                      subtitle: Text(journal.narration),

                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Text("Dr ${line.debit}"),

                          Text("Cr ${line.credit}"),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
