import 'package:flutter/material.dart';
import 'package:quick_ledger/features/ledger/model/new_journal_entry/journal_entries_model.dart';
import 'package:quick_ledger/features/ledger/screens/journals/new_journal_entry/widgets/status_pill.dart';
import 'package:quick_ledger/utils/constants/enum.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';

/// One row on the Journals list. Uses a custom Column layout instead
/// of ListTile — the mockup has three distinct rows (reference+status,
/// narration, date/type+amount) that don't map cleanly onto
/// ListTile's single leading/title/subtitle/trailing slots.
class GJournalEntryTile extends StatelessWidget {
  const GJournalEntryTile({super.key, required this.entry, this.onTap});

  final JournalEntryModel entry;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
  
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(GSizes.cardRadiusSm),
        child: Padding(
          padding: const EdgeInsets.all(GSizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    entry.reference,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                 
                  GStatusPill(status: entry.status),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                entry.narration,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: GSizes.xs),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${_formatDate(entry.date)} · ${entry.journalType.label}',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  Text(
                    '\$${entry.amount.toStringAsFixed(0)}',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day}, ${date.year}';
  }
}
