import 'package:quick_ledger/utils/constants/enum.dart';
import 'journal_line_snapshot.dart';

class JournalEntryModel {
  final String reference; // e.g. "JE-1042"
  final String narration; // e.g. "Sales invoice — Acme Corp"
  final DateTime date;
  final JournalType journalType;
  final JournalStatus status;
  final double amount;

  // Frozen at posting time — this is what makes Reports possible.
  // Without knowing which accounts (and account TYPES) each line
  // touched, Profit & Loss / Trial Balance can't be computed for real.
  final List<JournalLineSnapshot> lines;

  JournalEntryModel({
    required this.reference,
    required this.narration,
    required this.date,
    required this.journalType,
    required this.status,
    required this.amount,
    this.lines = const [],
  });
}