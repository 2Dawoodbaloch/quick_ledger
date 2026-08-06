// import 'package:quick_ledger/utils/constants/enum.dart';
// class JournalLineSnapshot {
//   final String accountId;
//   final String accountName;
//   final AccountType accountType;
//   final double debit;
//   final double credit;
//   final String accountCode;

//   JournalLineSnapshot({
//     required this.accountId,
//     required this.accountCode,
//     required this.accountName,
//     required this.accountType,
//     required this.debit,
//     required this.credit,
//   });
// }

import 'package:quick_ledger/utils/constants/enum.dart';

class JournalLineSnapshot {
  final String accountId;
  final String accountCode;
  final String accountName;
  final AccountType accountType;
  final double debit;
  final double credit;

  const JournalLineSnapshot({
    required this.accountId,
    required this.accountCode,
    required this.accountName,
    required this.accountType,
    required this.debit,
    required this.credit,
  });

  Map<String, dynamic> toJson() {
    return {
      "account_id": accountId,
      "account_code": accountCode,
      "account_name": accountName,
      "account_type": accountType.name,
      "debit": debit,
      "credit": credit,
    };
  }

  factory JournalLineSnapshot.fromJson(Map<String, dynamic> json) {
    return JournalLineSnapshot(
      accountId: json["account_id"] ?? "",
      accountCode: json["account_code"] ?? "",
      accountName: json["account_name"] ?? "",
      accountType: AccountType.values.firstWhere(
        (e) => e.name == json["account_type"],
      ),
      debit: (json["debit"] as num?)?.toDouble() ?? 0,
      credit: (json["credit"] as num?)?.toDouble() ?? 0,
    );
  }
}