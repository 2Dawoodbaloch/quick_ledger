import 'package:quick_ledger/utils/constants/enum.dart';

class AccountModel {
  final String id;
  final String name;
  final String code;
  final AccountType type;
  final AccountCategory category;
  final String? description;
  double currentBalance;
  final double openingBalance;

  AccountModel({
    required this.openingBalance,
    required this.id,
    required this.name,
    required this.code,
    required this.type,
    required this.category,
    this.description,
  }) : currentBalance = openingBalance;
}

