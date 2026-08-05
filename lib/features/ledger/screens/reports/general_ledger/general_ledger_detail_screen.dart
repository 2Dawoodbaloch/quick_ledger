import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:quick_ledger/features/ledger/controllers/accounts/account_controller.dart';
import 'package:quick_ledger/features/ledger/controllers/journal/controller.dart';

class GeneralLedgerDetailScreen extends StatelessWidget {
  const GeneralLedgerDetailScreen({
    super.key,
  });

  
  @override
  Widget build(BuildContext context) {

      final String accountId = Get.arguments as String;

    final account = AccountController.instance.allAccounts
        .firstWhere((a) => a.id == accountId);

    final journals = JournalController.instance.allEntries.where((journal) {
      return journal.lines.any(
        (line) => line.accountId == accountId,
      );
    }).toList();


    return Scaffold(

      appBar: AppBar(
        title: Text(account.name),
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          children: [

            /// Account Summary

            Container(

              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Theme.of(context).cardColor,
              ),

              child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  Text(
                    account.name,
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),

                  const SizedBox(height: 8),

                  Text("Code : ${account.code}"),

                  Text("Balance : ${account.currentBalance}"),

                  Text("Transactions : ${journals.length}"),
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

                    child: ListTile(

                      title: Text(journal.reference),

                      subtitle: Text(journal.narration),

                      trailing: Column(

                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [

                          Text(
                            "Dr ${line.debit}",
                          ),

                          Text(
                            "Cr ${line.credit}",
                          ),
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