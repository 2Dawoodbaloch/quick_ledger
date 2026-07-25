import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_ledger/common/widgets/screens/empty_state.dart';
import 'package:quick_ledger/features/ledger/screens/accounts/new_accounts/new_accounts.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(GSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              GTexts.accounts,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: GSizes.spaceBtwItems),
            // Main content — empty state or the real list. This is
            // the exact same isEmpty-check pattern from Home.
            Expanded(
              child: Center(
                child: GEmptyState(
                  icon: Icons.menu_book_outlined,
                  title: GTexts.noAccountsYet,
                  subtitle: GTexts.noAccountsSubtitle,
                  buttonLabel: '+ ${GTexts.newAccount}',
                  onButtonTap: () {
                    Get.to( NewAccountScreen());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
