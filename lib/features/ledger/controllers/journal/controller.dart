import 'package:get/get.dart';
import 'package:quick_ledger/features/ledger/model/new_journal_entry/journal_entries_model.dart';
import 'package:quick_ledger/utils/constants/enum.dart';

class JournalController extends GetxController {
  static JournalController get instance => Get.find();

  /// Starts empty on purpose — this is what makes the Journals screen
  /// show its empty state by default. Once the "New journal entry"
  /// screen exists, posting an entry will call addEntry() below, and
  /// the screen will automatically flip to the populated list.
  final RxList<JournalEntryModel> allEntries = <JournalEntryModel>[].obs;

  final Rx<JournalType?> selectedFilter = Rx<JournalType?>(null); // null = "All"
  final RxString searchQuery = ''.obs;

  /// Entries after filter + search are applied. The Journals screen
  /// reads this, not allEntries directly, so filtering/searching just
  /// works without the screen needing its own logic.
  List<JournalEntryModel> get filteredEntries {
    return allEntries.where((entry) {
      final matchesFilter =
          selectedFilter.value == null || entry.journalType == selectedFilter.value;
      final matchesSearch = searchQuery.value.isEmpty ||
          entry.reference.toLowerCase().contains(searchQuery.value.toLowerCase()) ||
          entry.narration.toLowerCase().contains(searchQuery.value.toLowerCase());
      return matchesFilter && matchesSearch;
    }).toList();
  }

  /// Home's "recent transactions" reads from here too — this is the
  /// single source of truth both screens pull from.
  List<JournalEntryModel> get recentEntries => allEntries.take(4).toList();

  void setFilter(JournalType? type) => selectedFilter.value = type;

  void setSearchQuery(String query) => searchQuery.value = query;

  void addEntry(JournalEntryModel entry) => allEntries.insert(0, entry);
}