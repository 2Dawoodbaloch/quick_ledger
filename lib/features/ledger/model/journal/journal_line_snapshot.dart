import 'package:quick_ledger/utils/constants/enum.dart';

/// A frozen record of one line from a journal entry, taken at the
/// moment it's posted. This is what Reports actually needs — without
/// knowing WHICH account type each line touched (Income? Expense?
/// Asset?), Profit & Loss and Trial Balance can't be computed
/// correctly, only guessed at.
class JournalLineSnapshot {
  final String accountName;
  final AccountType accountType;
  final double debit;
  final double credit;
  final String accountCode;

  JournalLineSnapshot({
    required this.accountCode,
    required this.accountName,
    required this.accountType,
    required this.debit,
    required this.credit,
  });
}