import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quick_ledger/features/ledger/model/accounts/account_model.dart';
import 'package:quick_ledger/features/ledger/model/new_journal_entry/journal_line_model.dart';
import 'package:quick_ledger/utils/constants/colors.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';
import 'package:quick_ledger/utils/helpers/helper_functions.dart';

class GJournalLineCard extends StatelessWidget {
  const GJournalLineCard({
    super.key,
    required this.line,
    required this.accountOptions,
    this.onRemove,
  });

  final JournalLineModel line;
  final List<AccountModel> accountOptions;
  final VoidCallback? onRemove;

  @override
  Widget build(BuildContext context) {
    final dark = GHelperFunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.all(GSizes.sm),
      decoration: BoxDecoration(
        color: Theme.of(context).cardTheme.color,
        borderRadius: BorderRadius.circular(GSizes.cardRadiusSm),
        border: Border.all(
          color: dark ? GColors.borderDark : GColors.lightGrey,
          width: 0.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Obx(
                  () => DropdownButtonHideUnderline(
                    child: DropdownButton<AccountModel>(
                      dropdownColor: GColors.white,
                      isExpanded: true,
                      hint: const Text('Select account'),
                      value: accountOptions.contains(line.account.value)
                          ? line.account.value
                          : null,
                      items: accountOptions.map((account) {
                        return DropdownMenuItem<AccountModel>(
                          value: account,
                          child: Text(account.name),
                        );
                      }).toList(),
                      onChanged: (account) {
                        line.account.value = account;

                        log(
                          "Selected ${account!.name} (${account.code})",
                          name: "DROPDOWN",
                        );
                      },
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
              ),
              if (onRemove != null)
                IconButton(
                  icon: const Icon(Icons.close, size: GSizes.iconSm),
                  color: GColors.expense,
                  onPressed: onRemove,
                ),
            ],
          ),
          const SizedBox(height: GSizes.xs),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      GTexts.debit,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 2),
                    TextFormField(
                      controller: line.debitController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: const InputDecoration(hintText: '0'),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: GSizes.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      GTexts.credit,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    const SizedBox(height: 2),
                    TextFormField(
                      controller: line.creditController,
                      keyboardType: const TextInputType.numberWithOptions(
                        decimal: true,
                      ),
                      decoration: const InputDecoration(hintText: '0'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
