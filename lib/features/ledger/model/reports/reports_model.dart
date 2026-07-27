import 'package:quick_ledger/utils/constants/enum.dart';


class AccountModel {
  final String name;
  final String code;
  final AccountType type;
  final double balance;
  final String? description;

  AccountModel({
    required this.name,
    required this.code,
    required this.type,
    required this.balance,
    this.description,
  });
}