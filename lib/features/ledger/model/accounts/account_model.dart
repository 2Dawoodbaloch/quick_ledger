import 'package:quick_ledger/utils/constants/enum.dart';

class AccountModel {
  final String id;
  final String name;
  final String code;
  final AccountType type;
  final AccountCategory category;
  double balance;
  final String? description;

  AccountModel({
    required this.id,
    required this.name,
    required this.code,
    required this.type,
    required this.category,
    required this.balance,
    this.description,
  });
}
