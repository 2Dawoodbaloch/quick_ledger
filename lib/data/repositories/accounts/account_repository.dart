import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:quick_ledger/data/repositories/authentication_repository.dart';
import 'package:quick_ledger/features/ledger/model/accounts/account_model.dart';
import 'package:quick_ledger/utils/constants/keys/keys.dart';
import 'package:quick_ledger/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:quick_ledger/utils/exceptions/firebase_exceptions.dart';
import 'package:quick_ledger/utils/exceptions/format_exceptions.dart';
import 'package:quick_ledger/utils/exceptions/platform_exceptions.dart';

class AccountRepository {
  static AccountRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// ADD ACCOUNT
  Future<void> addAccount(AccountModel account) async {
    try {
      final uid = AuthenticationRepository.instance.currentUser!.uid;

      log("========== ADD ACCOUNT ==========");
      log("User ID        : $uid");
      log("Account Name   : ${account.name}");
      log("Account Code   : ${account.code}");
      log("Uploading account to Firestore...");

      await _db
          .collection(GKeys.userCollection)
          .doc(uid)
          .collection(GKeys.accountCollection)
          .doc(account.id)
          .set(account.toJson());

      log("Account uploaded successfully.");
      log("=================================");
    } on FirebaseAuthException catch (e) {
      throw GFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on FormatException {
      throw GFormatException();
    } on PlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again.";
    }
  }

  Stream<List<AccountModel>> streamAccounts() {
    final uid = AuthenticationRepository.instance.currentUser!.uid;

    return _db
        .collection(GKeys.userCollection)
        .doc(uid)
        .collection(GKeys.accountCollection)
        .snapshots()
        .map((snapshot) {
          return snapshot.docs
              .map((doc) => AccountModel.fromSnapshot(doc))
              .toList();
        });

        
  }

  Future<void> deleteAccount(String accountId) async {
  try {
    log("========== DELETE ACCOUNT ==========", name: "ACCOUNT");

    log("Deleting Account ID : $accountId", name: "ACCOUNT");

    await _db
        .collection(GKeys.userCollection)
        .doc(AuthenticationRepository.instance.currentUser!.uid)
        .collection(GKeys.accountCollection)
        .doc(accountId)
        .delete();

    log("Account Deleted Successfully", name: "ACCOUNT");
  } on FirebaseAuthException catch (e) {
    throw GFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw GFirebaseException(e.code).message;
  } on FormatException {
    throw GFormatException();
  } on PlatformException catch (e) {
    throw GPlatformException(e.code).message;
  } catch (e) {
    log("Delete Failed : $e", name: "ACCOUNT");
    throw "Something went wrong.";
  }
}

Future<void> updateAccount(AccountModel account) async {
  try {
    log("==============================", name: "ACCOUNT");
    log("Updating Account", name: "ACCOUNT");
    log("ID : ${account.id}", name: "ACCOUNT");
    log("Balance : ${account.currentBalance}", name: "ACCOUNT");

    await _db
        .collection(GKeys.userCollection)
        .doc(AuthenticationRepository.instance.currentUser!.uid)
        .collection(GKeys.accountCollection)
        .doc(account.id)
        .update({
          "currentBalance": account.currentBalance,
        });

    log("Account Updated Successfully", name: "ACCOUNT");
  } on FirebaseAuthException catch (e) {
    throw GFirebaseAuthException(e.code).message;
  } on FirebaseException catch (e) {
    throw GFirebaseException(e.code).message;
  } on FormatException {
    throw GFormatException();
  } on PlatformException catch (e) {
    throw GPlatformException(e.code).message;
  } catch (e) {
    throw "Something went wrong";
  }
}

  //   /// ============================================================
  //   /// FETCH ALL ACCOUNTS
  //   /// ============================================================
  //   Future<List<AccountModel>> fetchAccounts() async {
  //     try {
  //       final uid = AuthenticationRepository.instance.currentUser!.uid;

  //       log("========== FETCH ACCOUNTS ==========");
  //       log("User ID : $uid");

  //       final snapshot = await _db
  //           .collection(GKeys.userCollection)
  //           .doc(uid)
  //           .collection(GKeys.accountCollection)
  //           .get();

  //       log("Documents Found : ${snapshot.docs.length}");

  //       final accounts = snapshot.docs
  //           .map((doc) => AccountModel.fromSnapshot(doc))
  //           .toList();

  //       for (final account in accounts) {
  //         log(
  //           "${account.name} | "
  //           "${account.type} | "
  //           "${account.category} | "
  //           "${account.currentBalance}",
  //         );
  //       }

  //       log("====================================");

  //       return accounts;
  //     } on FirebaseAuthException catch (e) {
  //       throw GFirebaseAuthException(e.code).message;
  //     } on FirebaseException catch (e) {
  //       throw GFirebaseException(e.code).message;
  //     } on FormatException {
  //       throw GFormatException();
  //     } on PlatformException catch (e) {
  //       throw GPlatformException(e.code).message;
  //     } catch (e) {
  //       throw "Something went wrong. Please try again.";
  //     }
  //   }
}
