
import 'package:get/get.dart';
import 'package:quick_ledger/features/ledger/controllers/new_journal_entry/new_journal_entry_controller.dart';

class NewJournalEntryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewJournalEntryController>(() => NewJournalEntryController());
  }
}