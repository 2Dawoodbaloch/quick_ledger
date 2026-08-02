import 'package:quick_ledger/utils/constants/enum.dart';

class TrialBalanceItemModel {
  final String accountId;
  final String accountCode;
  final String accountName;
  final AccountType accountType;

  final double debit;
  final double credit;

  const TrialBalanceItemModel({
    required this.accountId,
    required this.accountCode,
    required this.accountName,
    required this.accountType,
    required this.debit,
    required this.credit,
  });
}