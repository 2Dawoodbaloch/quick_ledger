class TransactionModel {
  final String title;
  final double amount;
  final bool isIncome;
  final String date;

  TransactionModel({
    required this.title,
    required this.amount,
    required this.isIncome,
    required this.date,
  });
}