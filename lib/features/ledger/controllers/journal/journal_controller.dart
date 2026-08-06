import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:quick_ledger/data/repositories/journal/journal_repository.dart';
import 'package:quick_ledger/features/ledger/model/new_journal_entry/journal_entries_model.dart';
import 'package:quick_ledger/utils/constants/enum.dart';

class JournalController extends GetxController {
  static JournalController get instance => Get.find();

  final JournalRepository _journalRepository = Get.find<JournalRepository>();

  /// Local cache used by the UI.
  final RxList<JournalEntryModel> allEntries = <JournalEntryModel>[].obs;

  /// Keep the subscription so we can cancel it later.
  late final StreamSubscription<List<JournalEntryModel>>
      _journalSubscription;

  /// Filters
  final Rx<JournalType?> selectedFilter = Rx<JournalType?>(null);
  final RxString searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _listenToJournals();
  }

  void _listenToJournals() {
    log("Starting Journal Stream...", name: "JOURNAL");

    _journalSubscription = _journalRepository
        .streamJournals()
        .listen(
      (journals) {
        allEntries.assignAll(journals);

        log(
          "Journal stream updated. Total Journals: ${allEntries.length}",
          name: "JOURNAL",
        );
      },
      onError: (error) {
        log(
          "Journal Stream Error: $error",
          name: "JOURNAL",
        );
      },
    );
  }

  /// Filter + Search
  List<JournalEntryModel> get filteredEntries {
    return allEntries.where((entry) {
      final matchesFilter =
          selectedFilter.value == null ||
          entry.journalType == selectedFilter.value;

      final matchesSearch =
          searchQuery.value.isEmpty ||
          entry.reference.toLowerCase().contains(
                searchQuery.value.toLowerCase(),
              ) ||
          entry.narration.toLowerCase().contains(
                searchQuery.value.toLowerCase(),
              );

      return matchesFilter && matchesSearch;
    }).toList();
  }

  /// Recent Transactions for Home Screen
  List<JournalEntryModel> get recentEntries =>
      allEntries.take(4).toList();

  /// Filter
  void setFilter(JournalType? type) {
    selectedFilter.value = type;
  }

  /// Search
  void setSearchQuery(String query) {
    searchQuery.value = query;
  }

  @override
  void onClose() {
    _journalSubscription.cancel();
    super.onClose();
  }
}