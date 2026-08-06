// import 'package:quick_ledger/utils/constants/enum.dart';
// import '../journal/journal_line_snapshot.dart';

// class JournalEntryModel {
//   final String reference; // e.g. "JE-1042"
//   final String narration; // e.g. "Sales invoice — Acme Corp"
//   final DateTime date;
//   final JournalType journalType;
//   final JournalStatus status;
//   final double amount;


//   // Frozen at posting time — this is what makes Reports possible.
//   // Without knowing which accounts (and account TYPES) each lineche
//   // touched, Profit & Loss / Trial Balance can't be computed for real.
//   final List<JournalLineSnapshot> lines;

//   JournalEntryModel({
//     required this.reference,
//     required this.narration,
//     required this.date,
//     required this.journalType,
//     required this.status,
//     required this.amount,


//     this.lines = const [],
//   });
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quick_ledger/features/ledger/model/journal/journal_line_snapshot.dart';
import 'package:quick_ledger/utils/constants/enum.dart';

class JournalEntryModel {
  final String id;
  final String reference;
  final String narration;
  final DateTime date;
  final JournalType journalType;
  final JournalStatus status;
  final double amount;
  final List<JournalLineSnapshot> lines;

  const JournalEntryModel({
    required this.id,
    required this.reference,
    required this.narration,
    required this.date,
    required this.journalType,
    required this.status,
    required this.amount,
    this.lines = const [],
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "reference": reference,
      "narration": narration,
      "date": Timestamp.fromDate(date),
      "journal_type": journalType.name,
      "status": status.name,
      "amount": amount,
      "lines": lines.map((e) => e.toJson()).toList(),
    };
  }

  factory JournalEntryModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data();

    if (data == null) {
      return JournalEntryModel.empty();
    }

    return JournalEntryModel(
      id: document.id,
      reference: data["reference"] ?? "",
      narration: data["narration"] ?? "",
      date: (data["date"] as Timestamp).toDate(),
      journalType: JournalType.values.firstWhere(
        (e) => e.name == data["journal_type"],
      ),
      status: JournalStatus.values.firstWhere(
        (e) => e.name == data["status"],
      ),
      amount: (data["amount"] as num?)?.toDouble() ?? 0,
      lines: (data["lines"] as List<dynamic>? ?? [])
          .map(
            (e) => JournalLineSnapshot.fromJson(
              Map<String, dynamic>.from(e),
            ),
          )
          .toList(),
    );
  }

  factory JournalEntryModel.fromJson(Map<String, dynamic> json) {
    return JournalEntryModel(
      id: json["id"] ?? "",
      reference: json["reference"] ?? "",
      narration: json["narration"] ?? "",
      date: (json["date"] as Timestamp).toDate(),
      journalType: JournalType.values.firstWhere(
        (e) => e.name == json["journal_type"],
      ),
      status: JournalStatus.values.firstWhere(
        (e) => e.name == json["status"],
      ),
      amount: (json["amount"] as num?)?.toDouble() ?? 0,
      lines: (json["lines"] as List<dynamic>? ?? [])
          .map(
            (e) => JournalLineSnapshot.fromJson(
              Map<String, dynamic>.from(e),
            ),
          )
          .toList(),
    );
  }

  factory JournalEntryModel.empty() {
    return JournalEntryModel(
      id: "",
      reference: "",
      narration: "",
      date: DateTime.now(),
      journalType: JournalType.cash,
      status: JournalStatus.posted,
      amount: 0,
      lines: const [],
    );
  }
}