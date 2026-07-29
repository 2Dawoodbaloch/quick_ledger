
import 'package:get/get.dart';
import 'package:quick_ledger/features/ledger/controllers/new_journal_entry/controller.dart';

class NewJournalEntryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewJournalEntryController>(() => NewJournalEntryController());
    // Get.put(NewJournalEntryController());
  }
}