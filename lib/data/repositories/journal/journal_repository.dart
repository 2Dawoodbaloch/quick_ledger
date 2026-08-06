import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quick_ledger/data/repositories/authentication_repository.dart';
import 'package:quick_ledger/features/ledger/model/new_journal_entry/journal_entries_model.dart';
import 'package:quick_ledger/utils/constants/keys/keys.dart';
import 'package:quick_ledger/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:quick_ledger/utils/exceptions/firebase_exceptions.dart';
import 'package:quick_ledger/utils/exceptions/format_exceptions.dart';
import 'package:quick_ledger/utils/exceptions/platform_exceptions.dart';

class JournalRepository extends GetxController {
  static JournalRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _journalCollection {
    final uid = AuthenticationRepository.instance.currentUser!.uid;

    return _db
        .collection(GKeys.userCollection)
        .doc(uid)
        .collection(GKeys.journalCollection);
  }

  /// ==========================================================
  /// ADD JOURNAL
  /// ==========================================================

  Future<void> addJournal(JournalEntryModel journal) async {
    try {
      log("========== ADD JOURNAL ==========");
      log("Reference : ${journal.reference}");
      log("Amount    : ${journal.amount}");
      log("Lines     : ${journal.lines.length}");

      await _journalCollection.doc(journal.id).set(journal.toJson());

      log("Journal saved successfully.");
    } on FirebaseAuthException catch (e) {
      throw GFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw GFirebaseException(e.code).message;
    } on FormatException {
      throw GFormatException();
    } on PlatformException catch (e) {
      throw GPlatformException(e.code).message;
    } catch (e) {
      log("Journal Save Error : $e");
      throw 'Something went wrong, Please try again';
    }
  }

  /// ==========================================================
  /// STREAM JOURNALS
  /// ==========================================================

  Stream<List<JournalEntryModel>> streamJournals() {
    try {
      log("Listening to journal stream...");

      return _journalCollection
          .orderBy("date", descending: true)
          .snapshots()
          .map((snapshot) {
        log(
          "Journal Stream Updated. Total Journals : ${snapshot.docs.length}",
        );

        return snapshot.docs
            .map((doc) => JournalEntryModel.fromSnapshot(doc))
            .toList();
      });
    } catch (e) {
      log("Journal Stream Error : $e");
      rethrow;
    }
  }
}