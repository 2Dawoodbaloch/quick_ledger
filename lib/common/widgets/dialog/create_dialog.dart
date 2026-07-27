import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:quick_ledger/features/ledger/screens/accounts/new_accounts/new_accounts.dart';
import 'package:quick_ledger/features/ledger/screens/journals/new_journal_entry/new_journal_entry.dart';
import 'package:quick_ledger/routes/routes_name.dart';

class GCreateDialog extends StatelessWidget {
  const GCreateDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create'),

      contentPadding: const EdgeInsets.symmetric(vertical: 12),

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          ListTile(
            leading: const Icon(Icons.menu_book_outlined),
            title: const Text('New Journal Entry'),
            subtitle: const Text('Record a transaction'),
            onTap: () {
              Get.back();
              // Get.toNamed(RoutesName.newJournalEntry);
              Get.to(NewJournalEntryScreen());
           
            },
          ),

          const Divider(height: 1),

          ListTile(
            leading: const Icon(Iconsax.bank),
            title: const Text('New Account'),
            subtitle: const Text('Create a ledger account'),
            onTap: () {
              Get.back();

              // Get.toNamed(RoutesName.newAccounts);
              Get.to(NewAccountScreen());
       
            },
          ),
        ],
      ),
    );
  }
}