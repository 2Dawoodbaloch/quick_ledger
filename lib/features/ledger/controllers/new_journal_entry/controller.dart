import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:quick_ledger/features/ledger/controllers/journal/controller.dart';
import 'package:quick_ledger/features/ledger/controllers/model/new_journal_entry/journal_entries_model.dart';
import 'package:quick_ledger/features/ledger/controllers/model/new_journal_entry/journal_line_model.dart';
import 'package:quick_ledger/utils/constants/enum.dart';



// this is just a placeholder list so the dropdown has something to
// show while building the UI.
const List<String> kPlaceholderAccountNames = [
  'Cash in hand',
  'Bank account',
  'Accounts receivable',
  'Accounts payable',
  'Sales revenue',
  'Rent expense',
  'Payroll expense',
];

class NewJournalEntryController extends GetxController {
  static NewJournalEntryController get instance => Get.find();

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

  // ============================================================
  // LINES
  // ============================================================

  /// Starts with two blank lines — a journal entry always needs at
  /// least two, since every debit needs an offsetting credit.
  final RxList<JournalLineModel> lines = <JournalLineModel>[].obs;

  final RxDouble totalDebit = 0.0.obs;
  final RxDouble totalCredit = 0.0.obs;

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

  bool _isClearing = false; // guards against listener feedback loops

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

  bool get isBalanced => totalDebit.value == totalCredit.value && totalDebit.value > 0;

  double get difference => (totalDebit.value - totalCredit.value).abs();

  /// Post is only allowed once the entry actually balances and has
  /// at least two lines — this is the one rule that protects the
  /// whole ledger's integrity, so it's checked here, not just in the UI.
  bool get canPost => isBalanced && lines.length >= 2;

  JournalEntryModel _buildEntry(JournalStatus status) {
    return JournalEntryModel(
      reference: reference,
      narration: narrationController.text,
      date: selectedDate.value,
      journalType: selectedJournalType.value,
      status: status,
      amount: totalDebit.value,
    );
  }

  void saveAsDraft() {
    JournalController.instance.addEntry(_buildEntry(JournalStatus.draft));
    Get.back();
  }

  void postEntry() {
    if (!canPost) return;
    JournalController.instance.addEntry(_buildEntry(JournalStatus.posted));
    Get.back();
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

  @override
  void onClose() {
    narrationController.dispose();
    for (final line in lines) {
      line.dispose();
    }
    super.onClose();
  }
}
