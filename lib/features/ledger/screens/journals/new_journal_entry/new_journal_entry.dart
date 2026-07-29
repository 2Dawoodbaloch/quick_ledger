import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quick_ledger/common/widgets/text_field.dart/date_field.dart';
import 'package:quick_ledger/common/widgets/text_field.dart/form_field.dart';
import 'package:quick_ledger/features/ledger/controllers/new_journal_entry/controller.dart';
import 'package:quick_ledger/features/ledger/screens/journals/new_journal_entry/widgets/balance_banner.dart';
import 'package:quick_ledger/features/ledger/screens/journals/new_journal_entry/widgets/journal_line_card.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'package:quick_ledger/utils/constants/text_strings.dart';

class NewJournalEntryScreen extends StatelessWidget {
  NewJournalEntryScreen({super.key});

  final controller = Get.find<NewJournalEntryController>();
  final currencyFormat = NumberFormat.currency(symbol: '\$', decimalDigits: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(GTexts.newJournalEntry)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: GSizes.spaceBtwItems),

              // ---- Reference + Date, side by side ----
              Row(
                children: [
                  Expanded(
                    child: GFormField(
                      label: GTexts.reference,
                      initialValue: controller.reference,
                      readOnly: true,
                    ),
                  ),

                  SizedBox(width: GSizes.sm),

                  Expanded(
                    child: Obx(
                      () => GDateField(
                        label: GTexts.date,
                        value: controller.formattedDate,
                        onTap: () => controller.pickDate(context),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: GSizes.spaceBtwItems),

            
              // ---- Narration ----
              GFormField(
                label: GTexts.narration,
                controller: controller.narrationController,
                hintText: "What is this entry for?",
              ),
              const SizedBox(height: GSizes.xs),

              const SizedBox(height: GSizes.spaceBtwSections),
              // ---- Lines header ----
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    GTexts.lines,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  TextButton.icon(
                    onPressed: controller.addLine,
                    icon: const Icon(Icons.add, size: GSizes.iconXs),
                    label: const Text(GTexts.addLine),
                  ),
                ],
              ),
              const SizedBox(height: GSizes.spaceBtwItems),

              // ---- Line cards ----
              Obx(
                () => ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.lines.length,
                  separatorBuilder: (_, __) =>
                      const SizedBox(height: GSizes.spaceBtwItems),
                  itemBuilder: (context, index) {
                    return GJournalLineCard(
                      line: controller.lines[index],
                      accountOptions: controller.accountOptions,
                      // Only allow removing a line if more than 2
                      // remain — an entry always needs at least two.
                      onRemove: controller.lines.length > 2
                          ? () => controller.removeLine(index)
                          : null,
                    );
                  },
                ),
              ),
              const SizedBox(height: GSizes.spaceBtwItems),

              // ---- Balance banner ----
              Obx(
                () => GBalanceBanner(
                  isBalanced: controller.isBalanced,
                  totalDebit: currencyFormat.format(
                    controller.totalDebit.value,
                  ),
                  totalCredit: currencyFormat.format(
                    controller.totalCredit.value,
                  ),
                  difference: controller.isBalanced
                      ? null
                      : currencyFormat.format(controller.difference),
                ),
              ),
              const SizedBox(height: GSizes.spaceBtwSections),

              // ---- Action buttons ----
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: controller.saveAsDraft,
                      child: const Text(GTexts.saveAsDraft),
                    ),
                  ),
                  const SizedBox(width: GSizes.sm),
                  Expanded(
                    child: Obx(
                      () => ElevatedButton(
                        onPressed: controller.canPost
                            ? controller.postEntry
                            : null,
                        child: const Text(GTexts.postEntry),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
