import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quick_ledger/features/ledger/model/journal/journal_entries_model.dart';
import 'package:quick_ledger/features/ledger/screens/journals/new_journal_entry/widgets/status_pill.dart';
import 'package:quick_ledger/utils/constants/colors.dart';
import 'package:quick_ledger/utils/constants/enum.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';

/// Read-only view of one posted/draft journal entry — this is what
/// opens when you tap a row on the Journals list. No GetX
/// controller/binding needed here since it has no complex form
/// state, just displays the entry it's given and (for posted
/// entries) offers a Reverse action.
class JournalEntryDetailScreen extends StatelessWidget {
  const JournalEntryDetailScreen({super.key, required this.entry});

  final JournalEntryModel entry;

  static void open(JournalEntryModel entry) {
    Get.to(() => JournalEntryDetailScreen(entry: entry));
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(symbol: '\$', decimalDigits: 0);
    final dateFormat = DateFormat('MMM d, yyyy');

    return Scaffold(
      appBar: AppBar(title: Text(entry.reference)),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(GSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GStatusPill(status: entry.status),
                  Text(
                    '${entry.journalType.label} journal',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              const SizedBox(height: GSizes.spaceBtwItems),

              // ---- Narration + Date + Reference summary card ----
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(GSizes.md),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Narration', style: Theme.of(context).textTheme.labelMedium),
                      Text(entry.narration, style: Theme.of(context).textTheme.bodyLarge),
                      const SizedBox(height: GSizes.spaceBtwItems),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Date', style: Theme.of(context).textTheme.labelMedium),
                              Text(dateFormat.format(entry.date), style: Theme.of(context).textTheme.bodyMedium),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Total', style: Theme.of(context).textTheme.labelMedium),
                              Text(
                                currencyFormat.format(entry.amount),
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: GSizes.spaceBtwSections),

              // ---- Lines — this is the part you asked for: which
              // account was debited, which was credited ----
              Text('Lines', style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: GSizes.spaceBtwItems),
              if (entry.lines.isEmpty)
                // Either this entry was posted before line-capturing
                // was added, or every line's account was left
                // unselected at posting time — see the two causes
                // explained where this fallback was introduced.
                Container(
                  padding: const EdgeInsets.all(GSizes.md),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardTheme.color,
                    borderRadius: BorderRadius.circular(GSizes.cardRadiusSm),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, size: GSizes.iconSm, color: Theme.of(context).textTheme.bodySmall?.color),
                      const SizedBox(width: GSizes.xs),
                      Expanded(
                        child: Text(
                          'No line details available for this entry.',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                    ],
                  ),
                )
              else
                ...entry.lines.map((line) {
                final isDebit = line.debit > 0;
                final amount = isDebit ? line.debit : line.credit;

                return Container(
                  margin: const EdgeInsets.only(bottom: GSizes.spaceBtwItems),
                  padding: const EdgeInsets.symmetric(horizontal: GSizes.md, vertical: GSizes.sm),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardTheme.color,
                    borderRadius: BorderRadius.circular(GSizes.cardRadiusSm),
                    border: Border.all(color: Theme.of(context).dividerColor, width: 0.5),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Text(line.accountCode, style: Theme.of(context).textTheme.bodyLarge),
                      Text(line.accountType.label),
                      Text(line.accountName, style: Theme.of(context).textTheme.bodyLarge),
                      
                      Text(
                        '${isDebit ? 'Dr' : 'Cr'} ${currencyFormat.format(amount)}',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          // Dr in green, Cr in red — purely a visual
                          // distinction to scan quickly, not a
                          // statement about income vs expense.
                          color: isDebit ? GColors.income : GColors.expense,
                        ),
                      ),
                    ],
                  ),
                );
              }),

              const SizedBox(height: GSizes.spaceBtwSections),

              // ---- Reverse action — only for posted entries. Never
              // edit/delete a posted entry directly; a reversal
              // creates a new offsetting entry instead, preserving
              // the audit trail. ----
              if (entry.status.name == 'posted')
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () => _reverseEntry(context),
                    icon: const Icon(Icons.undo, size: GSizes.iconSm),
                    label: const Text('Reverse entry'),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  void _reverseEntry(BuildContext context) {
    // TODO: build the actual reversing entry (same lines, debit/credit
    // swapped) and post it via JournalController.instance.addEntry(...).
    // Left as a follow-up since it needs its own confirmation dialog
    // (per GDialogTheme) before firing.
  }
}