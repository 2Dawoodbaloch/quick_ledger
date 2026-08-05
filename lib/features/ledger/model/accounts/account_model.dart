// import 'package:quick_ledger/utils/constants/enum.dart';

// class AccountModel {
//   final String id;
//   final String name;
//   final String code;
//   final AccountType type;
//   final AccountCategory category;
//   final String? description;
//   double currentBalance;
//   final double openingBalance;

//   AccountModel({
//     required this.openingBalance,
//     required this.id,
//     required this.name,
//     required this.code,
//     required this.type,
//     required this.category,
//     this.description,
//   }) : currentBalance = openingBalance;
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quick_ledger/utils/constants/enum.dart';

class AccountModel {
  final String id;
  final String name;
  final String code;
  final AccountType type;
  final AccountCategory category;
  final String? description;

  final double openingBalance;
  double currentBalance;

  AccountModel({
    required this.id,
    required this.name,
    required this.code,
    required this.type,
    required this.category,
    required this.openingBalance,
    required this.currentBalance,
    this.description,
  });

  //=========================================================
  // Empty Model
  //=========================================================

  factory AccountModel.empty() {
    return AccountModel(
      id: '',
      name: '',
      code: '',
      type: AccountType.asset,
      category: AccountCategory.cash,
      openingBalance: 0,
      currentBalance: 0,
      description: '',
    );
  }

  //=========================================================
  // To Firestore
  //=========================================================

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'type': type.name,
      'category': category.name,
      'openingBalance': openingBalance,
      'currentBalance': currentBalance,
      'description': description,
    };
  }

  //=========================================================
  // From Firestore
  //=========================================================

  factory AccountModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    if (data == null) {
      return AccountModel.empty();
    }

    return AccountModel(
      id: document.id,

      name: data['name'] ?? '',

      code: data['code'] ?? '',

      type: AccountType.values.firstWhere(
        (e) => e.name == data['type'],
        orElse: () => AccountType.asset,
      ),

      category: AccountCategory.values.firstWhere(
        (e) => e.name == data['category'],
        orElse: () => AccountCategory.cash,
      ),

      openingBalance:
          (data['openingBalance'] ?? 0).toDouble(),

      currentBalance:
          (data['currentBalance'] ?? 0).toDouble(),

      description: data['description'],
    );
  }
}

