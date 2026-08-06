import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quick_ledger/data/repositories/journal/journal_repository.dart';
import 'package:quick_ledger/features/ledger/controllers/accounts/account_controller.dart';
import 'package:quick_ledger/features/ledger/controllers/journal/journal_controller.dart';
import 'package:quick_ledger/features/ledger/model/accounts/account_model.dart';
import 'package:quick_ledger/features/ledger/model/new_journal_entry/journal_entries_model.dart';
import 'package:quick_ledger/features/ledger/model/journal/journal_line_snapshot.dart';
import 'package:quick_ledger/features/ledger/model/new_journal_entry/journal_line_model.dart';
import 'package:quick_ledger/utils/constants/enum.dart';

class NewJournalEntryController extends GetxController {
  static NewJournalEntryController get instance => Get.find();
  final controller = JournalRepository.instance;

  final Rx<JournalType> selectedJournalType = JournalType.sales.obs;
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final narrationController = TextEditingController();
  final dateFormat = DateFormat('MMM d, yyyy');
  final id = DateTime.now().millisecondsSinceEpoch.toString();

  String get reference {
    final reference = "JE-${id.substring(id.length - 6)}";
    return reference;
  }

  String get formattedDate => dateFormat.format(selectedDate.value);

  void setJournalType(JournalType? type) {
    if (type != null) selectedJournalType.value = type;
  }

  Future<void> pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) selectedDate.value = picked;
  }


  // ACCOUNT OPTIONS — real accounts, read live from AccountController

  List<AccountModel> get accountOptions =>
      AccountController.instance.allAccounts;

  // LINES — add/remove, one-field-active rule, live totals


  /// Starts with two blank lines — a journal entry always needs at
  /// least two, since every debit needs an offsetting credit.
  final RxList<JournalLineModel> lines = <JournalLineModel>[].obs;

  final RxDouble totalDebit = 0.0.obs;
  final RxDouble totalCredit = 0.0.obs;

  bool _isClearing = false; // guards against listener feedback loops

  @override
  void onInit() {
    super.onInit();
    addLine();
    addLine();
  }

  void addLine() {
    final line = JournalLineModel();

    line.debitController.addListener(
      () => _onFieldChanged(line, isDebit: true),
    );
    line.creditController.addListener(
      () => _onFieldChanged(line, isDebit: false),
    );
    lines.add(line);
  }

  void removeLine(int index) {
    lines[index].dispose();
    lines.removeAt(index);
    _recalculateTotals();
  }

  void _onFieldChanged(JournalLineModel line, {required bool isDebit}) {
    if (_isClearing) return;

    final debitValue = double.tryParse(line.debitController.text) ?? 0;
    final creditValue = double.tryParse(line.creditController.text) ?? 0;

    if (isDebit && debitValue > 0 && creditValue > 0) {
      _isClearing = true;
      line.creditController.clear();
      _isClearing = false;
    } else if (!isDebit && creditValue > 0 && debitValue > 0) {
      _isClearing = true;
      line.debitController.clear();
      _isClearing = false;
    }

    _recalculateTotals();
  }

  void _recalculateTotals() {
    double debitSum = 0;
    double creditSum = 0;
    for (final line in lines) {
      debitSum += double.tryParse(line.debitController.text) ?? 0;
      creditSum += double.tryParse(line.creditController.text) ?? 0;
    }
    totalDebit.value = debitSum;
    totalCredit.value = creditSum;
  }

  bool get isBalanced =>
      totalDebit.value == totalCredit.value && totalDebit.value > 0;

  double get difference => (totalDebit.value - totalCredit.value).abs();

  bool get canPost => isBalanced && lines.length >= 2;

  List<JournalLineSnapshot> _buildLineSnapshots() {
    log("=========== BUILD SNAPSHOTS ===========", name: "JOURNAL");

    return lines.where((line) => line.account.value != null).map((line) {
      final account = line.account.value!;

      log('''
Account ID   : ${account.id}
Account Code : ${account.code}
Account Name : ${account.name}
Type         : ${account.type}
Category     : ${account.category}
Debit        : ${line.debitController.text}
Credit       : ${line.creditController.text}
''', name: "LINE");

      return JournalLineSnapshot(
        accountId: account.id,
        accountCode: account.code,
        accountName: account.name,
        accountType: account.type,
        debit: double.tryParse(line.debitController.text) ?? 0,
        credit: double.tryParse(line.creditController.text) ?? 0,
      );
    }).toList();
  }

  JournalEntryModel _buildEntry(JournalStatus status) {
    final ids = DateTime.now().millisecondsSinceEpoch.toString();
    return JournalEntryModel(
      id: ids,
      reference: reference,
      narration: narrationController.text,
      date: selectedDate.value,
      journalType: selectedJournalType.value,
      status: status,
      amount: totalDebit.value,
      lines: _buildLineSnapshots(), // ← this line was missing before
    );
  }

  // void saveAsDraft() {
  //   JournalController.instance.addEntry(_buildEntry(JournalStatus.draft));
  //   Get.back();
  // }

  Future<void> postEntry() async {
    if (!canPost) return;

    final entry = _buildEntry(JournalStatus.posted);

    // Update account balances
   await  AccountController.instance.postJournal(entry);

    // Save journal
    await controller.addJournal(entry);
    Get.back();
  }

  @override
  void onClose() {
    narrationController.dispose();
    for (final line in lines) {
      line.dispose();
    }
    super.onClose();
  }
}
