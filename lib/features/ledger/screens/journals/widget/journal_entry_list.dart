import 'package:flutter/material.dart';
import 'package:quick_ledger/features/ledger/controllers/model/new_journal_entry/journal_entries_model.dart';
import 'package:quick_ledger/utils/constants/sizes.dart';
import 'journal_entry_tile.dart';

/// Unlike GRecentTransactionsList on the dashboard, this one does NOT
/// need shrinkWrap/NeverScrollableScrollPhysics — it sits inside an
/// Expanded widget on JournalsScreen (bounded height, no outer
/// SingleChildScrollView), so it's free to scroll normally.
class GJournalEntryList extends StatelessWidget {
  const GJournalEntryList({
    super.key,
    required this.entries,
    this.onEntryTap,
  });

  final List<JournalEntryModel> entries;
  final void Function(JournalEntryModel entry)? onEntryTap;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: entries.length,
      separatorBuilder: (_, __) => const SizedBox(height: GSizes.spaceBtwItems),
      itemBuilder: (context, index) {
        final entry = entries[index];
        return GJournalEntryTile(
          entry: entry,
          onTap: onEntryTap == null ? null : () => onEntryTap!(entry),
        );
      },
    );
  }
}