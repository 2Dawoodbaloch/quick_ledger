import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quick_ledger/features/ledger/controllers/accounts/controller.dart';
import 'package:quick_ledger/features/ledger/controllers/journal/controller.dart';
import 'package:quick_ledger/features/ledger/model/journal/journal_entries_model.dart';
import 'package:quick_ledger/features/ledger/model/journal/journal_line_snapshot.dart';
import 'package:quick_ledger/features/ledger/model/new_journal_entry/journal_line_model.dart';
import 'package:quick_ledger/utils/constants/enum.dart';

class NewJournalEntryController extends GetxController {
  static NewJournalEntryController get instance => Get.find();

  // ============================================================
  // HEADER FIELDS — Journal type, Reference, Date, Narration
  // ============================================================

  final Rx<JournalType> selectedJournalType = JournalType.sales.obs;
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  final narrationController = TextEditingController();
  final dateFormat = DateFormat('MMM d, yyyy');

  /// Auto-generates the next reference number based on how many
  /// entries already exist, e.g. JE-1043. Recalculated each time the
  /// form opens fresh, since JournalController is the source of truth
  /// for how many entries exist.
  String get reference {
    final nextNumber = 1040 + JournalController.instance.allEntries.length;
    return 'JE-$nextNumber';
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

  // ============================================================
  // ACCOUNT OPTIONS — real accounts, read live from AccountController
  // ============================================================

  List<String> get accountOptions =>
      AccountController.instance.allAccounts.map((a) => a.name).toList();

  // ============================================================
  // LINES — add/remove, one-field-active rule, live totals
  // ============================================================

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
    // Listeners recalculate totals live as the user types, and
    // enforce "a line is either debit OR credit, never both" by
    // clearing the opposite field the moment one gets a value.
    line.debitController.addListener(() => _onFieldChanged(line, isDebit: true));
    line.creditController.addListener(() => _onFieldChanged(line, isDebit: false));
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

  // ============================================================
  // BALANCE CHECK
  // ============================================================

  bool get isBalanced => totalDebit.value == totalCredit.value && totalDebit.value > 0;

  double get difference => (totalDebit.value - totalCredit.value).abs();

  /// Post is only allowed once the entry actually balances and has
  /// at least two lines — this is the one rule that protects the
  /// whole ledger's integrity, so it's checked here, not just in the UI.
  bool get canPost => isBalanced && lines.length >= 2;

  // ============================================================
  // BUILD + SAVE — this is where the earlier bug was: _buildEntry()
  // never called anything to freeze the lines, so every posted entry
  // silently had NO line data at all, no matter how the form looked.
  // ============================================================

  /// Freezes each line's account + debit/credit at posting time,
  /// looking up the account's TYPE from AccountController — this is
  /// what Reports/the detail screen need later to know "was this line
  /// an Income account? An Expense account?" without guessing.
  /// Lines with no account selected are skipped (nothing to freeze).
  List<JournalLineSnapshot> _buildLineSnapshots() {
    final accounts = AccountController.instance.allAccounts;

    return lines
        .where((line) => line.accountName.value != null)
        .map((line) {
          final matchedAccount = accounts.firstWhereOrNull(
            (a) => a.name == line.accountName.value,
          );
          // Falls back to `expense` only if somehow no match is found
          // (shouldn't happen since the dropdown only offers real
          // accounts) — safer than crashing.
          final accountType = matchedAccount?.type ?? AccountType.expense;

          return JournalLineSnapshot(
            accountName: line.accountName.value!,
            accountType: accountType,
            debit: double.tryParse(line.debitController.text) ?? 0,
            credit: double.tryParse(line.creditController.text) ?? 0,
          );
        })
        .toList();
  }

  JournalEntryModel _buildEntry(JournalStatus status) {
    return JournalEntryModel(
      reference: reference,
      narration: narrationController.text,
      date: selectedDate.value,
      journalType: selectedJournalType.value,
      status: status,
      amount: totalDebit.value,
      lines: _buildLineSnapshots(), // ← this line was missing before
    );
  }

  void saveAsDraft() {
    JournalController.instance.addEntry(_buildEntry(JournalStatus.draft));
    Get.back();
  }

  void postEntry() {
  if (!canPost) return;

  final entry = _buildEntry(JournalStatus.posted);

  // Update account balances
  AccountController.instance.postJournal(entry);

  // Save journal
  JournalController.instance.addEntry(entry);

  Get.back();
}

  // void postEntry() {
  //   if (!canPost) return;
  //   JournalController.instance.addEntry(_buildEntry(JournalStatus.posted));
  //   Get.back();
  // }

  // ============================================================
  // CLEANUP
  // ============================================================

  @override
  void onClose() {
    narrationController.dispose();
    for (final line in lines) {
      line.dispose();
    }
    super.onClose();
  }
}