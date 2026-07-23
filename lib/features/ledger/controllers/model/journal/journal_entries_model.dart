import 'package:quick_ledger/utils/constants/enum.dart';

class JournalEntryModel {
  final String reference; // e.g. "JE-1042"
  final String narration; // e.g. "Sales invoice — Acme Corp"
  final DateTime date;
  final JournalType journalType;
  final JournalStatus status;
  final double amount;

  JournalEntryModel({
    required this.reference,
    required this.narration,
    required this.date,
    required this.journalType,
    required this.status,
    required this.amount,
  });
}