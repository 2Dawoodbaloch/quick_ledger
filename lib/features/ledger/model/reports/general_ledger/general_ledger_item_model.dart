class GeneralLedgerItemModel {
  final String accountId;
  final String accountName;
  final String accountCode;

  final double currentBalance;

  final int transactionCount;

  GeneralLedgerItemModel({
    required this.accountId,
    required this.accountName,
    required this.accountCode,
    required this.currentBalance,
    required this.transactionCount,
  });
}